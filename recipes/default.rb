#
# Cookbook Name:: nginx-repo
# Recipe:: default
#
#  The default recipe installs & configures NGINX repositories per
#  http://nginx.org/en/linux_packages.html for apt and yum.

include_recipe 'nginx-repo::_apt' if platform_family?('debian')
include_recipe 'nginx-repo::_yum' if platform_family?('rhel')
