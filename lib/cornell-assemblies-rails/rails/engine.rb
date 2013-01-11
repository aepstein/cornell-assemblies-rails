# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      config.autoload_paths << File.expand_path("../../../app/inputs", __FILE__)
      initializer "cornell-assemblies-rails.authenticator" do
        ::ActionController::Base.send :include, Authenticator
        ::ActionController::Base.send :include, Breadcrumbs
        ::ActiveRecord::Base.send :include, Notifiable
        ::ActiveRecord::Base.send :include, Authenticable
        ::ActiveRecord::Base.send :include, Searchable
        ::ActiveRecord::Base.send :include, HasPhone
        ::ActiveRecord::Base.send :include, HasLdapEntry
        ::ActiveSupport.on_load :action_view do
          DatePickerInput
          DateTimePickerInput
          CocoonInput
          ::ActionView::Base.send :include, TableHelpers
          ::ActionView::Base.send :include, MarkdownHelpers
        end
      end
    end

  end
end

