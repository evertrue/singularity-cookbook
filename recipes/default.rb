#
# Cookbook Name:: singularity
# Recipe:: default
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
include_recipe 'et_mesos::master'
include_recipe 'singularity::mysql' if node['singularity']['install_mysql']
include_recipe 'java'

[node['singularity']['conf_dir'],
 node['singularity']['log_dir'],
 node['singularity']['home'],
 "#{node['singularity']['home']}/mysql",
 "#{node['singularity']['home']}/bin"].each do |cur_dir|
   directory cur_dir do
     recursive true
   end
 end

case node['singularity']['install_type']
when 'package', 'source'
  include_recipe "singularity::#{node['singularity']['install_type']}"
else
  fail "Invalid install type: #{node['singularity']['install_type']}"
end

include_recipe 'singularity::configure'
include_recipe 'singularity::logrotate'
