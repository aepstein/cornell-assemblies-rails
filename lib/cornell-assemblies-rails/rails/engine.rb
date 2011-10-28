# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      initializer "cornell-assemblies-rails.authenticator" do
        ::ActionController::Base.include ActionController
      end
    end

  end
end

