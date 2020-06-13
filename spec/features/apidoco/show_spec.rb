require 'rails_helper'

RSpec.feature 'Show Page', type: :feature do
  describe 'title', js: true do
    it 'shows the app name as its title' do
      Apidoco.app_name = 'MyApp API Documentation'
      DocumentationBuilder.create({}) # setting the minimum to load the page
      visit '/apidoco'
      expect(page).to have_title(Apidoco.app_name)
      expect(page).to have_text(Apidoco.app_name) # shows the title in the sidebar
    end
  end
end
