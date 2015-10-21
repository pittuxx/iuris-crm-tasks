module Iuris
  module Tasks
    class Engine < ::Rails::Engine
      isolate_namespace Iuris::Tasks
      paths["app/views"] << "app/views/iuris/tasks"

      initializer :append_migrations do |app|
        unless app.root.to_s.match(root.to_s)
          config.paths["db/migrate"].expanded.each do |p|
            app.config.paths["db/migrate"] << p
          end
        end
      end
    
      config.to_prepare do
        Dir.glob(Engine.root.join("app", "decorators", "**", "*_decorator*.rb")) do |c|
          Rails.configuration.cache_classes ? require(c) : load(c)
        end
      end

      # Helpers del engine disponibles en la app
      # Cuidado con los conflictos de nombres
      initializer 'tasks.action_controller' do |app|
        ActiveSupport.on_load :action_controller do
          helper Iuris::Tasks::ApplicationHelper
        end
      end
    end  
  end
end



