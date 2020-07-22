require 'rails_helper'

describe Apidoco::VersionParser do
  let(:v1_directory) { double(basename: 'v1', directory?: true, children: []) }
  let(:v2_directory) { double(basename: 'v2', directory?: true, children: []) }
  let(:base_directory) { double(children: [v1_directory, v2_directory]) }
  let(:version_parser) { described_class.new }

  before { allow(version_parser).to receive(:base_path).and_return(base_directory) }

  describe '#documentations' do
    subject(:documentations) { version_parser.documentations }

    before do
      expect(Apidoco::VersionDocumentation).to receive(:new).with(v1_directory).and_call_original
      expect(Apidoco::VersionDocumentation).to receive(:new).with(v2_directory).and_call_original
    end

    it { is_expected.to include(an_instance_of(Apidoco::VersionDocumentation)) }
  end

  describe '#documentation' do
    subject(:documentation) { version_parser.documentation('v1') }

    it { expect(documentation.name).to eq('v1') }
  end
end
