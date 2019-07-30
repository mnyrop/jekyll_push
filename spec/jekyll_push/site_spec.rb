# frozen_string_literal: true

describe JekyllPush::Site do
  before(:each) { Test.reset }

  # ---------------
  # SITE.NEW
  # ---------------
  describe '#new' do
    context 'without a config hash' do
      let(:site) { JekyllPush::Site.new }

      it 'initializes a JekyllPush::Site' do
        expect(site).to be_a JekyllPush::Site
      end
    end

    context 'with an empty config hash' do
      let(:config) { {} }
      let(:site) { JekyllPush::Site.new config }

      it 'initializes a JekyllPush::Site' do
        expect(site).to be_a JekyllPush::Site
      end
    end

    context 'with a valid config hash' do
      let(:config) do
        { repo_name: 'test' }
      end
      let(:site) { JekyllPush::Site.new config }

      it 'initializes a JekyllPush::Site' do
        expect(site).to be_a JekyllPush::Site
      end
    end

    context 'with an invalid config' do
      it 'raises JekyllPush::Error::InvalidConfig' do
        expect { JekyllPush::Site.new [] }.to raise_error JekyllPush::Error::InvalidConfig
      end
    end
  end

  # ---------------
  # SITE.REBUILD
  # ---------------
  describe '#rebuild' do
    let(:site) { JekyllPush::Site.new }

    context 'with arbitrary test branch' do
      let(:target) { 'test_branch' }

      it 'rebuilds the site' do
        quiet_stdout { site.rebuild target }
        # expect(site.dir).to exist
      end
    end

    context 'with gh-pages branch' do
      let(:target) { 'gh-pages' }

      it 'rebuilds the site' do
        quiet_stdout { site.rebuild target }
        # expect(site.dir).to exist
      end
    end
  end

  # ---------------
  # SITE.GH_BASEURL
  # ---------------
  describe '#gh_baseurl' do
    let(:site_with_repo_name) do
      config = {
        url: '',
        baseurl: '/base',
        repo_name: 'test_repo'
      }
      JekyllPush::Site.new config
    end
    let(:site_without_repo_name) do
      config = {
        url: '',
        baseurl: '/base'
      }
      JekyllPush::Site.new config
    end

    context 'when a repo_name is configured' do
      it 'returns the repo_name prepended with a slash' do
        result = quiet_stdout { site_with_repo_name.gh_baseurl }
        expect(result).to eq('/test_repo')
      end
    end

    context 'when a repo_name is not configured' do
      it 'returns the baseurl value' do
        result = quiet_stdout { site_with_repo_name.baseurl }
        expect(result).to eq('/base')
      end
    end
  end
end
