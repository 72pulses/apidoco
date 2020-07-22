require 'rails_helper'

describe Apidoco::FolderParser do
  let(:doc) { { name: 'Create User' } }
  let(:file) do
    Tempfile.new.tap do |f|
      f.write(doc.to_json)
      f.rewind
    end
  end
  let(:directory) do
    double(basename: 'users', children: [file])
  end
  let(:folder_parser) { described_class.new(directory, parents: []) }

  after do
    file.close
    file.unlink
  end

  describe '#as_json' do
    before { allow(file).to receive(:directory?).and_return(false) }

    subject(:as_json) { folder_parser.as_json }

    describe 'is_folder' do
      it { is_expected.to include(is_folder: true) }
    end

    describe 'name' do
      it { is_expected.to include(name: 'Users') }
    end

    describe 'children' do
      it { expect(as_json[:children].first).to include(id: 'users-createuser', 'name' => 'Create User') }
    end
  end

  describe '#base_name' do
    subject(:basename) { folder_parser.basename }

    it { is_expected.to eq('Users') }
  end

  describe '#children' do
    subject(:children) { folder_parser.children }

    context 'when the child is a directory' do
      before { allow(file).to receive(:directory?).and_return(true) }

      it { expect(children.first).to be_instance_of(Apidoco::FolderParser) }
    end

    context 'when the child is a file' do
      before { allow(file).to receive(:directory?).and_return(false) }

      it { expect(children.first).to be_instance_of(Apidoco::FileParser) }
    end
  end

  describe '#published?' do
    subject(:published?) { folder_parser.published? }

    it { is_expected.to eq(true) }
  end

  describe '#sort_order' do
    subject(:sort_order) { folder_parser.sort_order }

    it { is_expected.to eq('Users') }
  end
end
