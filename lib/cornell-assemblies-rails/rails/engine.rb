# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      config.autoload_paths << File.expand_path("../../../app/inputs", __FILE__)
      initializer "cornell-assemblies-rails.authenticator" do
        Date::DATE_FORMATS[:us_short] = '%m/%d/%Y'
        Time::DATE_FORMATS[:us_short] = '%m/%d/%Y %I:%M:%S %P'
        Time::DATE_FORMATS[:us_ordinal] = lambda { |time|
          time.strftime "%B #{ActiveSupport::Inflector.ordinalize time.day}, %Y %I:%M %P" }
        ::ActionController::Base.send :include, Authenticator
        ::ActionController::Base.send :include, Breadcrumbs
        ::ActiveRecord::Base.send :include, Notifiable
        ::ActiveRecord::Base.send :include, Authenticable
        ::ActiveRecord::Base.send :include, Searchable
        ::ActiveRecord::Base.send :include, HasPhone
        ::ActiveRecord::Base.send :include, HasLdapEntry
        ::ActiveRecord::Base.send :include, HasUserName
        ::ActiveSupport.on_load :action_view do
          DatePickerInput
          DateTimePickerInput
          CocoonInput
          ::ActionView::Base.send :include, TableHelpers
          ::ActionView::Base.send :include, MarkdownHelpers
          ::ActionView::Base.send :include, FlashHelpers
        end
        ::SimpleForm::FormBuilder.send :include, WrappedButton
      end
    end

  end
end

