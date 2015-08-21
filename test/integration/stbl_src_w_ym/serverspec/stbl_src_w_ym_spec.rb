require 'spec_helper'

describe command('ls /nginx-*.ngx.src.rpm') do
  its(:exit_status) { should eq 0 }
end
