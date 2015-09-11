## Recipe to set recursive permissions for the Laravel storage folder /storage and /bootstrap folders*
	node[:deploy].each do |app_name, deploy|
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
