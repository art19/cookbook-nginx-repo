#
# Cookbook Name:: nginx-repo
# Recipe:: _apt
#
#  Installs & configures the NGINX apt repostories.  Any attribute supported by
#  the [apt cookbook](https://github.com/chef-cookbooks/apt#parameters) is
#  supported by this cookbook and can be used to override attributes in this
#  cookbook.

# check if platform is supported
platform_family = node['platform_family']
platform = node['platform']
platform_version = node['platform_version']

fail("#{platform_family}/#{platform}/#{platform_version} is not supported by the _apt recipe") \
  unless node['nginx-repo']['debian']['supported-codenames']
         .select { |_version, is_included| is_included }
         .keys
         .include?(node['lsb']['codename'])

node['nginx-repo'].each do |repo, value|
  apt_repository repo do
    apt = value['apt']

    # define all attributes even though we are not using them all so that the
    #  values can be passed through to override apt repository definitions

    # Attribute Sources:
    #  https://github.com/opscode-cookbooks/apt
    #  https://github.com/opscode-cookbooks/apt/blob/master/resources/repository.rb

    repo_name apt['repo_name']
    uri apt['uri']
    distribution apt['distribution']
    components apt['components']
    arch apt['arch']
    trusted apt['trusted']
    deb_src apt['deb-src']
    keyserver apt['keyserver']
    key apt['key']
    key_proxy apt['key_proxy']
    cookbook apt['cookbook']
    cache_rebuild apt['cache_rebuild']
  end if value['managed'] && value.key?('apt')
end
