require 'spec_helper'
describe 'puppetcamp2014' do
  let (:facts) { { :osfamily => 'RedHat' } }

  context 'ensure is set to absent' do
    let (:params) { { :ensure => 'absent'} }

    it do
      should contain_user('toni').with({
                                         'ensure' => 'absent',
                                         'uid'    => '4711',
                                         'gid'    => '100',
                                      })
    end

    it { should contain_package('emacs-nox').with_ensure('installed') }
    it { should contain_package('vim-enhanced').with_ensure('absent') }
    it { should contain_package('emacs-nox').that_comes_before('Package[vim-enhanced]') }
  end
end
