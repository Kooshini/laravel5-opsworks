## Recipe to set-up the Laravel env file (/.env)
node[:deploy].each do |app_name, deploy|
	template "#{deploy[:deploy_to]}/current/.env" do
		source "env.erb"
		mode 0664
		group deploy[:group]
		owner "www-data"
		
		## Get the environment_variables from the OpsWorks console 
		## and copy them into the variables to be passed to the template in ../templates/default/
		 variables({
			:APP_ENV => deploy[:environment_variables][:APP_ENV],
			:APP_DEBUG => deploy[:environment_variables][:APP_DEBUG],
			:APP_KEY => deploy[:environment_variables][:APP_KEY],
			:DB_HOST => deploy[:environment_variables][:DB_HOST],
			:DB_NAME => deploy[:environment_variables][:DB_NAME],
			:DB_USER => deploy[:environment_variables][:DB_USER],
			:DB_PASS => deploy[:environment_variables][:DB_PASS],
			:CACHE_DRIVER => deploy[:environment_variables][:CACHE_DRIVER],
			:MAIL_DRIVER => deploy[:environment_variables][:MAIL_DRIVER],
			:MAIL_HOST => deploy[:environment_variables][:MAIL_HOST],
			:MAIL_PORT => deploy[:environment_variables][:MAIL_PORT],
			:MAIL_USER => deploy[:environment_variables][:MAIL_USER],
			:MAIL_PASS => deploy[:environment_variables][:MAIL_PASS],
			:MAIL_ENCRYPTION => deploy[:environment_variables][:MAIL_ENCRYPTION],
			:MANDRILL_SECRET => deploy[:environment_variables][:MANDRILL_SECRET],
			:SENTRY_DSN => deploy[:environment_variables][:SENTRY_DSN],
			:AWS_KEY => deploy[:environment_variables][:AWS_KEY],
			:AWS_SECRET => deploy[:environment_variables][:AWS_SECRET],
			:AWS_BUCKET => deploy[:environment_variables][:AWS_BUCKET],
			:AWS_REGION => deploy[:environment_variables][:AWS_REGION],
			:GOCARDLESS_APP_ID => deploy[:environment_variables][:GOCARDLESS_APP_ID],
			:GOCARDLESS_SECRET => deploy[:environment_variables][:GOCARDLESS_SECRET],
			:GOCARDLESS_MERCH_ID => deploy[:environment_variables][:GOCARDLESS_MERCH_ID],
			:GOCARDLESS_ACCESS_TOKEN => deploy[:environment_variables][:GOCARDLESS_ACCESS_TOKEN],
			:STRIPE_KEY => deploy[:environment_variables][:STRIPE_KEY],
			:STRIPE_SECRET => deploy[:environment_variables][:STRIPE_SECRET],
			:STRIPE_MODEL => deploy[:environment_variables][:STRIPE_MODEL],
			:BROADCAST_DRIVER => deploy[:environment_variables][:BROADCAST_DRIVER],
			:PUSHER_APP_ID => deploy[:environment_variables][:PUSHER_APP_ID],
			:PUSHER_KEY => deploy[:environment_variables][:PUSHER_KEY],
			:PUSHER_SECRET => deploy[:environment_variables][:PUSHER_SECRET],
			:QUEUE_DRIVER => deploy[:environment_variables][:QUEUE_DRIVER],
			:QUEUE_HOST => deploy[:environment_variables][:QUEUE_HOST],
			:QUEUE_TOKEN => deploy[:environment_variables][:QUEUE_TOKEN],
			:QUEUE_PROJECT => deploy[:environment_variables][:QUEUE_PROJECT],
			:QUEUE_NAME => deploy[:environment_variables][:QUEUE_NAME]
		})
	end
end
