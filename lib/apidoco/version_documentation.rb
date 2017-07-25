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
        base_url: '',
        apis: documentations.flat_map(&:as_json)
      }
    end

    def documentations
      documentation_directories.map { |dir| FolderParser.new(dir) }
    end

    def documentation_directories
      directory.children.select(&:directory?)
    end
  end
end
