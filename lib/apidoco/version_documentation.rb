module Apidoco
  class VersionDocumentation
    attr_accessor :directory

    def initialize(directory)
      self.directory = directory
    end

    def name
      directory.basename.to_s
    end
    alias_method :version, :name

    def as_json
      {
        name: name,
        base_url: "",
        apis: resource_documentations.flat_map(&:as_json)
      }
    end

    def resource_documentations
      resource_directories.map { |dir| ResourceDocumentation.new(dir) }
    end

    protected

    def resource_directories
      directory.children.select(&:directory?)
    end
  end
end
