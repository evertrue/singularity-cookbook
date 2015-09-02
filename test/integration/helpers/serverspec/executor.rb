shared_examples_for 'an executor install' do
  %w(executor
     base
     s3base).each do |prop_file|
    describe file "/etc/singularity.#{prop_file}.properties" do
      it { is_expected.to be_file }
    end
  end

  describe file '/etc/singularity.executor.properties' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'executor.s3.uploader.bucket=example' }
    end
  end

  describe file '/etc/singularity.base.properties' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'root.log.directory=/var/log/singularity' }
    end
  end

  describe file '/etc/singularity.s3base.properties' do
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
