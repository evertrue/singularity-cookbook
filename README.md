# singularity-cookbook

This cookbook provides the dependencies for the Singularity Mesos framework:

- ZooKeeper
- Mesos
- MySQL

It will install and configure Singularity, MySQL and a Mesos Master on the node

# Attributes

You can also find comments in [attributes/default.rb](https://github.com/evertrue/singularity-cookbook/blob/master/attributes/default.rb)

## General Attributes
| Key                       | Type    | Description                   | Default                |
|---------------------------|---------|-------------------------------|------------------------|
| [:singularity][:port]     | Integer | The singularity port          | 7092                   |
| [:singularity][:user]     | String  | User for singularity          | singularity            |
| [:singularity][:group]    | String  | Group for singularity         | singularity            |
| [:singularity][:git_ref]  | String  | Git ref to install from       | Singularity-0.4.2      |
| [:singularity][:version]  | String  | Version number of singularity | 0.4.2                  |
| [:singularity][:home]     | String  | Home directory                | /usr/local/singularity |
| [:singularity][:data_dir] | String  | Data directory                | /var/lib/singularity   |
| [:singularity][:log_dir]  | String  | Log directory                 | /var/log/singularityy  |
| [:singularity][:conf_dir] | String  | Config directory              | /etc/singularity       |


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
