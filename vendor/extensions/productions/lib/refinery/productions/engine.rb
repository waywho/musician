module Refinery
  module Productions
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Productions

      engine_name :refinery_productions

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "productions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.productions_admin_productions_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Productions)
      end
    end
  end
end
