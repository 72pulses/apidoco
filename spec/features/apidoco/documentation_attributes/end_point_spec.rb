require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'end_point', js: true do
    it 'will list the documentation' do
      create_json = {
        published: true,
        name: 'Create Currency',
        end_point: '/currencies'
      }
      DocumentationBuilder.create(create_json)

      visit '/apidoco'
      expect(page).to have_css("input[value=\"#{create_json[:end_point]}\"]")
    end
  end
end
