#
# Cookbook Name:: jenkins
# Recipe:: default
#
# Copyright 2013, Basilio Briceno
#

# Download ANT
ant_tmp_path="#{Chef::Config[:file_cache_path]}/apache-ant-#{node['ant']['version']}-bin.tar.gz"
if node['ant']['install'] == 'remote'
  remote_file ant_tmp_path do
    checksum node['ant']['checksum']
    source "#{node['ant']['mirror']}/apache-ant-#{node['ant']['version']}-bin.tar.gz"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(ant_tmp_path) }
  end
elsif node['ant']['install'] == 'local'
  cookbook_file ant_tmp_path do
    source "apache-ant-#{node['ant']['version']}-bin.tar.gz"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(ant_tmp_path) }
  end
end

# Install ANT
execute "install-ant" do
  command "mkdir #{node['ant']['directory']};" +
          "tar xfz #{ant_tmp_path} " +
          "--directory=#{node['ant']['directory']};" +
          "echo \"ANT_HOME=#{node['ant']['directory']}/apache-ant-#{node['ant']['version']}\" >> /etc/environment;" +
          "chown -R #{node['ant']['username']}.#{node['ant']['username']} #{node['ant']['directory']}/apache-ant-#{node['ant']['version']}"
  action :run
end

# Download Maven
maven_tmp_path="#{Chef::Config[:file_cache_path]}/apache-maven-#{node['maven']['version']}-bin.tar.gz"
if node['maven']['install'] == 'remote'
  remote_file maven_tmp_path do
    checksum node['maven']['checksum']
    source "#{node['maven']['mirror']}/#{node['maven']['version']}/binaries/apache-maven-#{node['maven']['version']}-bin.tar.gz"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(maven_tmp_path) }
  end
elsif node['maven']['install'] == 'local'
  cookbook_file maven_tmp_path do
    source "apache-maven-#{node['maven']['version']}-bin.tar.gz"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(maven_tmp_path) }
  end
end

# Install Maven
execute "install-maven" do
  command "mkdir #{node['maven']['directory']};" +
          "tar xfz #{maven_tmp_path} " +
          "--directory=#{node['maven']['directory']};" +
          "echo \"MAVEN_HOME=#{node['maven']['directory']}/apache-maven-#{node['maven']['version']}\" >> /etc/environment;" +
          "chown -R #{node['maven']['username']}.#{node['maven']['username']} #{node['maven']['directory']}/apache-maven-#{node['maven']['version']}"
  action :run
end

# Download Jenkins
jenkins_tmp_path="#{Chef::Config[:file_cache_path]}/jenkins.war"
if node['jenkins']['install'] == 'remote'
  remote_file jenkins_tmp_path do
    source "#{node['jenkins']['mirror']}"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(jenkins_tmp_path) }
  end
elsif node['jenkins']['install'] == 'local'
  cookbook_file jenkins_tmp_path do
    source "jenkins.war"
    mode 0664
    owner "vagrant"
    group "vagrant"
    not_if { ::File.exists?(jenkins_tmp_path) }
  end
end

# Install Maven
execute "install-jenkins" do
  command "mv #{jenkins_tmp_path} #{node['jenkins']['directory']}/"
  action :run
end
