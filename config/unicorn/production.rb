WORKING_DIR = "/home/deploy/crayon/current"

worker_processes 2 # ワーカプロセス数
working_directory "#{WORKING_DIR}"

listen 8080
listen "#{WORKING_DIR}/tmp/sockets/unicorn.sock"

pid    "tmp/pids/unicorn.pid"  # pidファイル

# 標準出力、標準エラー出力先
stdout_path "log/unicorn.stdout.log"
stderr_path "log/unicorn.stderr.log"

# combine Ruby 2.0.0dev or REE with "preload_app true" for memory savings
# http://rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
preload_app true
GC.respond_to?(:copy_on_write_friendly=) and
  GC.copy_on_write_friendly = true

# Enable this flag to have unicorn test client connections by writing the
# beginning of the HTTP headers before calling the application.  This
# prevents calling the application for connections that have disconnected
# while queued.  This is only guaranteed to detect clients on the same
# host unicorn runs on, and unlikely to detect disconnects even on a
# fast LAN.
check_client_connection false

before_fork do |server, worker|
  # the following is highly recomended for Rails + "preload_app true"
  # as there's no need for the master process to hold a connection
  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!

  if Rails.application.config.session_store <= ActionDispatch::Session::MemCacheStore
    Rails.logger.info "##UNICORN WILL FORK## pid=#{$$}"
    ObjectSpace.each_object(ActionDispatch::Session::MemCacheStore) do |obj|
      Rails.logger.info "##RESET MEMCACHED CONNECTION## pid=#{$$}"
      obj.instance_variable_get(:@pool).reset
    end
  end
end

after_fork do |server, worker|
  # GC.disable
  # the following is *required* for Rails + "preload_app true",
  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.establish_connection
  defined?(MultiDb) and
      MultiDb::ConnectionProxy.setup!


  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{WORKING_DIR}/Gemfile"
end

