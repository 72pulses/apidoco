module Apidoco
  # Parses the documentation versions, keeps track of all the documented api versions
  class VersionParser
    BASE_PATH = Rails.root.join('docs', 'api')

    def initialize
      Dir.entries(BASE_PATH)
    end

    def documentations

    end
  end
end