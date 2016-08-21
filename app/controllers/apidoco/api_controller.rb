require_dependency "apidoco/application_controller"

module Apidoco
  class ApiController < ApplicationController
    def index
      @v1 = VersionParser.new.documentations.first.as_json
    end
  end
end
