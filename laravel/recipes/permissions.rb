## Recipe to set recursive permissions for the Laravel storage folder /storage/ and bootstrap folders*
node[:deploy].each do |app_name, deploy|
	storage_folder = "#{deploy[:deploy_to]}/current/storage"
	cache_folder = "#{deploy[:deploy_to]}/current/bootstrap/cache"
	if platform_family?('debian')
		execute "set permissions for storage and cache folders" do
		directory storage_folder do 
		  mode 0777
		  owner 'www-data'
		  group 'www-data'
		  recursive true
		  action :create
		end
		directory cache_folder do
		  mode 0777
		  owner 'www-data'
		  group 'www-data'
		  recursive true
		  action :create
		end
	  end
	end
end
