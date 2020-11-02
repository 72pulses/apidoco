require 'capybara/rspec'
require 'capybara/apparition'

Capybara.register_driver :apparition_debug do |app|
  Capybara::Apparition::Driver.new(
    app,
    headless: true, # Set this to false if you want to launch in a browser
    window_size: [2000, 1500]
  )
end

Capybara.javascript_driver = :apparition_debug
