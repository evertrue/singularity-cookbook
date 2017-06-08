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
  'historyPruning' => {
    'enabled' => true,
    'checkTaskHistoryEveryHours' => 24,
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
    'master' => 'zk://localhost:2181/mesos',
    'defaultCpus' => 1,
    'defaultMemory' => 128,
    'frameworkName' => 'Singularity',
    'frameworkId' => 'Singularity',
    'frameworkFailoverTimeout' => 1_000_000
  },
  'zookeeper' => {
    'quorum' => 'localhost:2181',
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
    "http://localhost:#{node['baragon']['service_yaml']['server']['connector']['port']}" \
    '/baragon/v2/request',
  'customExecutor' => {
    'memoryMb' => 128,
    'numCpus' => 0.1
  },
  'zookeeperAsyncTimeout' => 20_000
}

if node.chef_environment == 'prod'
  default['singularity']['singularity_yaml']['historyPruning']['deleteTaskHistoryAfterDays'] = 90
  default['singularity']['singularity_yaml']['historyPruning']['deleteTaskHistoryAfterTasksPerRequest'] = 5000
else
  default['singularity']['singularity_yaml']['historyPruning']['deleteTaskHistoryAfterDays'] = 30
  default['singularity']['singularity_yaml']['historyPruning']['deleteTaskHistoryAfterTasksPerRequest'] = 500
end
