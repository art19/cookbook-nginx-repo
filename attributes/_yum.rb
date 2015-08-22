if platform?('redhat') || platform?('centos')
  default['nginx-repo']['nginx-stable-source']['managed'] = false
  default['nginx-repo']['nginx-mainline-source']['managed'] = false

  baseurl_prefix = 'http://nginx.org/packages'
  baseurl_suffix = "#{node['platform']}/#{node['platform_version'].to_i}"

  default['nginx-repo'].tap do |repo|
    repo['nginx-stable']['yum'].tap do |yum|
      yum['repositoryid'] = 'nginx-stable'
      yum['description'] = 'nginx stable repo'
      yum['baseurl'] = "#{baseurl_prefix}/#{baseurl_suffix}/$basearch/"
      yum['gpgcheck'] = false
      yum['sslverify'] = false
      yum['enabled'] = true
    end

    repo['nginx-stable-source']['yum'].tap do |yum|
      yum['repositoryid'] = 'nginx-stable-source'
      yum['description'] = 'nginx stable source repo'
      yum['baseurl'] = "#{baseurl_prefix}/#{baseurl_suffix}/SRPMS/"
      yum['gpgcheck'] = false
      yum['sslverify'] = false
      yum['enabled'] = true
    end

    repo['nginx-mainline']['yum'].tap do |yum|
      yum['repositoryid'] = 'nginx-mainline'
      yum['description'] = 'nginx mainline repo'
      yum['baseurl'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/$basearch/"
      yum['gpgcheck'] = false
      yum['sslverify'] = false
      yum['enabled'] = true
    end

    repo['nginx-mainline-source']['yum'].tap do |yum|
      yum['repositoryid'] = 'nginx-mainline-source'
      yum['description'] = 'nginx mainline source repo'
      yum['baseurl'] = "#{baseurl_prefix}/mainline/#{baseurl_suffix}/SRPMS/"
      yum['gpgcheck'] = false
      yum['sslverify'] = false
      yum['enabled'] = true
    end
  end
end
