name 'nginx-repo'
maintainer 'St. Isidore de Seville'
maintainer_email 'st.isidore.de.seville@gmail.com'
license 'MIT'
description 'Configures NGINX Vendor-Specific Repository'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

source_url 'https://github.com/st-isidore-de-seville/cookbook-nginx-repo'
issues_url 'https://github.com/st-isidore-de-seville/cookbook-nginx-repo/issues'

depends 'apt', '~> 2.8'
depends 'yum', '~> 3.6'

# Supported Platforms:
#  http://nginx.org/en/linux_packages.html
supports 'rhel', '>= 5', '< 8'
supports 'centos', '>= 5', '< 8'
supports 'debian', '>= 6', '< 9'
supports 'ubuntu', '10.04', '12.04', '14.04', '14.10'
