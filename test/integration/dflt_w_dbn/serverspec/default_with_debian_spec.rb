require 'spec_helper'

# nginx package should be installed when a repository is enabled
describe package('nginx') do
  it { should be_installed }
end

# nginx package should be installed from the nginx-stable repo
describe command('apt-cache madison nginx') do
  its(:stdout) { should contain('http://nginx.org/packages/debian') }
end
