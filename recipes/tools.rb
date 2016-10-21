apt_repository 'brightbox-ruby' do
  uri 'http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu'
  distribution node['lsb']['codename']
  components %w(main)
  keyserver 'keyserver.ubuntu.com'
  key 'C3173AA6'
end

package 'ruby2.2'
package 'ruby2.2-dev'
gem_package 'unirest'

cookbook_file('/usr/local/bin/singularity-cleanup-agents') { mode 0o755 }

cron_d 'cleanup-agents' do
  command '/usr/local/bin/singularity-cleanup-agents'
  minute '*/20'
end
