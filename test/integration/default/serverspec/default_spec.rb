require_relative './spec_helper'

describe 'ansible-openssh::default' do

  describe package('openssh-server') do
    it { should be_installed.by('apt') }
  end

  describe package('openssh-client') do
    it { should be_installed.by('apt') }
  end

  describe port(22) do
    it { should be_listening }
  end

  describe file('/etc/ssh/sshd_config') do
    it { should be_owned_by('root') }
    it { should be_owned_by('root') }
  end

  describe file('/etc/ssh/sshd_config') do
    it { should be_mode 644 }
  end

  describe file('/etc/ssh/ssh_config') do
    it { should be_owned_by('root') }
    it { should be_owned_by('root') }
  end

   describe file('/etc/ssh/ssh_config') do
    it { should be_mode 644 }
  end

end
