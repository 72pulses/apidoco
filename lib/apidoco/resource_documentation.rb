module Apidoco
  class ResourceDocumentation
    attr_accessor :directory

    def initialize(directory)
      self.directory = directory
    end

    def as_json
      children.map { |c| JSON.parse(File.read(c)) }
    end

    def children
      directory.children.select do |child|
        child.extname.eql?('.json')
      end
    end
  end
end
