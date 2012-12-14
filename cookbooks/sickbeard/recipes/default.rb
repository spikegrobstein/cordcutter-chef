#
# Cookbook Name:: sickbeard
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node.os == 'linux'
  if node.platform == 'ubuntu'

    package 'git'
    package 'python-cheetah'

    user node.sickbeard.user do
      action :create

      home node.sickbeard.home
      comment 'Sickbeard PVR'
      shell '/bin/bash'
      supports :manage_home => true
    end

    directory File.dirname(node.sickbeard.home) do
      action :create

      recursive true

      owner node.sickbeard.user
      group node.sickbeard.user

      mode '755'
    end

    execute "git clone https://github.com/midgetspy/Sick-Beard.git #{ File.basename(node.sickbeard.home) }" do
      cwd File.dirname(node.sickbeard.home)
      user node.sickbeard.user
      group node.sickbeard.user

      creates node.sickbeard.home
    end

    cookbook_file '/etc/init.d/sickbeard' do
      source 'init.ubuntu'

      mode '0755'
      owner 'root'
      group 'root'
    end

    template '/etc/default/sickbeard' do
      source 'sickbeard.erb'

      mode '0644'
      owner node.sickbeard.user
      group node.sickbeard.user

      variables({
        :home => node.sickbeard.home,
        :user => node.sickbeard.user,
        :data => node.sickbeard.data,
        :pidfile => node.sickbeard.pidfile,
        :python_bin => node.sickbeard.python_bin,
        :opts => node.sickbeard.opts,
        :ssd_opts => node.sickbeard.ssd_opts
      })
    end

    service 'sickbeard' do
      action :start
    end

  end
end
