module Apidoco
  # Parse a folder and find all the sub folders and files
  class FileParser
    attr_accessor :file, :parents

    def initialize(file, parents:)
      self.file = file
      self.parents = parents
    end

    def as_json
      content.merge(parents: parents, id: id)
    end

    def content
      JSON.parse(File.read(file))
    end

    def id
      parents.push(content['name']).join('-').downcase.delete(' ')
    end

    def published?
      content['published'].nil? || content['published']
    end

    def sort_order
      content['sort_order'] || 999
    end
  end
end
