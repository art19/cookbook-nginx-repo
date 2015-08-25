require 'spec_helper'

# the assumption made here is that if there is a source repo present, then the
#  the source package was downloaded successfully
describe command('ls /nginx-*.ngx.src.rpm') do
  its(:exit_status) { should eq 0 }
end
