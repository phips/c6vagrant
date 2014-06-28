#
# Cookbook Name:: markp
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
app_root = '/srv/www/flask_app'
packages = %w(httpd)

packages.each do |pkg|
    package pkg do
        action :install
    end
end

cookbook_file "/etc/httpd/conf.d/app.conf" do
    source 'app.conf'
    mode '0644'
end

directory "/srv/www" do
    owner "vagrant"
    group "vagrant"
    mode 0755
    action :create
end

git "/srv/www/flask_app" do
    repository "file:///vagrant/app.git"
    revision "master"
    action :sync
end

cookbook_file "/etc/init.d/cardiff" do
    source 'cardiff.init'
    mode '0755'
end

execute "service cardiff start" do
    not_if "pgrep -l app.py"
end

service 'httpd' do
    action [ :enable, :start ]
end

