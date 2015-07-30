#
# Cookbook Name:: singularity
# Recipe:: logrotate
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

logrotate_app 'singularity' do
  path          node[:singularity][:log_file]
  if node[:singularity][:size]
    size        node[:singularity][:size]
  else
    frequency   node[:singularity][:frequency]
  end
  rotate        node[:singularity][:logs_to_keep]
  create        '644 root root'
  template_mode '0644'
  options       %w(copytruncate
                   missingok
                   compress
                   delaycompress)
end
