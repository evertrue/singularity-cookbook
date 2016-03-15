#
# Cookbook Name:: singularity
# Recipe:: executor
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

include_recipe 'singularity::user'

["#{node['singularity']['home']}/bin",
 "#{node['singularity']['data_dir']}/executor-tasks"].each do |dir|
  directory dir do
    owner     node['singularity']['user']
    group     node['singularity']['user']
    mode      0755
    recursive true
    action    :create
  end
end

case node['singularity']['install_type']
when 'package'
  include_recipe 'maven'

  maven 'SingularityExecutor' do
    group_id   'com.hubspot'
    classifier 'shaded'
    version    node['singularity']['version']
    dest       "#{node['singularity']['home']}/bin"
    mode       0755
    owner      node['singularity']['user']
  end

  link "#{node['singularity']['home']}/bin/SingularityExecutor" do
    to "#{node['singularity']['home']}/bin/SingularityExecutor-" \
       "#{node['singularity']['version']}-shaded.jar"
  end
when 'source'
  include_recipe 'singularity::source'

  remote_file "#{node['singularity']['home']}/bin/SingularityExecutor" do
    mode     0755
    source   "file://#{Chef::Config['file_cache_path']}/Singularity/" \
             'SingularityExecutor/target/SingularityExecutor'
  end
else
  fail "Invalid install type: #{node['singularity']['install_type']}"
end

%w(executor
   base
   s3base).each do |executor_conf|
  template "/etc/singularity.#{executor_conf}.yaml" do
    source "singularity.#{executor_conf}.yaml.erb"
    owner  'root'
    group  'root'
    mode   0644
    variables(creds: data_bag_item('secrets', 'aws_credentials')['Singularity'])
  end
end

template "#{node['singularity']['home']}/bin/singularity-executor" do
  mode '0755'
end

node.default['filebeat']['prospectors']['singularity-executor']['filebeat']['prospectors'] = [
  {
    'paths' => ["#{node['singularity']['executor']['log_dir']}/singularity-executor.log"],
    'input_type' => 'log',
    'document_type' => 'singularity-executor'
  }
]
