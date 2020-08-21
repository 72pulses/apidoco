module Apidoco
  class Engine < ::Rails::Engine
    isolate_namespace Apidoco

    config.assets.paths <<  Pathname.new(File.expand_path('../../../node_modules', __FILE__))
  end
end
