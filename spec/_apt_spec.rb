require 'spec_helper'

describe 'nginx-repo::_apt' do
  describe 'when on ubuntu 12.04' do
    describe 'by default' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04')
          .converge(described_recipe)
      end

      it 'should add the nginx-stable repo with default attribs' do
        expect(chef_run).to add_apt_repository('nginx-stable').with(
          uri: 'http://nginx.org/packages/ubuntu/',
          distribution: 'precise',
          components: ['nginx'],
          key: 'nginx_signing.key',
          deb_src: false
        )
      end

      it 'should not add the nginx-mainline repo' do
        expect(chef_run).to_not add_apt_repository('nginx-mainline')
      end
    end

    describe 'when nginx-stable is not managed and nginx-mainline is managed' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') do |node|
          node.set['nginx-repo']['nginx-stable']['managed'] = false
          node.set['nginx-repo']['nginx-mainline']['managed'] = true
        end.converge(described_recipe)
      end

      it 'should not add the nginx-stable repo' do
        expect(chef_run).to_not add_apt_repository('nginx-stable')
      end

      it 'should add the nginx-mainline repo with default attribs' do
        expect(chef_run).to add_apt_repository('nginx-mainline').with(
          uri: 'http://nginx.org/packages/mainline/ubuntu/',
          distribution: 'precise',
          components: ['nginx'],
          key: 'nginx_signing.key',
          deb_src: false
        )
      end
    end

    describe 'when adding a custom nginx repo' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04') do |node|
          node.set['nginx-repo']['nginx-new']['managed'] = true
          node.set['nginx-repo']['nginx-new']['apt']['uri'] = 'http://path.to.nginx'
          node.set['nginx-repo']['nginx-new']['apt']['distribution'] = 'precise'
          node.set['nginx-repo']['nginx-new']['apt']['components'] = ['nginx']
          node.set['nginx-repo']['nginx-new']['apt']['key'] = 'file://path/to/gpg/key'
          node.set['nginx-repo']['nginx-new']['apt']['deb-src'] = false
        end.converge(described_recipe)
      end

      it 'should add the nginx-new repo' do
        expect(chef_run).to add_apt_repository('nginx-new').with(
          uri: 'http://path.to.nginx',
          distribution: 'precise',
          components: ['nginx'],
          key: 'file://path/to/gpg/key',
          deb_src: false
        )
      end
    end
  end
end
