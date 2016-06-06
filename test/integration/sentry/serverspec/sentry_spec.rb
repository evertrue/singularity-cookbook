context 'when Sentry config are set' do
  describe file '/etc/singularity/singularity.yaml' do
    describe '#content' do
      subject { super().content }
      it { is_expected.to include 'dsn: http://sentry.example.com' }
      it { is_expected.to_not include 'prefix' }
    end
  end
end
