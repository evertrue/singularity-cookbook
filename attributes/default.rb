default['singularity']['git_ref'] = 'Singularity-0.11.0'
default['singularity']['version'] = '0.11.0'

default['singularity']['port'] = 7092
default['singularity']['user'] = 'singularity'
default['singularity']['group'] = 'singularity'
default['singularity']['home'] = '/usr/local/singularity'
default['singularity']['data_dir'] = '/var/lib/singularity'
default['singularity']['log_dir'] = '/var/log/singularity'
default['singularity']['conf_dir'] = '/etc/singularity'
default['singularity']['install_type'] = 'package'
default['singularity']['log_level'] = 'INFO'
default['singularity']['base_url'] =
  "http://#{node['fqdn']}:#{node['singularity']['port']}/singularity"

default['singularity']['app_mysql_defaults']['adapter'] = 'mysql2'
default['singularity']['app_mysql_defaults']['pool'] = 20
default['singularity']['app_mysql_defaults']['timeout'] = 5000

default['singularity']['database']['host'] = 'localhost'
default['singularity']['database']['port'] = '3306'
default['singularity']['database']['db_name'] = 'singularity'
default['singularity']['database']['username'] = 'singularity'
default['singularity']['database']['password'] = '9thlevel'

default['et_mesos']['package']['with_zookeeper'] = true
default['et_mesos']['master']['zk'] = 'zk://localhost:2181/mesos'
default['et_mesos']['slave']['master'] = 'zk://localhost:2181/mesos'

default['mysql']['port'] = '3306'
default['mysql']['bind_address'] = '0.0.0.0'
default['mysql']['version'] = '5.5'

default['baragon']['service_yaml']['server']['connector']['port'] = 8088

default['java']['jdk_version'] = '8'
default['java']['set_default'] = true
default['java']['ark_timeout'] = 10
default['java']['ark_retries'] = 3

default['singularity']['install_mysql'] = true
