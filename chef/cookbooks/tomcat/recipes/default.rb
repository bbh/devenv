#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2013, Basilio Briceno
#

# Install Java 7
execute "install-java" do
  command "yum -y install java7"
  action :run
end

# Download Tomcat 8
remote_file "#{Chef::Config[:file_cache_path]}/apache-tomcat-#{node['tomcat']['version']}.tar.gz" do
  checksum node['tomcat']['checksum']
  source "http://mirror.tcpdiag.net/apache/tomcat/tomcat-8/v#{node['tomcat']['version']}/bin/apache-tomcat-#{node['tomcat']['version']}.tar.gz"
  mode "0664"
end

# Install Tomcat
execute "tomcat-install" do
  command "mkdir #{node['tomcat']['directory']};" +
          "tar xfz #{Chef::Config[:file_cache_path]}/apache-tomcat-#{node['tomcat']['version']}.tar.gz " +
          "--directory=#{node['tomcat']['directory']};" +
          "echo \"CATALINA_HOME=#{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}\" > /etc/environment;" +
          "chown -R #{node['tomcat']['username']}.#{node['tomcat']['username']} #{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}"
  action :run
end

# Add Tomcat roles and users
template "#{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}/conf/tomcat-users.xml" do
  source "tomcat-users.xml.erb"
  owner "vagrant"
  group "vagrant"
  mode "0600"
end

# Add Tomcat port to iptables
template "/etc/sysconfig/iptables" do
  source "iptables.erb"
  owner "root"
  group "root"
  mode "0600"
end

# Restart iptables
service "iptables" do
  action :restart
end

# Start Tomcat
execute "tomcat-start" do
  command "#{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}/bin/catalina.sh start"
  user "vagrant"
  action :run
end
