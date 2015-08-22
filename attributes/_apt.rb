if platform?('debian') || platform?('ubuntu')
  baseurl_prefix = 'http://nginx.org/packages'
  baseurl_suffix = node['platform']
  codename = node['lsb']['codename']

  default['nginx-repo'].tap do |repo|
    repo['nginx-stable']['apt'].tap do |apt|
      apt['uri'] = "#{baseurl_prefix}/#{baseurl_suffix}/"
      apt['distribution'] = codename
      apt['components'] = ['nginx']
      apt['key'] = 'nginx_signing.key'
      apt['deb-src'] = false
    end

    repo['nginx-mainline']['apt'].tap do |apt|
      apt['uri'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/"
      apt['distribution'] = codename
      apt['components'] = ['nginx']
      apt['key'] = 'nginx_signing.key'
      apt['deb-src'] = false
    end
  end
end
