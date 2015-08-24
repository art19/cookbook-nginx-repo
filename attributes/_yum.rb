#
# Cookbook Name:: nginx-repo
# Attributes:: _yum
#

if platform?('redhat') || platform?('centos')
  # Does this cookbook manage the install of the NGINX Stable Source Repo?
  default['nginx-repo']['nginx-stable-source']['managed'] = false
  # Does this cookbook manage the install of the NGINX Mainline Source Repo?
  default['nginx-repo']['nginx-mainline-source']['managed'] = false

  baseurl_prefix = 'http://nginx.org/packages'
  baseurl_suffix = "#{node['platform']}/#{node['platform_version'].to_i}"

  default['nginx-repo'].tap do |repo|
    repo['nginx-stable']['yum'].tap do |yum|
      # Unique Name for NGINX Stable Repo
      yum['repositoryid'] = 'nginx-stable'
      # Description of NGINX Stable Repo
      yum['description'] = 'nginx stable repo'
      # URL of NGINX Stable Repo
      yum['baseurl'] = "#{baseurl_prefix}/#{baseurl_suffix}/$basearch/"
      # Whether or not NGINX Stable Repo should perform GPG check of packages?
      yum['gpgcheck'] = false
      # Whether or not yum will verify the NGINX Stable Repo SSL host?
      yum['sslverify'] = false
      # Whether or not the NGINX Stable Repo is enabled?
      yum['enabled'] = true
    end

    repo['nginx-stable-source']['yum'].tap do |yum|
      # Unique Name for NGINX Stable Source Repo
      yum['repositoryid'] = 'nginx-stable-source'
      # Description of NGINX Stable Source Repo
      yum['description'] = 'nginx stable source repo'
      # URL of NGINX Stable Source Repo
      yum['baseurl'] = "#{baseurl_prefix}/#{baseurl_suffix}/SRPMS/"
      # Whether or not NGINX Stable Source Repo should perform GPG check of
      #  packages?
      yum['gpgcheck'] = false
      # Whether or not yum will verify the NGINX Stable Source Repo SSL host?
      yum['sslverify'] = false
      # Whether or not the NGINX Stable Source Repo is enabled?
      yum['enabled'] = true
    end

    repo['nginx-mainline']['yum'].tap do |yum|
      # Unique Name for NGINX Mainline Repo
      yum['repositoryid'] = 'nginx-mainline'
      # Description for NGINX Mainline Repo
      yum['description'] = 'nginx mainline repo'
      # URL of NGINX Mainline Repo
      yum['baseurl'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/$basearch/"
      # Whether or not NGINX Mainline Repo should perform GPG check of packages?
      yum['gpgcheck'] = false
      # Whether or not yum will verify the NGINX Mainline Repo SSL host?
      yum['sslverify'] = false
      # Whether or not the NGINX Mainline Repo is enabled?
      yum['enabled'] = true
    end

    repo['nginx-mainline-source']['yum'].tap do |yum|
      # Unique Name for NGINX Mainline Source Repo
      yum['repositoryid'] = 'nginx-mainline-source'
      # Description of NGINX Mainline Source Repo
      yum['description'] = 'nginx mainline source repo'
      # URL of NGINX Mainline Source Repo
      yum['baseurl'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/SRPMS/"
      # Whether or not NGINX Mainline Source Repo should perform GPG check of
      #  packages?
      yum['gpgcheck'] = false
      # Whether or not yum will verify the NGINX Mainline Source Repo SSL host?
      yum['sslverify'] = false
      # Whether or not the NGINX Mainline Source Repo is enabled?
      yum['enabled'] = true
    end
  end
end
