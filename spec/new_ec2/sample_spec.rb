require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe package('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_installed }
end

describe service('httpd'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe service('apache2'), :if => os[:family] == 'ubuntu' do
  it { should be_enabled }
  it { should be_running }
end

describe service('org.apache.httpd'), :if => os[:family] == 'darwin' do
  it { should be_enabled }
  it { should be_running }
end

#describe port(80) do
#  it { should be_listening }
#end

if os[:family] == 'amazon'

#port 22 opened
describe port(22) do
  it { should be_listening }
end

#package check
%w{gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel}.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

#ec2-user exist
describe user('ec2-user') do
  it { should exist }
end

end
