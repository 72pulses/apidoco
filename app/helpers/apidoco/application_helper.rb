module Apidoco
  module ApplicationHelper
    def documentation_versions(version_parser)
      version_parser.documentations.map do |documentation|
        { name: documentation.name, path: api_path(id: documentation.name) }
      end
    end

    def build_documentation_array(documentations)
      documentation_array = documentations.map do |documentation|
        documentation[:is_folder] ? build_documentation_array(documentation[:children]) : documentation
      end

      documentation_array.flatten
    end

    def documentation_for(documentation)
      if documentation[:is_folder]
        build_documentation_array(documentation[:children])
      else
        documentation
      end
    end
  end
end
