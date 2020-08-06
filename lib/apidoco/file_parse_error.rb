module Apidoco
  class FileParseError < StandardError
    attr_accessor :file, :message

    def initialize(file, message)
      self.file = file
      self.message = message
    end

    def info
      "Failed to parse #{file}, #{message}"
    end
  end
end
