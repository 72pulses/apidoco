require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'http_method', js: true do
    it 'will list the documentation' do
      create_json = {
        published: true,
        name: 'Create Currency',
        http_method: '/currencies'
      }
      DocumentationBuilder.create(create_json)

      visit '/apidoco'
      expect(page).to have_text(create_json[:http_method])
    end
  end
end
