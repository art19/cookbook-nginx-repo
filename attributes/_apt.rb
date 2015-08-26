#
# Cookbook Name:: nginx-repo
# Attributes:: _apt
#

if platform_family?('debian')
  # Debian-ish platform support for this cookbook and the NGINX repository.
  # Designed to be a private attribute however it can be overridden in the case
  # NGINX supports additional platforms and this cookbook has not been updated
  # yet.
  #
  # This check was implemented as a result of the repo could be successfully
  # installed yet not be valid for a given platform and an NGINX package could
  # be successfully installed as a result of it being available natively on the
  # platform it which it was run which results in a false positive for the
  # consumer of the cookbook.
  #
  # The hash key is the codename of the OS/version.  If the hash value evaluates
  # to true, the OS/version is considered supported.

  default['nginx-repo']['debian']['supported-codenames'] = {
    squeeze: true, # Debian 6.x
    wheezy: true,  # Debian 7.x
    jessie: true,  # Debian 8.x
    lucid: true,   # Ubuntu 10.04
    precise: true, # Ubuntu 12.04
    trusty: true,  # Ubuntu 14.04
    utopic: true   # Ubuntu 14.10
  }

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
