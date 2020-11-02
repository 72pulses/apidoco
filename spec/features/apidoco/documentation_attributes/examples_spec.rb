require 'rails_helper'

RSpec.feature 'Document Attributes', type: :feature do
  describe 'examples', js: true do
    it 'will list the documentation' do
      create_json = {
        published: true,
        examples: [{
          request: {
            currency: {
              name: "US dollar",
              symbol: "$",
              exchange_rate: "1.3"
            }
          },
          response: {
            currency: {
              id: "8",
              name: "us dollar",
              symbol: "$",
              exchange_rate: "1.3"
            }
          }
        }]
      }
      DocumentationBuilder.create(create_json)

      visit '/apidoco'
      request = create_json[:examples][0][:request][:currency]
      response = create_json[:examples][0][:response][:currency]

      request.each do |key, value|
        expect(page).to have_text(format('"%s": "%s"', key, value))
      end

      page.click_on('Response')

      response.each do |key, value|
        expect(page).to have_text(format('"%s": "%s"', key, value))
      end
    end
  end
end
