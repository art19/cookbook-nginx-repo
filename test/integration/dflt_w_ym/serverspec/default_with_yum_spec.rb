require 'spec_helper'

# nginx package should be installed when a repository is enabled
describe package('nginx') do
  it { should be_installed }
end

# nginx package should be installed from the nginx-stable repo
describe command('repoquery -i nginx') do
  its(:stdout) { should contain('Repository  : nginx-stable') }
end
