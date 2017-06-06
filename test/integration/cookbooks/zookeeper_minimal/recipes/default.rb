include_recipe 'apt'

%w(zookeeper zookeeperd).each { |pkg| package pkg }

if node['platform_version'].to_i < 16
  # cookbook_file '/etc/init/zookeeper.conf'

  service 'zookeeper' do
    provider Chef::Provider::Service::Upstart
    action %i(enable start)
  end
else
  execute 'systemctl daemon-reload' do
    command 'systemctl daemon-reload'
    action :nothing
    subscribes :run, 'cookbook_file[/etc/systemd/system/zookeeper.service]'
  end

  cookbook_file '/etc/systemd/system/zookeeper.service'

  service 'zookeeper' do
    provider Chef::Provider::Service::Systemd
    action %i(enable start)
  end
end
