require 'warden'
module Subscribem
  class Engine < ::Rails::Engine
    isolate_namespace Subscribem
    config.middleware.use Warden::Manager
  end
end
