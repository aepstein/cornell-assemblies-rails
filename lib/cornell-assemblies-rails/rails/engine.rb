# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      initializer "cornell-assemblies-rails.authenticator" do
        ActiveSupport.on_load(:action_controller) do
          include Authenticator
        end
      end
    end

  end
end

