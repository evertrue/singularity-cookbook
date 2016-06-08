default['singularity']['singularity_yaml'] = {
  'server' => {
    'type' => 'simple',
    'applicationContextPath' => '/',
    'connector' => {
      'type' => 'http',
      'port' => node['singularity']['port']
    },
    'requestLog' => {
      'appenders' => [
        {
          'type' => 'file',
          'currentLogFilename' => '../logs/access.log',
          'archivedLogFilenamePattern' => '../logs/access-%d.log.gz'
        }
      ]
    }
  },
  'database' => {
    'driverClass' => 'com.mysql.jdbc.Driver',
    'user' => node['singularity']['database']['username'],
    'password' => node['singularity']['database']['password'],
    'url' =>
      "jdbc:mysql://#{node['singularity']['database']['host']}:" \
      "#{node['singularity']['database']['port']}/" \
      "#{node['singularity']['database']['db_name']}"
  },
  'mesos' => {
    'master' => node['et_mesos']['master']['zk'],
    'defaultCpus' => 1,
    'defaultMemory' => 128,
    'frameworkName' => 'Singularity',
    'frameworkId' => 'Singularity',
    'frameworkFailoverTimeout' => 1_000_000
  },
  'zookeeper' => {
    'quorum' => node['singularity']['zk_hosts'].join(','),
    'zkNamespace' => 'singularity',
    'sessionTimeoutMillis' => 60_000,
    'connectTimeoutMillis' => 5000,
    'retryBaseSleepTimeMilliseconds' => 1000,
    'retryMaxTries' => 3
  },
  'ui' => {
    'title' => "Singularity (#{node.chef_environment})",
    'baseUrl' => node['singularity']['base_url']
  },
  'loadBalancerUri' =>
    "http://localhost:#{node['baragon']['service_yaml']['server']['connector']['port']}/baragon/v2/request",
  'customExecutor' => {
    'memoryMb' => 128,
    'numCpus' => 0.1
  }
}
