#
# Cookbook Name:: roadworker
# Recipe:: default
#
# Copyright 2014, bageljp
#
# All rights reserved - Do Not Redistribute
#

directory "#{node['roadworker']['root_dir']}" do
  owner "#{node['roadworker']['owner']}"
  group "#{node['roadworker']['group']}"
  mode 00755
  action :create
  recursive true
end

template "#{node['roadworker']['root_dir']}/Gemfile" do
  owner "#{node['roadworker']['owner']}"
  group "#{node['roadworker']['group']}"
  mode 00644
  action :create
end

package "ruby-devel"

gem_package "bundler" do
  action :install
  options "--no-ri --no-rdoc"
end

bash "roadworker install" do
  user "root"
  group "root"
  cwd "#{node['roadworker']['root_dir']}"
  code <<-EOC
    #{node['roadworker']['bundle_path']}/bundle install --path vendor/bundle
    #{node['roadworker']['bundle_path']}/bundle install --binstubs
  EOC
  not_if "ls #{node['roadworker']['root_dir']}/bin/roadwork"
end

template "/etc/profile.d/roadworker.sh" do
  owner "#{node['roadworker']['owner']}"
  group "#{node['roadworker']['group']}"
  mode 00644
  action :create
end
