require 'spec_helper'

describe 'SingularityExecutor' do
  it_behaves_like 'an executor install'

  describe file '/usr/local/singularity/bin/SingularityExecutor' do
    it { is_expected.to be_file }
    it { is_expected.to be_mode '755' }
  end
end
