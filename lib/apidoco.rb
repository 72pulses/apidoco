require 'angularjs-rails'

require 'apidoco/engine'
require 'apidoco/version_parser'
require 'apidoco/version_documentation'
require 'apidoco/resource_documentation'

module Apidoco
  mattr_accessor :auth_name, :auth_password
end
