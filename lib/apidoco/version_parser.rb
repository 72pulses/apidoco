module Apidoco
  # Parses the documentation versions, keeps track of all the documented api versions
  class VersionParser
    def initialize
      self.base_path = Pathname('docs').join('api')
    end

    def documentations
      documentation_directories.map { |dir| Documentation.new(dir) }
    end

    def documentation(version)
      documentations.find { |doc| doc.version.eql?(version) }
    end

    private

    def documentation_directories
      base_path.children.select(&:directory?)
    end
  end
end
