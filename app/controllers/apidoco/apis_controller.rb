require_dependency 'apidoco/application_controller'

module Apidoco
  class ApisController < ApplicationController
    before_action :set_version_parser

    http_basic_authenticate_with name: Apidoco.auth_name, password: Apidoco.auth_password,
                                 if: proc { Apidoco.auth_name && Apidoco.auth_password }

    def index
      redirect_to api_path(id: @vp.documentations.first.name)
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
