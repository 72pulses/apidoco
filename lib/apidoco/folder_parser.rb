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

    def call
      Dir.glob("#{@folder}/**").map do |child|
        if directory?(child)
          build_folder_components(child)
        else
          build_file_response(child)
        end
      end
    end

    private

    def directory?(name)
      File.directory?(name)
    end

    def file?(name)
      File.file?(name)
    end

    def json_file?(name)
      file?(name) && name.ends_with?('.json')
    end

    def build_folder_components(name)
      folder_name = name.split('/').last.try(:titleize)

      {
        is_folder: true,
        name: folder_name,
        children: Apidoco::FolderParser.new(name).call
      }
    end

    def build_file_response(name)
      file_name = name.split('/').last.gsub('.json', '').try(:titleize)

      {
        is_folder: false,
        name: file_name,
        file: JSON.parse(File.read(name))
      }
    end
  end
end
