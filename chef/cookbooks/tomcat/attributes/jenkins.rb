# General settings
default['ant']['install'] = "local"
default['ant']['version'] = "1.9.2"
default['ant']['mirror'] = "http://www.us.apache.org/dist/ant/binaries"
default['ant']['checksum'] = "fa2c18a27cdf407f5d8306bbc0f0b29513d915d8"
default['ant']['directory'] = "/usr/local/ant"
default['ant']['username'] = "vagrant"

default['maven']['install'] = "local"
default['maven']['version'] = "3.1.1"
default['maven']['mirror'] = "http://www.us.apache.org/dist/maven/maven-3"
default['maven']['checksum'] = "6342fdf6b0aabc1457c7f8cc218127ed"
default['maven']['directory'] = "/usr/local/maven"
default['maven']['username'] = "vagrant"

default['jenkins']['install'] = "local"
default['jenkins']['mirror'] = "http://mirrors.jenkins-ci.org/war/latest/jenkins.war"
default['jenkins']['directory'] = "/usr/local/tomcat/apache-tomcat-8.0.0-RC5/webapps"
default['jenkins']['username'] = "vagrant"
