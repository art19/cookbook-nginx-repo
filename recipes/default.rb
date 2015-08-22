include_recipe 'nginx-repo::_apt' if platform_family?('debian')
include_recipe 'nginx-repo::_yum' if platform_family?('rhel')
