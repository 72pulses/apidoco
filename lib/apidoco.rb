require 'angularjs-rails'

require 'apidoco/engine'
require 'apidoco/version_parser'
require 'apidoco/version_documentation'
require 'apidoco/folder_parser'
require 'apidoco/file_parser'

APIDOCO_TITLE = 'ApiDoco'

module Apidoco
  mattr_accessor :app_name, :auth_name, :auth_password

  self.app_name = APIDOCO_TITLE
end
