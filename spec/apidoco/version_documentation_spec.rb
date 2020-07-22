require 'rails_helper'

describe Apidoco::VersionDocumentation do
  let(:sub_directory) do
    double(basename: 'users', directory?: true, children: [])
  end
  let(:directory) do
    double(basename: 'v1', children: [sub_directory])
  end
  let(:version_documentation) { described_class.new(directory) }

  describe '#name' do
    subject(:name) { version_documentation.name }

    it { is_expected.to eq('v1') }
  end

  describe '#as_json' do
    subject(:as_json) { version_documentation.as_json }

    describe 'name' do
      it { is_expected.to include(name: 'v1') }
    end

    describe 'base_url' do
      it { is_expected.to include(base_url: '') }
    end

    describe 'apis' do
      before { expect(Apidoco::FolderParser).to receive(:new).with(sub_directory).and_call_original }

      it { is_expected.to include(apis: an_instance_of(Array)) }
    end
  end

  describe '#documentations' do
    subject(:documentations) { version_documentation.documentations }

    it { is_expected.to include(an_instance_of(Apidoco::FolderParser)) }
  end
end
