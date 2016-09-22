require "spec_helper"
require "rails/generators"
require "generators/apidoco_generator"
require "generator_spec"

describe ApidocoGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)
  arguments %w(api/v1/posts)

  before(:all) do
    prepare_destination
    run_generator
  end

  context 'default actions' do
    it "creates a crud documentation files" do
      # expect('docs/api/v1/posts/create.json').to be_an_existing_file
      assert_file "docs/api/v1/posts/create.json"#, "# Initializer"
    end
  end
end
