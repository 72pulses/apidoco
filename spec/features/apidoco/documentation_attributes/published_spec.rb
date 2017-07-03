require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'published', js: true do
    context 'when published is true' do
      it 'will list the documentation' do
        create_json = {
          published: true,
          name: 'Create Currency'
        }
        DocumentationBuilder.create(create_json)

        visit '/apidoco'
        expect(page).to have_text(create_json[:name])
      end
    end

    context 'when published is false' do
      it 'will list the documentation' do
        create_json = {
          published: false,
          name: 'Create Currency'
        }
        DocumentationBuilder.create(create_json)

        visit '/apidoco'
        expect(page).to have_no_text(create_json[:name])
      end
    end
  end
end
