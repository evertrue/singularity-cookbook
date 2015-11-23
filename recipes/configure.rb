#
# Cookbook Name:: singularity
# Recipe:: configure
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

template "#{node['singularity']['conf_dir']}/singularity.yaml" do
  source 'singularity.yaml.erb'
  variables(baragon_url:
    "http://localhost:#{node['baragon']['service_yaml']['server']['connector']['port']}" \
    '/baragon/v2')
end

execute 'migrate_singularity_db' do
  command "#{node['java']['java_home']}/bin/java " \
          "-jar #{node['singularity']['home']}/bin/" \
          "SingularityService-#{node['singularity']['version']}-shaded.jar " \
          "db migrate #{node['singularity']['conf_dir']}/singularity.yaml " \
          "--migrations #{node['singularity']['home']}/mysql/migrations.sql " \
          "&& touch #{node['singularity']['conf_dir']}/migration_ran"
  action  :nothing
end

cookbook_file "#{node['singularity']['home']}/mysql/migrations.sql" do
  source 'migrations.sql'
  if node['singularity']['install_mysql']
    notifies :restart, 'mysql_service[default]', :immediately
  end
  notifies :run, 'execute[migrate_singularity_db]'
end

template '/etc/init/singularity.conf' do
  source   'singularity-init.erb'
  notifies :restart, 'service[singularity]'
end

service 'singularity' do
  provider   Chef::Provider::Service::Upstart
  supports   status: true, restart: true
  action     [:enable, :start]
end
