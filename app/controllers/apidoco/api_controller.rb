require_dependency "apidoco/application_controller"

module Apidoco
  class ApiController < ApplicationController
    def index
      @v1 = File.read(Rails.root.join('docs', 'api', 'v1.json'))
    end
  end
end
