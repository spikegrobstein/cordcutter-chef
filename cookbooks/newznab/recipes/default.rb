#
# Cookbook Name:: newznab
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

newznab_download_url = "http://www.newznab.com/newznab-#{ node.newznab.version }.zip"

if node.os == 'linux'
  if node.platform == 'ubuntu'

    package 'unzip'

    user node.newznab.user do
      shell '/bin/bash'
      manage_home true

      comment 'newznab'

      home node.newznab.home

      system true
      supports :manage_home => true
    end

    remote_file '/tmp/newznab.zip' do
      source newznab_download_url

      owner 'root'
      group 'root'
      mode '0600'
    end

    directory "/tmp/newznab" do
      action :delete
      recursive true
    end

    execute "unzip /tmp/newznab.zip -d /tmp/newznab" do
      creates '/tmp/newznab'
    end

    execute "mv /tmp/newznab/newznab-#{ node.newznab.version }/* #{ node.newznab.home }" do
      user node.newznab.user
      group node.newznab.user
      creates "#{ node.newznab.home }/www"
    end

  end
end
