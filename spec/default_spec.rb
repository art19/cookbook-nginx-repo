require 'spec_helper'

describe 'nginx-repo' do
  describe 'when on a debian platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '12.04')
        .converge(described_recipe)
    end

    it 'should include nginx-repo::_apt' do
      expect(chef_run).to include_recipe('nginx-repo::_apt')
    end
  end

  describe 'when on a rhel platform family' do
    let(:chef_run) do
      ChefSpec::SoloRunner.new(platform: 'redhat', version: '7.0')
        .converge(described_recipe)
    end

    it 'should include nginx-repo::_yum' do
      expect(chef_run).to include_recipe('nginx-repo::_yum')
    end
  end
end
