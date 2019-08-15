#
# Cookbook:: mongo
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'

    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end

    it 'should install mongodb' do
      expect(chef_run).to install_package "mongodb-org"
    end

    it 'should enable the mongodb service' do
      expect(chef_run).to enable_service "mongod"
    end

    it 'start the mongodb service' do
      expect(chef_run).to start_service "mongod"
    end

    it 'should create a mongod.conf template in /etc/systemd/system/' do
      expect(chef_run).to create_template("/etc/systemd/system/mongod.service")
    end

    it 'should create a mongod.conf template in /etc/systemd/system/' do
      expect(chef_run).to create_template("/etc/mongod.conf")
    end

    it 'should update the sources list' do
      expect(chef_run).to update_apt_update 'update_sources'
    end
    
    it 'should add mongodb-org to the source list' do
      expect(chef_run).to add_apt_repository 'mongodb-org'
    end

    # it 'should create a symlink from home/ubuntu/environment/ to etc/mongod.conf' do
    #   expect(chef_run).to create_link("/home/ubuntu/environment/mongod.conf").with_link_type(:symbolic)
    # end

    # it 'should delete the symlink from the mongod config file' do
    #   expect(chef_run).to delete_link("/etc/mongod.conf")
    # end

    it 'runs apt get update' do
      expect(chef_run).to update_apt_update "update_sources"
    end
  end
end
