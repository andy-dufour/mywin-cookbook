require 'serverspec'

include Serverspec::Helper::Exec

describe port(5985) do
  it { should be_listening }
end
