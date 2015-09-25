require 'spec_helper'

describe "NFS server setup" do
  describe package('nfs-common') do
    it { should be_installed }
  end

  describe service('nfs-kernel-server') do
    it { should be_enabled }
  end

  describe file('/etc/exports') do
    it { should be_file }
    its(:content) { should include("#{ANSIBLE_VARS.fetch('nfs_exports', ['FAIL']).join("\n")}") }
  end
end
