# singularity-cookbook

This cookbook provides the dependencies for the Singularity Mesos framework:

- ZooKeeper
- Mesos
- MySQL

It will install and configure Singularity, MySQL and a Mesos Master on the node

# Attributes

You can also find comments in [attributes/default.rb](https://github.com/evertrue/singularity-cookbook/blob/master/attributes/default.rb)

## General Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>[:singularity][:port]</tt></td>
    <td>Integer</td>
    <td>The singularity port</td>
    <td><tt>7092</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:user]</tt></td>
    <td>String</td>
    <td>User for singularity</td>
    <td><tt>singularity</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:group]</tt></td>
    <td>String</td>
    <td>Group for singularity</td>
    <td><tt>singularity</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:git_ref]</tt></td>
    <td>String</td>
    <td>Git ref to install from</td>
    <td><tt>Singularity-0.4.2</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:version]</tt></td>
    <td>String</td>
    <td>Version number of singularity</td>
    <td><tt>0.4.2</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:home]</tt></td>
    <td>String</td>
    <td>Home directory</td>
    <td><tt>/usr/local/singularity</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:data_dir]</tt></td>
    <td>String</td>
    <td>Data directory</td>
    <td><tt>/var/lib/singularity</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:log_dir]</tt></td>
    <td>String</td>
    <td>Log directory</td>
    <td><tt>/var/log/singularityy</tt></td>
  </tr>
  <tr>
    <td><tt>[:singularity][:conf_dir]</tt></td>
    <td>String</td>
    <td>Config directory</td>
    <td><tt>/etc/singularity</tt></td>
  </tr>
</table>

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
