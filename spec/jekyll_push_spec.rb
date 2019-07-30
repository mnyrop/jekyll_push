# frozen_string_literal: true

describe JekyllPush do
  before(:all) do
    Test.reset
  end

  describe '#config_from_file' do
    context 'when a valid config file is available' do
      it 'reads it as a Hash' do
        expect(JekyllPush.config_from_file).to be_a Hash
      end
    end

    context 'when the expected config path does not exist' do
      let(:path) { 'doesnt_exist.yml' }

      it 'raises JekyllPush::Error::InvalidConfig' do
        expect { JekyllPush.config_from_file path }.to raise_error JekyllPush::Error::InvalidConfig
      end
    end

    context 'when the file provided is invalid YAML' do
      let(:path) { '_invalid_format_config.yml' }

      it 'raises JekyllPush::Error::InvalidConfig' do
        expect { JekyllPush.config_from_file path }.to raise_error JekyllPush::Error::InvalidConfig
      end
    end
  end
end
