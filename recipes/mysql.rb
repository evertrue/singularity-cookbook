#
# Cookbook Name:: singularity
# Recipe:: mysql
#
# Copyright (C) 2015 EverTrue, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

::Chef::Recipe.send(:include, OpenSSLCookbook::Password)

server_root_password = (
  if File.exist?('/etc/mysql-default/root_password')
    File.read('/etc/mysql-default/root_password').chomp
  else
    secure_password
  end
)

# For some reason, due to Chef's strange and arbitrary processing order rules,
# this needs to be here even though it's in the mysql2_chef_gem LWRP.
include_recipe 'build-essential::default'

mysql2_chef_gem 'default' do
  action :install
end

mysql_service 'default' do
  port node[:mysql][:port]
  bind_address node[:mysql][:bind_address]
  version node[:mysql][:version]
  initial_root_password server_root_password
  action [:create, :start]
end

mysql_client 'default' do
  action :create
end

file '/etc/mysql-default/root_password' do
  content "#{server_root_password}\n"
  user 'root'
  group 'root'
  mode 0600
  action :create_if_missing
end

mysql_connection_info = {
  host:     '127.0.0.1',
  username: 'root',
  password: server_root_password
}

mysql_database node[:singularity][:database][:db_name] do
  connection mysql_connection_info
  action :create
end

mysql_database_user node[:singularity][:database][:username] do
  connection mysql_connection_info
  password node[:singularity][:database][:password]
  database_name node[:singularity][:database][:db_name]
  host '%'
  privileges [:all]
  action [:grant]
end
