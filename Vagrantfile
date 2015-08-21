script = <<SCRIPT
# Fix stdin: is not a tty (am not sure this is succesful)
#  https://bugs.launchpad.net/ubuntu/+source/xen-3.1/+bug/1167281
sed -i 's/mesg n/tty -s \\&\\& mesg n/g' /root/.profile
source /root/.profile

# Add Chef apt-get repository
wget -qO - https://packagecloud.io/gpg.key | apt-key add -
add-apt-repository -y \
  "deb https://packagecloud.io/chef/stable/ubuntu trusty main"

# Pick up added repositories
apt-get update

# Install Packages
apt-get install -y chefdk emacs24-nox git git-flow

# Install Docker
#  https://docs.docker.com/installation/ubuntulinux/
wget -qO- https://get.docker.com/ | sh

# Modify environment to make ChefDK the default Ruby
su -c "echo >> ~/.bashrc" vagrant
su -c "echo '# Modify Vagrant to use ChefDK default Ruby' >> ~/.bashrc" vagrant
su -c "echo 'eval \\$(chef shell-init bash)' >> ~/.bashrc" vagrant

# Install Kitchen-Docker Ruby Gem
su -l -c "chef exec gem install kitchen-docker" vagrant

# Configure Kitchen to use Kitchen-Docker within Vagrant
su -c "echo >> ~/.bashrc" vagrant
su -c "echo '# Modify Vagrant to use Kitchen-Docker' >> ~/.bashrc" vagrant
su -c "echo 'export KITCHEN_YAML=/vagrant/.kitchen.docker.yml' >> ~/.bashrc" vagrant

# Configure git Environment
su -c "git config --global push.default simple" vagrant
SCRIPT

Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/trusty64'

  config.vm.provision 'shell', inline: script
end
