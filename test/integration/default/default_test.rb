# InSpec test for recipe mongo::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/
# This is an example test, replace it with your own test

describe package "mongodb-org" do
  it {should be_installed}
  its ('version'){ should match /3\./}
end

describe service "mongod" do
  it { should be_installed }
  it { should be_enabled }
  it { should be_running }
end
