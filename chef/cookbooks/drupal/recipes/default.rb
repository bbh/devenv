#
# Cookbook Name:: drupal
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
  command "/usr/bin/mysqladmin -u root create #{node['drupal']['db']['database']}"
  action :run
end

# Prepare SQL permissions script for execution
execute "permissions" do
  command "/usr/bin/mysql -u root < /tmp/drupal-permissions.sql"
  action :nothing
end

# Create SQL permissions script and execute it
template "/tmp/drupal-permissions.sql" do
  source "permissions.sql.erb"
  owner "root"
  group "root"
  mode "0600"
  variables( :username => node['drupal']['db']['username'],
             :password => node['drupal']['db']['password'],
             :database => node['drupal']['db']['database'] )
  notifies :run, "execute[permissions]", :immediately
end

# Install Apache
package "httpd" do
  action :install
end

# Install PHP and it's extensions
["php", "php-mysqli", "php-common", "php-gd", "php-mbstring", "php-devel",
 "php-xml"].each do |php|
  package php do
    action :install
  end
end

# Download Drupal
remote_file "#{Chef::Config[:file_cache_path]}/drupal-#{node['drupal']['version']}.tar.gz" do
  checksum node['drupal']['checksum']
  source "http://ftp.drupal.org/files/projects/drupal-#{node['drupal']['version']}.tar.gz"
  mode "0644"
end

# Create Drupal directory
directory "#{node['drupal']['dir']}" do
  owner "root"
  group "root"
  mode "0755"
  action :create
  recursive true
end

# Untar Drupal
execute "untar-drupal" do
  cwd "#{node['drupal']['dir']}/../"
  command "rm -rf drupal && tar xzf #{Chef::Config[:file_cache_path]}/" <<
          "drupal-#{node['drupal']['version']}.tar.gz && " <<
          "mv drupal-#{node['drupal']['version']} drupal"
  action :run
end

# Add Apache vhost configuration
template "/etc/httpd/conf.d/drupal_#{node['drupal']['hostname']}.conf" do
  source "httpd.conf.erb"
  owner "root"
  group "root"
  mode "0600"
  action :create
end

# Add the Drupal configuration
template "#{node['drupal']['dir']}/sites/default/settings.php" do
  source "settings.php.erb"
  owner "root"
  group "root"
  mode "0666"
  action :create
end

# Create Site files directory
directory "#{node['drupal']['dir']}/sites/default/files" do
  owner "root"
  group "root"
  mode "0777"
  action :create
  recursive true
end

# Create Drupal logs directory
directory "#{node['drupal']['log_dir']}" do
  owner "apache"
  group "apache"
  mode "0755"
  action :create
  recursive true
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