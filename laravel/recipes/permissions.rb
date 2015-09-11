## Recipe to set recursive permissions for the Laravel storage folder /app/storage/*
node[:deploy].each do |app_name, deploy|
	if platform_family?('debian')
		execute "set permissions for #{deploy[:deploy_to]}/current/storage/" do
		command "sudo chown deploy:www-data -R #{deploy[:deploy_to]}/current/storage/"
		command "sudo chown deploy:www-data -R #{deploy[:deploy_to]}/current/bootstrap/cache/"
		command "sudo chmod 0777 -Rf #{deploy[:deploy_to]}/current/storage/"
		command "sudo chmod 0777 -Rf #{deploy[:deploy_to]}/current/bootstrap/cache/"
	  end
	end
end
