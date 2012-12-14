#
# Cookbook Name:: sabnzbd
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node.os == 'linux'

  if node.platform == 'ubuntu'

    package 'sabnzbdplus'

    template '/etc/default/sabnzbdplus' do
      source 'sabnzbdplus.erb'
      variables({
        :user => node.sabnzbd.user,
        :host => node.sabnzbd.host,
        :port => node.sabnzbd.port
      })

      owner 'root'
      group 'root'
      mode '644'
    end

    service 'sabnzbdplus' do
      action :enable
    end

  end
end
