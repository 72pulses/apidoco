require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'name', js: true do
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
end
