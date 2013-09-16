# Configure Rails 3.1 to have assert_select_jquery() in tests
module CornellAssembliesRails
  module Rails

    class Engine < ::Rails::Engine
      config.autoload_paths << File.expand_path("../../../app/inputs", __FILE__)
      initializer "cornell_assemblies_rails.authenticator" do
        Date::DATE_FORMATS[:us_short] = '%m/%d/%Y'
        Time::DATE_FORMATS[:datetime_picker] = '%Y-%m-%d %I:%M %p'
        Time::DATE_FORMATS[:us_short] = '%m/%d/%Y %I:%M:%S %P'
        Time::DATE_FORMATS[:us_ordinal] = lambda { |time|
          time.strftime "%B #{ActiveSupport::Inflector.ordinalize time.day}, %Y %I:%M %P" }
        Time::DATE_FORMATS[:short_year] = "%d %b %Y %H:%M"
        Time::DATE_FORMATS[:us_time] = "%l:%M%P"
        ::ActionController::Base.send :include, Authenticator
        ::ActionController::Base.send :include, Breadcrumbs
        ::ActionController::Base.send :helper, DatetimePickerHelpers
        ::ActiveRecord::Base.send :include, Notifiable
        ::ActiveRecord::Base.send :include, Authenticable
        ::ActiveRecord::Base.send :include, Searchable
        ::ActiveRecord::Base.send :include, HasPhone
        ::ActiveRecord::Base.send :include, HasLdapEntry
        ::ActiveRecord::Base.send :include, HasUserName
        ::ActiveSupport.on_load :action_view do
          DatePickerInput
          DateTimePickerInput
          AutocompleteInput
          ::ActionView::Base.send :include, TableHelpers
          ::ActionView::Base.send :include, MarkdownHelpers
          ::ActionView::Base.send :include, FlashHelpers
          ::ActionView::Base.send :include, CocoonHelpers
          ::ActionView::Base.send :include, NestedErrorHelpers
        end
        ::SimpleForm::FormBuilder.send :include, DatetimePickerBuilderMethods
        ::SimpleForm::FormBuilder.send :include, WrappedButton
      end
    end

  end
end

