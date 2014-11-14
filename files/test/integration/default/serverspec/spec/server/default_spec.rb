# http://serverspec.org/resource_types.html

require 'spec_helper'

describe port(5985) do
  it { should be_listening }
end

describe command('knife -v') do
  its(:stdout) { should match /^Chef/ }
end

