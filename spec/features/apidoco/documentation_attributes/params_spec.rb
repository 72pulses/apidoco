require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'params', js: true do
    context 'when required is true' do
      it 'will list the documentation' do
        create_json = {
          name: 'Create Currency',
          end_point: '/currencies',
          published: true,
          params: [{
            key: "currency['name']",
            required: true,
            type: "String"
          }]
        }
        DocumentationBuilder.create(create_json)

        visit '/apidoco'
        param = create_json[:params][0]
        expect(page).to have_text(param[:key])
        expect(page).to have_text("REQUIRED")
        expect(page).to have_text(param[:type].downcase)
      end
    end

    context 'when required is false' do
      it 'will list the documentation' do
        create_json = {
          published: true,
          params: [{
            key: "currency['name']",
            required: false,
            type: "String"
          }]
        }
        DocumentationBuilder.create(create_json)

        visit '/apidoco'
        param = create_json[:params][0]
        expect(page).to have_text(param[:key])
        expect(page).to have_text("OPTIONAL")
        expect(page).to have_text(param[:type].downcase)
      end
    end
  end
end
