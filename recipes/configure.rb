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

file "#{node['singularity']['conf_dir']}/singularity.yaml" do
  content JSON.parse(node['singularity']['singularity_yaml'].to_json).to_yaml
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

remote_file "#{node['singularity']['home']}/mysql/migrations.sql" do
  source 'https://raw.githubusercontent.com/HubSpot/Singularity/' \
         "#{node['singularity']['git_ref']}/mysql/migrations.sql"
  if node['singularity']['install_mysql']
    notifies :restart, 'mysql_service[default]', :immediately
  end
  notifies :run, 'execute[migrate_singularity_db]'
end

if node['platform_version'].to_i < 16
  template '/etc/init/singularity.conf' do
    source   'singularity-init.erb'
    notifies :restart, 'service[singularity]'
  end
else
  template '/etc/systemd/system/singularity.service' do
    source 'singularity-systemd.erb'
    notifies :restart, 'service[singularity]'
  end
end

service 'singularity' do
  provider   Chef::Provider::Service::Upstart if node['platform_version'].to_i < 16
  supports   status: true, restart: true
  action     [:enable, :start]
end
