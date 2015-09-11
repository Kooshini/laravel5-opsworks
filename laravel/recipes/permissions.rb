## Recipe to set recursive permissions for the Laravel storage folder /storage/ and bootstrap folders*
node[:deploy].each do |app_name, deploy|
	app_root = "#{deploy_config[:deploy_to]}/current"
	if platform_family?('debian')
		execute "set permissions for #{app_root}/storage" do
		directory "#{app_root}/storage" do
		  mode 0777
		  owner 'www-data'
		  group 'www-data'
		  recursive: true
		  action :create
		end
		directory "#{app_root}/bootstrap/cache" do
		  mode 0777
		  owner 'www-data'
		  group 'www-data'
		  recursive: true
		  action :create
		end
		command "sudo chmod 0777 -Rf #{deploy[:deploy_to]}/current/storage/"
	  end
	end
end
