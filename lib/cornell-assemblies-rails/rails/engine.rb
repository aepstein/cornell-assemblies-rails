# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      require 'cocoon'
      config.autoload_paths << File.expand_path("../../../app/inputs", __FILE__)
      initializer "cornell-assemblies-rails.authenticator" do
        ::ActionController::Base.send :include, Authenticator
        ::ActionController::Base.send :include, Breadcrumbs
        ::ActiveRecord::Base.send :include, Notifiable
        ::ActiveRecord::Base.send :include, Authenticable
        ::ActiveRecord::Base.send :include, Searchable
        ActiveSupport.on_load :action_view do
          DatePickerInput
          DateTimePickerInput
        end
      end
    end

  end
end

