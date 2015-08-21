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
Per http://wiki.nginx.org/Install, there are currently two versions of nginx.
The mainline branch gets new features and bugfixes sooner but might introduce
new bugs as well.  Critical bugfixes are backported to the stable branch.  In
general, the stable release is recommended, but the mainline release is
typically quite stable as well.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['managed']</tt></td>
    <td>Boolean</td>
    <td>Does this cookbook manage the install of the nginx-stable repo?</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['managed']</tt></td>
    <td>Boolean</td>
    <td>Does this cookbook manage the install of the nginx-mainline repo?</td>
    <td><tt>false</tt></td>
  </tr>
</table>

#### nginx-repo::_apt
The apt recipe is for managing the nginx apt repostories.  Any attribute
supported by the [apt cookbook](https://github.com/opscode-cookbooks/apt#attribute-parameters) is
supported by this cookbook and can be used to override attributes in this cookbook.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['apt']['uri']</tt></td>
    <td>String</td>
    <td>URI of nginx Stable Repo</td>
    <td><tt>http://nginx.org/packages/#{node['platform']}</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['apt']['distribution']</tt></td>
    <td>String</td>
    <td>Package distribution of nginx Stable Repo</td>
    <td><tt>node['lsb']['codename']</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['apt']['components']</tt></td>
    <td>Array</td>
    <td>nginx Stable Repo Package Groupings</td>
    <td><tt>['nginx']</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['apt']['key']</tt></td>
    <td>String</td>
    <td>Cookbook File for nginx Stable Repo Signing Key</td>
    <td><tt>nginx_signing.key</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['apt']['deb-src']</tt></td>
    <td>Boolean</td>
    <td>Whether or not to include the nginx-stable source repo?</td>
    <td><tt>false</tt></td>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['apt']['uri']</tt></td>
    <td>String</td>
    <td>URI of nginx Mainline Repo</td>
    <td><tt>http://nginx.org/packages/mainline/#{node['platform']}</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['apt']['distribution']</tt></td>
    <td>String</td>
    <td>Package distribution of nginx Mainline Repo</td>
    <td><tt>node['lsb']['codename']</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['apt']['components']</tt></td>
    <td>Array</td>
    <td>nginx Mainline Repo Package Groupings</td>
    <td><tt>['nginx']</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['apt']['key']</tt></td>
    <td>String</td>
    <td>Cookbook File for nginx Mainline Repo Signing Key</td>
    <td><tt>nginx_signing.key</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['apt']['deb-src']</tt></td>
    <td>Boolean</td>
    <td>Whether or not to include the nginx-mainline source repo?</td>
    <td><tt>false</tt></td>
  </tr>
</table>

#### nginx-repo::_yum
The yum recipe is for managing the nginx yum repostories.  Any attribute
supported by the [yum cookbook](https://github.com/chef-cookbooks/yum#parameters) is
supported by this cookbook and can be used to override attributes in this cookbook.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['managed']</tt></td>
    <td>Boolean</td>
    <td>Does this cookbook manage the install of the nginx-stable-source repo?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['managed']</tt></td>
    <td>Boolean</td>
    <td>Does this cookbook manage the install of the nginx-mainline-source repo?</td>
    <td><tt>false</tt></td>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['repositoryid']</tt></td>
    <td>String</td>
    <td>Unique Name for nginx Stable Repo</td>
    <td><tt>nginx-stable</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['description']</tt></td>
    <td>String</td>
    <td>Description of nginx Stable Repo</td>
    <td><tt>nginx stable repo</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['baseurl']</tt></td>
    <td>String</td>
    <td>URL of nginx Stable Repo</td>
    <td><tt>http://nginx.org/packages/#{node['platform']}/#{node['platform_version'].to_i}/$basearch/</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['gpgcheck']</tt></td>
    <td>Boolean</td>
    <td>Whether or not nginx Stable Repo should perform GPG check of packages?
    </td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['sslverify']</tt></td>
    <td>Boolean</td>
    <td>Whether or not yum will verify the nginx Stable Repo SSL host?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable']['yum']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Whether or not the nginx Stable Repo is enabled?</td>
    <td><tt>true</tt></td>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['repositoryid']</tt></td>
    <td>String</td>
    <td>Unique Name for nginx Stable Source Repo</td>
    <td><tt>nginx-stable-source</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['description']</tt></td>
    <td>String</td>
    <td>Description of nginx Stable Source Repo</td>
    <td><tt>nginx stable source repo</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['baseurl']</tt></td>
    <td>String</td>
    <td>URL of nginx Stable Source Repo</td>
    <td><tt>http://nginx.org/packages/#{node['platform']}/#{node['platform_version'].to_i}/SRPMS/</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['gpgcheck']</tt></td>
    <td>Boolean</td>
    <td>Whether or not nginx Stable Source Repo should perform GPG check of packages?
    </td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['sslverify']</tt></td>
    <td>Boolean</td>
    <td>Whether or not yum will verify the nginx Stable Source Repo SSL host?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-stable-source']['yum']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Whether or not the nginx Stable Source Repo is enabled?</td>
    <td><tt>true</tt></td>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['repositoryid']</tt></td>
    <td>String</td>
    <td>Unique Name for nginx Mainline Repo</td>
    <td><tt>nginx-mainline</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['description']</tt></td>
    <td>String</td>
    <td>Description for nginx Mainline Repo</td>
    <td><tt>nginx mainline repo</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['baseurl']</tt></td>
    <td>String</td>
    <td>URL of nginx Mainline Repo</td>
    <td><tt>http://nginx.org/packages/mainline/#{node['platform']}/#{node['platform_version'].to_i}/$basearch/</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['gpgcheck']</tt></td>
    <td>Boolean</td>
    <td>Whether or not nginx Mainline Repo should perform GPG check of
    packages?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['sslverify']</tt></td>
    <td>Boolean</td>
    <td>Whether or not yum will verify the nginx Mainline Repo SSL host?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline']['yum']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Whether or not the nginx Mainline Repo is enabled?</td>
    <td><tt>true</tt></td>
  </tr>

  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['repositoryid']</tt></td>
    <td>String</td>
    <td>Unique Name for nginx Mainline Source Repo</td>
    <td><tt>nginx-mainline-source</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['description']</tt></td>
    <td>String</td>
    <td>Description of nginx Mainline Source Repo</td>
    <td><tt>nginx mainline source repo</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['baseurl']</tt></td>
    <td>String</td>
    <td>URL of nginx Mainline Source Repo</td>
    <td><tt>http://nginx.org/packages/mainline/#{node['platform']}/#{node['platform_version'].to_i}/SRPMS/</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['gpgcheck']</tt></td>
    <td>Boolean</td>
    <td>Whether or not nginx Mainline Source Repo should perform GPG check of packages?
    </td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['sslverify']</tt></td>
    <td>Boolean</td>
    <td>Whether or not yum will verify the nginx Mainline Source Repo SSL host?</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['nginx-repo']['nginx-mainline-source']['yum']['enabled']</tt></td>
    <td>Boolean</td>
    <td>Whether or not the nginx Mainline Source Repo is enabled?</td>
    <td><tt>true</tt></td>
  </tr>
</table>

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
