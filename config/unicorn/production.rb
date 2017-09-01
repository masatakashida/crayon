WORKING_DIR = "/home/deploy/crayon/current"

worker_processes 2 # ワーカプロセス数
working_directory "#{WORKING_DIR}"

#listen "/var/run/nginx-rails.sock" # ソケットファイル
#listen 8080
listen "#{WORKING_DIR}/tmp/sockets/unicorn.sock"

pid    "tmp/pids/unicorn.pid"  # pidファイル

# 標準出力、標準エラー出力先
stdout_path "log/unicorn.stdout.log"
stderr_path "log/unicorn.stderr.log"


