class ChargesController < ApplicationController


	def new1
	end

	def create1
	  # Amount in cents
	  @amount = 500

	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail],
	    :source  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )
	  # ここでWebhookさせた場合はどうなるか？
	  notify_to_slack

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end


	# subscriptionのやつをここに実装する
	def new
	end

	def create
		# Set your secret key: remember to change this to your live secret key in production
		# See your keys here: https://dashboard.stripe.com/account/apikeys
		Stripe.api_key = "sk_test_btd1eRC1Pc3QpDUsloWc7YkS"

		require "stripe"
		Stripe.api_key = "sk_test_btd1eRC1Pc3QpDUsloWc7YkS"

		Stripe::Plan.create(
		  :amount => 3000,
		  :interval => "month",
		  :name => "サブスクリプション",
		  :currency => "jpy",
		  :id => "quartz-standard"
		)

		plan = Stripe::Plan.create(
		  :name => "Basic Plan",
		  :id => "basic-monthly",
		  :interval => "month",
		  :currency => "usd",
		  :amount => 0,
		)

		customer = Stripe::Customer.create(
		  :email => "jenny.rosen@example.com",
		)

		Stripe::Subscription.create(
		  :customer => customer.id,
		  :items => [
		    {
		      :plan => "basic-monthly",
		    },
		  ],
		)

		notify_to_slack

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end


	private

# 仮の項目
	def text
    text = <<-EOC
-----------------------------
[#{Rails.env}] 新しい申し込みがありました。

▼stripe_account_id
▼メールアドレス
▼名前
▼金額
#{@amount}円
▼プラン
    EOC
    text
  	end

  	def notify_to_slack
    notifier_sub = Slack::Notifier.new('https://hooks.slack.com/services/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') 
    notifier_sub.ping(text)
  end


end
