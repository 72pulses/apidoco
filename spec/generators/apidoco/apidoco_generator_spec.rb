require 'rails/generators'
require 'generators/apidoco_generator'
require 'generator_spec'

describe ApidocoGenerator, type: :generator do
  def remove_docs_directory
    FileUtils.rm_rf("#{Rails.root}/docs")
  end

  after(:all) do
    remove_docs_directory
  end

  context 'default actions' do
    it 'creates a crud documentation files' do
      run_generator %w[api/v1/posts]
      assert_file "#{Rails.root}/docs/api/v1/posts/create.json", %r{api/v1/posts.json}
      assert_file "#{Rails.root}/docs/api/v1/posts/destroy.json", %r{api/v1/posts/:id.json}
      assert_file "#{Rails.root}/docs/api/v1/posts/index.json", %r{api/v1/posts.json}
      assert_file "#{Rails.root}/docs/api/v1/posts/show.json", %r{api/v1/posts/:id.json}
      assert_file "#{Rails.root}/docs/api/v1/posts/update.json", %r{api/v1/posts/:id.json}
    end
  end

  context 'custom actions' do
    let(:upload_acton) { 'upload' }

    it 'creates the documentation files for the actions supplied in arguments' do
      run_generator ['api/v1/posts', upload_acton]

      assert_file "#{Rails.root}/docs/api/v1/posts/#{upload_acton}.json"
    end
  end
end
