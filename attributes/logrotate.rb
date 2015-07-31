default[:singularity][:log_file]             = "#{node[:singularity][:log_dir]}/singularity.log"
default[:singularity][:logs_to_keep]         = 14
default[:singularity][:log_rotate_frequency] = 'daily'
