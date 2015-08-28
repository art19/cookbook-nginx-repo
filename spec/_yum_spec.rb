require 'spec_helper'

describe 'nginx-repo::_yum' do
  describe 'when on redhat 7.0' do
    describe 'by default' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.0')
          .converge(described_recipe)
      end

      it 'should create the nginx-stable repo with default attribs' do
        expect(chef_run).to create_yum_repository('nginx-stable').with(
          description: 'nginx stable repo',
          baseurl: 'http://nginx.org/packages/redhat/7/$basearch/',
          gpgcheck: false,
          sslverify: false,
          enabled: true
        )
      end

      it 'should not create the nginx-stable-source repo' do
        expect(chef_run).to_not create_yum_repository('nginx-stable-source')
      end

      it 'should not create the nginx-mainline repo' do
        expect(chef_run).to_not create_yum_repository('nginx-mainline')
      end

      it 'should not create the nginx-mainline-source repo' do
        expect(chef_run).to_not create_yum_repository('nginx-mainline-source')
      end
    end

    describe 'when nginx-stable is not managed and non-stable repos managed' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.0') do |node|
          node.set['nginx-repo']['nginx-stable']['managed'] = false
          node.set['nginx-repo']['nginx-stable-source']['managed'] = true
          node.set['nginx-repo']['nginx-mainline']['managed'] = true
          node.set['nginx-repo']['nginx-mainline-source']['managed'] = true
        end.converge(described_recipe)
      end

      it 'should not create the nginx-stable repo' do
        expect(chef_run).to_not create_yum_repository('nginx-stable')
      end

      it 'should create the nginx-stable-source repo with default attribs' do
        expect(chef_run).to create_yum_repository('nginx-stable-source').with(
          description: 'nginx stable source repo',
          baseurl: 'http://nginx.org/packages/redhat/7/SRPMS/',
          gpgcheck: false,
          sslverify: false,
          enabled: true
        )
      end

      it 'should create the nginx-mainline repo with default attribs' do
        expect(chef_run).to create_yum_repository('nginx-mainline').with(
          description: 'nginx mainline repo',
          baseurl: 'http://nginx.org/packages/mainline/redhat/7/$basearch/',
          gpgcheck: false,
          sslverify: false,
          enabled: true
        )
      end

      it 'should create the nginx-mainline-source repo default attribs' do
        expect(chef_run).to create_yum_repository('nginx-mainline-source').with(
          description: 'nginx mainline source repo',
          baseurl: 'http://nginx.org/packages/mainline/redhat/7/SRPMS/',
          gpgcheck: false,
          sslverify: false,
          enabled: true
        )
      end
    end

    describe 'when adding a custom nginx repo' do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.0') do |node|
          node.set['nginx-repo']['nginx-new']['managed'] = true
          node.set['nginx-repo']['nginx-new']['yum']['repositoryid'] = 'nginx-new'
          node.set['nginx-repo']['nginx-new']['yum']['description'] = 'nginx New'
          node.set['nginx-repo']['nginx-new']['yum']['baseurl'] = 'http://path.to.nginx'
          node.set['nginx-repo']['nginx-new']['yum']['gpgcheck'] = true
          node.set['nginx-repo']['nginx-new']['yum']['gpgkey'] = 'file://path/to/gpg/key'
          node.set['nginx-repo']['nginx-new']['yum']['sslverify'] = false
          node.set['nginx-repo']['nginx-new']['yum']['enabled'] = true
        end.converge(described_recipe)
      end

      it 'should create the nginx-new repo' do
        expect(chef_run).to create_yum_repository('nginx-new').with(
          repositoryid: 'nginx-new',
          description: 'nginx New',
          baseurl: 'http://path.to.nginx',
          gpgcheck: true,
          gpgkey: 'file://path/to/gpg/key',
          sslverify: false,
          enabled: true
        )
      end
    end
  end

  ['5.10', '6.0', '7.0'].each do |version|
    describe "when on redhat #{version}" do
      let(:chef_run) do
        ChefSpec::SoloRunner.new(platform: 'redhat', version: version)
          .converge(described_recipe)
      end

      it 'should not raise an error' do
        expect { chef_run }.to_not raise_error
      end
    end
  end

  describe 'when on an unsupported platform' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.0') do |node|
        node.set['nginx-repo']['rhel']['supported-versions']['7'] = false
      end.converge(described_recipe)
    end

    it 'should raise an error' do
      expect { chef_run }.to raise_error('rhel/redhat/7.0 is not supported by the _yum recipe')
    end
  end
end
