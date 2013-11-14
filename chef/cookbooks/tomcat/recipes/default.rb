#
# Cookbook Name:: tomcat
# Recipe:: default
#
# Copyright 2013, Basilio Briceno
#

# Install Java 7
if node['java']['install'] == 'remote'
  # install from repository
  execute "install-java-local" do
    command "yum -y install java7"
    action :run
  end
elsif node['java']['install'] == 'local'
  # install from local RPM file
  cookbook_file "#{Chef::Config[:file_cache_path]}/jre-7u45-linux-x64.rpm" do
    source "jre-7u45-linux-x64.rpm"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?("#{Chef::Config[:file_cache_path]}/jre-7u45-linux-x64.rpm") }
  end
  execute "install-java-remote" do
    command "rpm -i #{Chef::Config[:file_cache_path]}/jre-7u45-linux-x64.rpm"
    action :run
  end
end

tomcat_temp_path="#{Chef::Config[:file_cache_path]}/apache-tomcat-#{node['tomcat']['version']}.tar.gz"

# Download Tomcat 8
if node['tomcat']['install'] == 'remote'
  remote_file tomcat_temp_path do
    checksum node['tomcat']['checksum']
    source "#{node['tomcat']['mirror']}/v#{node['tomcat']['version']}/bin/apache-tomcat-#{node['tomcat']['version']}.tar.gz"
    mode "0664"
    not_if { ::File.exists?(tomcat_temp_path) }
  end
elsif node['tomcat']['install'] == 'local'
  cookbook_file tomcat_temp_path do
    source "apache-tomcat-#{node['tomcat']['version']}.tar.gz"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(tomcat_temp_path) }
  end
end

# Install Tomcat
execute "tomcat-install" do
  command "mkdir #{node['tomcat']['directory']};" +
          "tar xfz #{Chef::Config[:file_cache_path]}/apache-tomcat-#{node['tomcat']['version']}.tar.gz " +
          "--directory=#{node['tomcat']['directory']};" +
          "echo \"CATALINA_HOME=#{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}\" >> /etc/environment;" +
          "chown -R #{node['tomcat']['username']}.#{node['tomcat']['username']} #{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}"
  action :run
  not_if { ::File.exists?("#{node['tomcat']['directory']}/apache-tomcat-#{node['tomcat']['version']}") }
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
