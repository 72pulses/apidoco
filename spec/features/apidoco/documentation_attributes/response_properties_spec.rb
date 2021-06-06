require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'respose_properties', js: true do
    it 'will list the documentation' do
      properties = [
        {
          key: 'success',
          type: 'Boolean'
        },
        {
          key: 'message',
          type: 'String',
          description: 'It can be any generic message.'
        }
      ]
      create_json = {
        name: 'Create Currency',
        end_point: '/currencies',
        published: true,
        response_properties: properties
      }
      DocumentationBuilder.create(create_json)

      visit '/apidoco'
      page.click_on('Response')

      expect(page).to have_text(properties[0][:key])
      expect(page).to have_text(properties[0][:type].downcase)

      expect(page).to have_text(properties[0][:key])
      expect(page).to have_text(properties[0][:type].downcase)
      expect(page).to have_text(properties[0][:description])
    end
  end
end
