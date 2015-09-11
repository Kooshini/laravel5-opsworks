## Recipe to create directories and set permissions for the Laravel folders /storage and /bootstrap/cache 
	node[:deploy].each do |app_name, deploy|
		       directory "#{deploy[:deploy_to]}/current/storage" do 
			 recursive true
			 action :delete
			end
			directory "#{deploy[:deploy_to]}/current/bootstrap/cache" do  
			 recursive true
			 action :delete
			end
			directory "#{deploy[:deploy_to]}/current/storage" do 
			  mode 0777
			  owner 'www-data'
			  group 'www-data'
			  recursive true
			  action :create
			end
			directory "#{deploy[:deploy_to]}/current/storage/logs" do 
			  mode 0777
			  owner 'www-data'
			  group 'www-data'
			  recursive true
			  action :create
			end
			directory "#{deploy[:deploy_to]}/current/bootstrap/cache" do 
			  mode 0777
			  owner 'www-data'
			  group 'www-data'
			  recursive true
			  action :create
			end
	end
