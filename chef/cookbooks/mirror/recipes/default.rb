#
# Cookbook Name:: mirror
# Recipe:: default
#
# Copyright 2013, Basilio Briceno
#

template "/etc/yum.repos.d/CentOS-Base.repo" do
  source "CentOS-Base.repo.erb"
  owner "root"
  group "root"
  mode "0644"
end
