default[:singularity][:executor][:user] = node[:singularity][:user]
default[:singularity][:executor][:task_dir] = '/var/lib/singularity/executor-tasks'
default[:singularity][:executor][:s3_bucket] = nil
default[:singularity][:executor][:s3_pattern] = '/singularity/executor/tasks/'
default[:singularity][:executor][:log_dir] = '/var/log/singularity-executor'
