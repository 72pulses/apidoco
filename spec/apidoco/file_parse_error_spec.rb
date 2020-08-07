require 'rails_helper'

describe Apidoco::FileParseError do
  let(:error) { described_class.new(Pathname.new('tmp/test.json'), 'Test') }

  describe '#info' do
    subject(:info) { error.info }

    it { is_expected.to eq('Failed to parse tmp/test.json, Test') }
  end
end
