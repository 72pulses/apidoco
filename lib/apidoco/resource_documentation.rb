module Apidoco
  class ResourceDocumentation
    attr_accessor :directory

    def initialize(directory)
      self.directory = directory
    end

    def as_json
      sort_json
    end

    def children_json
      doco_apis = children.map { |c| JSON.parse(File.read(c)) }
      doco_apis.delete_if { |h| h['published'] == false }
    end

    def sort_json
      children_json.sort_by { |k| k['sort_order'] }
    end

    def children
      directory.children.select do |child|
        child.extname.eql?('.json')
      end
    end
  end
end
