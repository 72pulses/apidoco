module Apidoco
  # Parse a folder and find all the sub folders and files
  class FileParser
    attr_accessor :file

    def initialize(file)
      self.file = file
    end

    def as_json
      content
    end

    def content
      JSON.parse(File.read(file))
    end
  end
end
