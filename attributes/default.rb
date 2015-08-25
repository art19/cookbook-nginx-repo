#
# Cookbook Name:: nginx-repo
# Attributes:: default
#

# Does this cookbook manage the install of the NGINX Stable Repo?
default['nginx-repo']['nginx-stable']['managed'] = true
# Does this cookbook manage the install of the NGINX Mainline Repo?
default['nginx-repo']['nginx-mainline']['managed'] = false
