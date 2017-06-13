name             'singularity'
maintainer       'EverTrue'
maintainer_email 'devops@evertrue.com'
license          'All rights reserved'
description      'Installs Singularity and its dependencies (mesos, zk, mysql)'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '12.0.3'
supports         'ubuntu'

depends 'apt'
depends 'build-essential'
depends 'mysql', '~> 8.0'
depends 'git'
depends 'mysql2_chef_gem'
depends 'database'
depends 'hostsfile'
depends 'et_java', '~> 1.50'
depends 'et_mesos', '~> 7.0'
depends 'openssl', '>= 4.0'
depends 'logrotate'
depends 'maven', '>= 2.2'
depends 'cron'
