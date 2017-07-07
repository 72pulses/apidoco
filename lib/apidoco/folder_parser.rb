module Apidoco
  # Parse a folder and find all the sub folders and files
  class FolderParser
    attr_accessor :directory

    def initialize(directory)
      self.directory = directory
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
        child.directory? ? Apidoco::FolderParser.new(child) : Apidoco::FileParser.new(child)
      end
    end
  end
end
