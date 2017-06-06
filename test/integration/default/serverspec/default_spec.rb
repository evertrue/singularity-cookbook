# Encoding: utf-8
require 'spec_helper'

describe 'Filesystem' do
  describe file('/usr/local/singularity') do
    it { should be_directory }
  end
end

describe 'Services' do
  {
    2181 => 'Zookeeper',
    3306 => 'MySQL',
    5050 => 'Mesos Master',
    7092 => 'Singularity'
  }.each do |p, service|
    context service do
      describe port p do
        it { is_expected.to be_listening }
      end
    end
  end

  describe service 'singularity' do
    it { should be_enabled }
    it { should be_running }
  end

  describe service 'mesos-master' do
    it { should be_running }
  end

  describe service 'mesos-slave' do
    it { should_not be_running }
  end

  describe file '/usr/local/lib/libmesos.so' do
    it { should be_file }
  end
end
