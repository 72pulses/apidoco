require_dependency "apidoco/application_controller"

module Apidoco
  class ApisController < ApplicationController
    before_action :set_version_parser

    def index
      redirect_to api_path(id: @vp.documentations.first.name)
      # @v1 = VersionParser.new.documentations.first.as_json
    end

    def show
      @documentation = @vp.documentation(params[:id])
      @data = @documentation.as_json
    end

    private

    def set_version_parser
      @vp = VersionParser.new
    end
  end
end
