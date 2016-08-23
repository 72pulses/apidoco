module Apidoco
  module ApplicationHelper
    def documentation_versions(version_parser)
      version_parser.documentations.map do |documentation|
        { name: documentation.name, path: api_path(id: documentation.name) }
      end
    end
  end
end
