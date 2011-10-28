# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      initializer "cornell-assemblies-rails.authenticator" do
        ::ActionController::Base.send :include, Authenticator
        ::ActionController::Base.send :include, Breadcrumbs
        ::ActiveRecord::Base.send :include, Notifiable
        ::ActiveRecord::Base.send :include, Authenticable
      end
    end

  end
end

