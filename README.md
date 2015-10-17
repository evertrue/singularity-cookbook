# singularity-cookbook
   
This cookbook provides the dependencies for the Singularity Mesos framework:

- Mesos: [et_mesos](https://supermarket.chef.io/cookbooks/et_mesos) cookbook
- MySQL: [mysql](https://supermarket.chef.io/cookbooks/mysql) cookbook

It will install and configure Singularity, MySQL and a Mesos Master on the node.  
You should have a separate Zookeeper cluster to point to or use the [zookeeper](https://supermarket.chef.io/cookbooks/zookeeper)
cookbook

# Attributes
   
You can also find comments in [attributes/default.rb](https://github.com/evertrue/singularity-cookbook/blob/master/attributes/default.rb)

## General Attributes
    
| Key                             | Type    | Description                   | Default                |
|---------------------------------|---------|-------------------------------|------------------------|
| `[:singularity][:port]`         | Integer | The singularity port          | 7092                   |
| `[:singularity][:user]`         | String  | User for singularity          | singularity            |
| `[:singularity][:group]`        | String  | Group for singularity         | singularity            |
| `[:singularity][:git_ref]`      | String  | Git ref to install from       | Singularity-0.4.3      |
| `[:singularity][:version]`      | String  | Version number of singularity | 0.4.3                  |
| `[:singularity][:home]`         | String  | Home directory                | /usr/local/singularity |
| `[:singularity][:data_dir]`     | String  | Data directory                | /var/lib/singularity   |
| `[:singularity][:log_dir]`      | String  | Log directory                 | /var/log/singularityy  |
| `[:singularity][:conf_dir]`     | String  | Config directory              | /etc/singularity       |
| `[:singularity][:install_type]` | String  | Either 'source' or 'package'  | 'package'              |
| `[:singularity][:log_level]`    | String  | Logging Level                 | 'INFO'                 |


## Database Attributes

| Key                                             | Type    | Description        | Default     |
|-------------------------------------------------|---------|--------------------|-------------|
| `[:singularity][:app_mysql_defaults][:adapter]` | String  | DB Adapter         | 'mysql2'    |
| `[:singularity][:app_mysql_defaults][:pool]`    | Integer | DB Connection Pool | 20          |
| `[:singularity][:app_mysql_defaults][:timeout]` | Integer | DB Timeout         | 5000        |
| `[:singularity][:database][:host]`              | String  | DB Host            | localhost   |
| `[:singularity][:database][:port]`              | Integer | DB Port Num        | 3306        |
| `[:singularity][:database][:db_name]`           | String  | DB Name            | singularity |
| `[:singularity][:database][:username]`          | String  | DB Username        | singularity |
| `[:singularity][:database][:password]`          | String  | DB Password        | 9thlevel    |


## Contributing

Please help us make this cookbook better!

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests with `kitchen test`, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors

Author:: EverTrue, inc. (devops@evertrue.com)
