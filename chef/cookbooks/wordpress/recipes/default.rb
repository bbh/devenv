#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2013, Basilio Briceno
#

# Install MySQL
package "mysql-server" do
  action :install
end

# Start MySQL server
service "mysqld" do
  action :enable
  action :start
end

# Create database
execute "createdb" do
  command "/usr/bin/mysqladmin -u root create #{node['wp']['db']['database']}"
  action :run
end

# Prepare SQL permissions script for execution
execute "wp_permissions" do
  command "/usr/bin/mysql -u root < /tmp/wp-permissions.sql"
  action :nothing
end

# Create SQL permissions script and execute it
template "/tmp/wp-permissions.sql" do
  source "wp-permissions.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables( :username => node['wp']['db']['username'],
             :password => node['wp']['db']['password'],
             :database => node['wp']['db']['database'] )
  notifies :run, "execute[wp_permissions]", :immediately
end

# Install Apache
package "httpd" do
  action :install
end

# create script to add server name and avoid common error at starting

# Install PHP and it's extensions
["php", "php-mysql", "php-common", "php-gd", "php-mbstring", "php-devel",
 "php-xml"].each do |php|
  package php do
    action :install
  end
end

# Download Wordpress
remote_file "#{Chef::Config[:file_cache_path]}/wp-#{node['wp']['version']}.tar.gz" do
  checksum node['wp']['checksum']
  source "http://wordpress.org/wordpress-#{node['wp']['version']}.tar.gz"
  mode "0644"
end

# Create Wordpress directory
directory "#{node['wp']['dir']}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# Create Wordpress logs directory
directory "#{node['wp']['log_dir']}" do
  owner "apache"
  group "apache"
  mode "0755"
  action :create
  recursive true
end

# Untar Wordpress
execute "untar-wordpress" do
  cwd node['wp']['dir']
  command "tar xzf #{Chef::Config[:file_cache_path]}/wp-#{node['wp']['version']}.tar.gz && mv wordpress/* . && rm -rf wordpress"
  action :run
end

# Add Apache vhost configuration
template "/etc/httpd/conf.d/wp_#{node['wp']['hostname']}.conf" do
  source "wp-httpd.conf.erb"
  owner "root"
  group "root"
  mode "0600"
  action :create
end

# Add the Wordpress configuration
template "#{node['wp']['dir']}/wp-config.php" do
  source "wp-config.php.erb"
  owner "root"
  group "root"
  mode "0644"
  action :create
end

# Download keys and salt
execute "get_salt" do
  command "wget -O #{node['wp']['dir']}/wp-config-keys.php https://api.wordpress.org/secret-key/1.1/salt/"
  action :run
end

# Start Apache
service "httpd" do
  action :enable
  action :start
end

# Stop Firewall rules to have access
# TODO. Create a rule instead of stoping
service "iptables" do
  action :stop
end

# # Install git to deploy custom themes and plugins
# package "git" do
#   action [:install]
# end