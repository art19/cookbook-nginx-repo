#
# Cookbook Name:: nginx-repo
# Recipe:: _yum
#
#  Installs & configures the NGINX yum repostories.  Any attribute supported by
#  the [yum cookbook](https://github.com/chef-cookbooks/yum#parameters) is
#  supported by this cookbook and can be used to override attributes in this
#  cookbook.

# check is platform is supported
platform_family = node['platform_family']
platform = node['platform']
platform_version = node['platform_version']

fail("#{platform_family}/#{platform}/#{platform_version} is not supported by the _yum recipe") \
  unless node['nginx-repo']['rhel']['supported-versions']
         .select { |_version, is_included| is_included }
         .keys
         .include?(platform_version.to_i.to_s)

node['nginx-repo'].each do |repo, value|
  yum_repository repo do
    yum = value['yum']

    # define all attributes even though we are not using them all so that the
    #  values can be passed through to override yum repository definitions

    # Attribute Sources:
    #  https://github.com/chef-cookbooks/yum
    #  https://github.com/chef-cookbooks/yum/blob/master/resources/repository.rb

    baseurl yum['baseurl']
    cost yum['cost']
    description yum['description']
    enabled yum['enabled']
    enablegroups yum['enablegroups']
    exclude yum['exclude']
    failovermethod yum['failovermethod']
    fastestmirror_enabled yum['fastestmirror_enabled']
    gpgcheck yum['gpgcheck']
    gpgkey yum['gpgkey']
    http_caching yum['http_caching']
    includepkgs yum['includepkgs']
    keepalive yum['keepalive']
    make_cache yum['make_cache']
    max_retries yum['max_retries']
    metadata_expire yum['metadata_expire']
    mirror_expire yum['mirror_expire']
    mirrorlist yum['mirrorlist']
    mirrorlist_expire yum['mirrorlist_expire']
    mode yum['mode']
    options yum['options']
    password yum['password']
    priority yum['priority']
    proxy yum['proxy']
    proxy_username yum['proxy_username']
    proxy_password yum['proxy_password']
    report_instanceid yum['report_instanceid']
    repositoryid yum['repositoryid']
    skip_if_unavailable yum['skip_if_unavailable']
    source yum['source']
    sslcacert yum['sslcacert']
    sslclientcert yum['sslclientcert']
    sslclientkey yum['sslclientkey']
    sslverify yum['sslverify']
    timeout yum['timeout']
    username yum['username']
  end if value['managed'] && value.key?('yum')
end
