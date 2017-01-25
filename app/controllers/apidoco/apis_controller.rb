require_dependency "apidoco/application_controller"

module Apidoco
  class ApisController < ApplicationController
    def index
      @apis_structure = FolderParser.new('docs').call
      @apis = files_from_api_structure(@apis_structure)
    end

    private

    def files_from_api_structure(apis_structure)
      apis = []
      apis_structure.each do |item|
        if item[:is_folder]
          apis += files_from_api_structure(item[:children])
        else
          apis.push << item
        end
      end
      apis
    end
  end
end
