module Apidoco
  # Parse a folder and find all the sub folders and files
  class FolderParser
    attr_accessor :directory, :parents

    def initialize(directory, parents: [])
      self.directory = directory
      self.parents = parents
    end

    def as_json
      {
        is_folder: true,
        name: basename,
        children: children.map(&:as_json)
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
  end
end
