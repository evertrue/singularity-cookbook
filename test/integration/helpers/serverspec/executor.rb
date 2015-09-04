shared_examples_for 'an executor install' do
  ['/usr/local/singularity/bin',
   '/var/lib/singularity/executor-tasks'].each do |dir|
    describe file dir do
      it { is_expected.to be_directory }
      it { is_expected.to be_owned_by 'singularity' }
      it { is_expected.to be_grouped_into 'singularity' }
      it { is_expected.to be_mode 755 }
    end
  end

  %w(executor
     base
     s3base).each do |executor_conf|
    describe file "/etc/singularity.#{executor_conf}.yaml" do
      it { is_expected.to be_file }
    end
  end

  describe file '/etc/singularity.executor.yaml' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 's3UploaderBucket: example' }
    end
  end

  describe file '/etc/singularity.base.yaml' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'loggingDirectory: /var/log/singularity' }
    end
  end

  describe file '/etc/singularity.s3base.yaml' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'FAKE_ACCESS_KEY_ID' }
      it { is_expected.to include 'FAKE_SECRET_ACCESS_KEY' }
    end
  end

  describe file '/usr/local/singularity/bin/singularity-executor' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include '/usr/local/singularity/bin/SingularityExecutor' }
    end
  end
end
