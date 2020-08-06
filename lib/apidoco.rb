require 'angularjs-rails'

require 'apidoco/engine'
require 'apidoco/version_parser'
require 'apidoco/version_documentation'
require 'apidoco/folder_parser'
require 'apidoco/file_parser'
require 'apidoco/file_parse_error'

APIDOCO_TITLE = 'ApiDoco'

module Apidoco
  mattr_accessor :app_name, :auth_name, :auth_password, :base_path

  self.app_name = APIDOCO_TITLE
  self.base_path = 'docs/api'
end
