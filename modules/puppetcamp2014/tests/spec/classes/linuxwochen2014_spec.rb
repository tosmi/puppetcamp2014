require 'spec_helper'
describe 'linuxwochen2014' do
  let :facts { { :osfamily => 'RedHat' } }

  context 'ensure is set to absent' do
    let :params { { :ensure => 'absent'} }

    it do
      should contain_user('toni').with({
                                         'ensure' => 'absent',
                                         'uid'    => '4711',
                                         'gid'    => '4711',
                                      })
    end

    it { should contain_package('emacs').with_ensure('installed') }
    it { should contain_package(vi).with_ensure('absent') }
    it { should contain_package(vi).that_requires('Package[emacs]') }
  end
end
