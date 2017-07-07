module Apidoco
  module ApplicationHelper
    def documentation_versions(version_parser)
      version_parser.documentations.map do |documentation|
        { name: documentation.name, path: api_path(id: documentation.name) }
      end
    end

    def build_documentation_array(documentations, path: [])
      documentation_array = documentations.map do |documentation|
        if documentation[:is_folder]
          build_documentation_array(documentation[:children], path: path +  [documentation[:name]])
        else
          documentation.merge!(path: path)
        end
      end

      documentation_array.flatten
    end
  end
end
