nginx-repo Cookbook
====================
[![Build Status](https://travis-ci.org/st-isidore-de-seville/cookbook-nginx-repo.svg?branch=master)](https://travis-ci.org/st-isidore-de-seville/cookbook-nginx-repo)
[![Chef Cookbook](https://img.shields.io/cookbook/v/nginx-repo.svg)](https://supermarket.chef.io/cookbooks/nginx-repo)

Configures NGINX Vendor-Specific Repositories.

This cookbook configures NGINX repositories per
http://nginx.org/en/linux_packages.html for apt and yum.

Requirements
------------
- Chef 11 or higher
- Ruby 1.9 or higher (preferably from the Chef full-stack installer)
- Network accessible package repositories

Attributes
----------
#### nginx-repo::default
Per http://wiki.nginx.org/Install, there are currently two versions of NGINX.
The mainline branch gets new features and bugfixes sooner but might introduce
new bugs as well.  Critical bugfixes are backported to the stable branch.  In
general, the stable release is recommended, but the mainline release is
typically quite stable as well.

- `['nginx-repo']['nginx-stable']['managed']`
  - _Type:_ Boolean
  - _Description:_ Does this cookbook manage the install of the nginx-stable repo?
  - _Default:_ `true`
- `['nginx-repo']['nginx-mainline']['managed']`
  - _Type:_ Boolean
  - _Description:_ Does this cookbook manage the install of the nginx-mainline repo?
  - _Default:_ `false`

#### nginx-repo::_apt
The apt recipe is for managing the NGINX apt repostories.  Any attribute
supported by the [apt cookbook](https://github.com/opscode-cookbooks/apt#attribute-parameters) is
supported by this cookbook and can be used to override attributes in this cookbook.

- `['nginx-repo']['nginx-stable']['apt']['uri']`
  - _Type:_ String
  - _Description:_ URI of NGINX Stable Repo
  - _Default:_ `http://nginx.org/packages/#{node['platform']}`
- `['nginx-repo']['nginx-stable']['apt']['distribution']`
  - _Type:_ String
  - _Description:_ Package distribution of NGINX Stable Repo
  - _Default:_ `node['lsb']['codename']`
- `['nginx-repo']['nginx-stable']['apt']['components']`
  - _Type:_ Array
  - _Description:_ NGINX Stable Repo Package Groupings
  - _Default:_ `['nginx']`
- `['nginx-repo']['nginx-stable']['apt']['key']`
  - _Type:_ String
  - _Description:_ Cookbook File for NGINX Stable Repo Signing Key
  - _Default:_ `nginx_signing.key`
- `['nginx-repo']['nginx-stable']['apt']['deb-src']`
  - _Type:_ Boolean
  - _Description:_ Whether or not to include the nginx-stable source repo?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline']['apt']['uri']`
  - _Type:_ String
  - _Description:_ URI of NGINX Mainline Repo
  - `http://nginx.org/packages/mainline/#{node['platform']}`
- `['nginx-repo']['nginx-mainline']['apt']['distribution']`
  - _Type:_ String
  - _Description:_ Package distribution of NGINX Mainline Repo
  - _Default:_ `node['lsb']['codename']`
- `['nginx-repo']['nginx-mainline']['apt']['components']`
  - _Type:_ Array
  - _Description:_ NGINX Mainline Repo Package Groupings
  - _Default:_ `['nginx']`
- `['nginx-repo']['nginx-mainline']['apt']['key']`
  - _Type:_ String
  - _Description:_ Cookbook File for NGINX Mainline Repo Signing Key
  - _Default:_ `nginx_signing.key`
- `['nginx-repo']['nginx-mainline']['apt']['deb-src']`
  - _Type:_ Boolean
  - _Description:_ Whether or not to include the nginx-mainline source repo?
  - _Default:_ `false`

#### nginx-repo::_yum
The yum recipe is for managing the NGINX yum repostories.  Any attribute
supported by the [yum cookbook](https://github.com/chef-cookbooks/yum#parameters) is
supported by this cookbook and can be used to override attributes in this cookbook.

- `['nginx-repo']['nginx-stable-source']['managed']`
  - _Type:_ Boolean
  - _Description:_ Does this cookbook manage the install of the nginx-stable-source repo?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline-source']['managed']`
  - _Type:_ Boolean
  - _Description:_ Does this cookbook manage the install of the nginx-mainline-source repo?
  - _Default:_ `false`
- `['nginx-repo']['nginx-stable']['yum']['repositoryid']`
  - _Type:_ String
  - _Description:_ Unique Name for NGINX Stable Repo
  - _Default:_ `nginx-stable`
- `['nginx-repo']['nginx-stable']['yum']['description']`
  - _Type:_ String
  - _Description:_ Description of NGINX Stable Repo
  - _Default:_ `nginx stable repo`
- `['nginx-repo']['nginx-stable']['yum']['baseurl']`
  - _Type:_ String
  - _Description:_ URL of NGINX Stable Repo
  - _Default:_ `http://nginx.org/packages/#{node['platform']}/#{node['platform_version'].to_i}/$basearch/`
- `['nginx-repo']['nginx-stable']['yum']['gpgcheck']`
  - _Type:_ Boolean
  - _Description:_ Whether or not NGINX Stable Repo should perform GPG check of packages?
  - _Default:_ `false`
- `['nginx-repo']['nginx-stable']['yum']['sslverify']`
  - _Type:_ Boolean
  - _Description:_ Whether or not yum will verify the NGINX Stable Repo SSL host?
  - _Default:_ `false`
- `['nginx-repo']['nginx-stable']['yum']['enabled']`
  - _Type:_ Boolean
  - _Description:_ Whether or not the NGINX Stable Repo is enabled?
  - _Default:_ `true`
- `['nginx-repo']['nginx-stable-source']['yum']['repositoryid']`
  - _Type:_ String
  - _Description:_ Unique Name for NGINX Stable Source Repo
  - _Default:_ `nginx-stable-source`
- `['nginx-repo']['nginx-stable-source']['yum']['description']`
  - _Type:_ String
  - _Description:_ Description of NGINX Stable Source Repo
  - _Default:_ `nginx stable source repo`
- `['nginx-repo']['nginx-stable-source']['yum']['baseurl']`
  - _Type:_ String
  - _Description:_ URL of NGINX Stable Source Repo
  - _Default:_ `http://nginx.org/packages/#{node['platform']}/#{node['platform_version'].to_i}/SRPMS/`
- `['nginx-repo']['nginx-stable-source']['yum']['gpgcheck']`
  - _Type:_ Boolean
  - _Description:_ Whether or not NGINX Stable Source Repo should perform GPG check of packages?
  - _Default:_ `false`
- `['nginx-repo']['nginx-stable-source']['yum']['sslverify']`
  - _Type:_ Boolean
  - _Description:_ Whether or not yum will verify the NGINX Stable Source Repo SSL host?
  - _Default:_ `false`
- `['nginx-repo']['nginx-stable-source']['yum']['enabled']`
  - _Type:_ Boolean
  - _Description:_ Whether or not the NGINX Stable Source Repo is enabled?
  - _Default:_ `true`
- `['nginx-repo']['nginx-mainline']['yum']['repositoryid']`
  - _Type:_ String
  - _Description:_ Unique Name for NGINX Mainline Repo
  - _Default:_ `nginx-mainline`
- `['nginx-repo']['nginx-mainline']['yum']['description']`
  - _Type:_ String
  - _Description:_ Description for NGINX Mainline Repo
  - _Default:_ `nginx mainline repo`
- `['nginx-repo']['nginx-mainline']['yum']['baseurl']`
  - _Type:_ String
  - _Description:_ URL of NGINX Mainline Repo
  - _Default:_ `http://nginx.org/packages/mainline/#{node['platform']}/#{node['platform_version'].to_i}/$basearch/`
- `['nginx-repo']['nginx-mainline']['yum']['gpgcheck']`
  - _Type:_ Boolean
  - _Description:_ Whether or not NGINX Mainline Repo should perform GPG check of packages?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline']['yum']['sslverify']`
  - _Type:_ Boolean
  - _Description:_ Whether or not yum will verify the NGINX Mainline Repo SSL host?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline']['yum']['enabled']`
  - _Type:_ Boolean
  - _Description:_ Whether or not the NGINX Mainline Repo is enabled?
  - _Default:_ `true`
- `['nginx-repo']['nginx-mainline-source']['yum']['repositoryid']`
  - _Type:_ String
  - _Description:_ Unique Name for NGINX Mainline Source Repo
  - _Default:_ `nginx-mainline-source`
- `['nginx-repo']['nginx-mainline-source']['yum']['description']`
  - _Type:_ String
  - _Description:_ Description of NGINX Mainline Source Repo
  - _Default:_ `nginx mainline source repo`
- `['nginx-repo']['nginx-mainline-source']['yum']['baseurl']`
  - _Type:_ String
  - _Description:_ URL of NGINX Mainline Source Repo
  - _Default:_ `http://nginx.org/packages/mainline/#{node['platform']}/#{node['platform_version'].to_i}/SRPMS/`
- `['nginx-repo']['nginx-mainline-source']['yum']['gpgcheck']`
  - _Type:_ Boolean
  - _Description:_ Whether or not NGINX Mainline Source Repo should perform GPG check of packages?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline-source']['yum']['sslverify']`
  - _Type:_ Boolean
  - _Description:_ Whether or not yum will verify the NGINX Mainline Source Repo SSL host?
  - _Default:_ `false`
- `['nginx-repo']['nginx-mainline-source']['yum']['enabled']`
  - _Type:_ Boolean
  - _Description:_ Whether or not the NGINX Mainline Source Repo is enabled?
  - _Default:_ `true`

Usage
-----
#### nginx-repo::default
Just include `nginx-repo` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx-repo]"
  ]
}
```

Contributing
------------
1. Fork the repository on GitHub
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using GitHub

Development Environment
-------------------
This repository contains a Vagrantfile which can be used to spin up a
fully configured development environment in Vagrant.  

Vagrant requires the following:
- [VirtualBox](https://www.virtualbox.org/)
- [Vagrant](https://www.vagrantup.com/)

The Vagrant environment for this repository is based on:
- [st-isidore-de-seville/trusty64-rvm-docker](https://atlas.hashicorp.com/st-isidore-de-seville/boxes/trusty64-rvm-docker)

The Vagrant environment will initialize itself to:
- install required Ruby gems
- run integration testing via kitchen-docker when calling `kitchen`

The Vagrant environment can be spun up by performing the following commands:

1. `vagrant up`
2. `vagrant ssh`
3. `cd /vagrant`

Authors
-------------------
- Author:: St. Isidore de Seville (st.isidore.de.seville@gmail.com)

License
-------------------
```text
The MIT License (MIT)

Copyright (c) 2015 St. Isidore de Seville (st.isidore.de.seville@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
