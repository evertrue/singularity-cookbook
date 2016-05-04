require 'spec_helper'

describe 'SingularityExecutor' do
  it_behaves_like 'an executor install'

  describe file '/usr/local/singularity/bin/SingularityExecutor-0.5.0-shaded.jar' do
    it { is_expected.to be_file }
    it { is_expected.to be_mode '755' }
    it { is_expected.to be_owned_by 'singularity' }
  end

  describe file '/usr/local/singularity/bin/SingularityExecutor' do
    it do
      is_expected.to be_linked_to '/usr/local/singularity/bin/' \
                                  'SingularityExecutor-0.5.0-shaded.jar'
    end
  end
end
