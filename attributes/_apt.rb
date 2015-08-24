#
# Cookbook Name:: nginx-repo
# Attributes:: _apt
#

if platform?('debian') || platform?('ubuntu')
  baseurl_prefix = 'http://nginx.org/packages'
  baseurl_suffix = node['platform']
  codename = node['lsb']['codename']

  default['nginx-repo'].tap do |repo|
    repo['nginx-stable']['apt'].tap do |apt|
      # URI of NGINX Stable Repo
      apt['uri'] = "#{baseurl_prefix}/#{baseurl_suffix}/"
      # Package distribution of NGINX Stable Repo
      apt['distribution'] = codename
      # NGINX Stable Repo Package Groupings
      apt['components'] = ['nginx']
      # Cookbook File for NGINX Stable Repo Signing Key
      apt['key'] = 'nginx_signing.key'
      # Whether or not to include the NGINX Stable Source Repo?
      apt['deb-src'] = false
    end

    repo['nginx-mainline']['apt'].tap do |apt|
      # URI of NGINX Mainline Repo
      apt['uri'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/"
      # Package distribution of NGINX Mainline Repo
      apt['distribution'] = codename
      # NGINX Mainline Repo Package Groupings
      apt['components'] = ['nginx']
      # Cookbook File for NGINX Mainline Repo Signing Key
      apt['key'] = 'nginx_signing.key'
      # Whether or not to include the NGINX Mainline Source Repo?
      apt['deb-src'] = false
    end
  end
end
