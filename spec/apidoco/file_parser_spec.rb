require 'rails_helper'

describe Apidoco::FileParser do
  let(:doc) { { name: 'Create Resource' } }
  let(:file) do
    Tempfile.new.tap do |f|
      f.write(doc.to_json)
      f.rewind
    end
  end
  let(:file_parser) { described_class.new(file, parents: []) }

  after do
    file.close
    file.unlink
  end

  describe '#id' do
    subject(:id) { file_parser.id }

    it { is_expected.to eq('createresource') }
  end

  describe '#published?' do
    subject(:published?) { file_parser.published? }

    context 'when published key is not available in the doc' do
      it { is_expected.to eq true }
    end

    context 'when published key is true in the doc' do
      let(:doc) { { published: true } }

      it { is_expected.to eq true }
    end

    context 'when published key is false in the doc' do
      let(:doc) { { published: false } }

      it { is_expected.to eq false }
    end
  end

  describe '#sort_order' do
    subject(:sort_order) { file_parser.sort_order }

    context 'when sort_order key is not available in the doc' do
      it { is_expected.to eq 999 }
    end

    context 'when sort_order key is available in the doc' do
      let(:doc) { { sort_order: 25 } }

      it { is_expected.to eq 25 }
    end
  end
end
