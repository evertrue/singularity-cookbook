require 'spec_helper'

describe 'singularity::tools' do
  describe command '/usr/local/bin/singularity-cleanup-agents' do
    its(:exit_status) { is_expected.to eq 0 }
  end

  describe file '/etc/cron.d/cleanup-agents' do
    its(:content) do
      is_expected.to contain '\\*/20 \\* \\* \\* \\* root /usr/local/bin/singularity-cleanup-agents'
    end
  end
end
