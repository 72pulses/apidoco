module Apidoco
  # Parse a folder and find all the sub folders and files
  class FolderParser
    attr_accessor :directory, :parents

    def initialize(directory, parents: [])
      self.directory = directory
      self.parents = parents
    end

    def as_json
      childs = children.select(&:published?).sort do |a, b|
        if a.sort_order.class == b.sort_order.class
          a.sort_order <=> b.sort_order
        elsif a.sort_order.is_a?(String)
          -1
        else
          1
        end
      end

      {
        is_folder: true,
        name: basename,
        children: childs.map(&:as_json)
      }
    end

    def basename
      directory.basename.to_s.titleize
    end

    def children
      directory.children.map do |child|
        hierrarchy = parents + [basename]
        if child.directory?
          Apidoco::FolderParser.new(child, parents: hierrarchy)
        else
          Apidoco::FileParser.new(child, parents: hierrarchy)
        end
      end
    end

    def published?
      true
    end

    def sort_order
      basename
    end
  end
end
