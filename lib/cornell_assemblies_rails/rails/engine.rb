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
        ::SimpleForm.setup do |sf_config|
          sf_config.error_notification_class = 'alert alert-danger'
          sf_config.button_class = 'btn btn-default'
          sf_config.boolean_label_class = nil

          sf_config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :pattern
            b.optional :min_max
            b.optional :readonly
            b.use :label, class: 'control-label'

            b.use :input, class: 'form-control'
            b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end

          sf_config.wrappers :vertical_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :readonly
            b.use :label, class: 'control-label'

            b.use :input
            b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end

          sf_config.wrappers :vertical_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.optional :readonly

            b.wrapper tag: 'div', class: 'checkbox' do |ba|
              ba.use :label_input
            end

            b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end

          sf_config.wrappers :vertical_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.optional :readonly
            b.use :label, class: 'control-label'
            b.use :input
            b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end

          sf_config.wrappers :horizontal_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :pattern
            b.optional :min_max
            b.optional :readonly
            b.use :label, class: 'col-sm-3 control-label'

            b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
              ba.use :input, class: 'form-control'
              ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
              ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
            end
          end

          sf_config.wrappers :horizontal_file_input, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :readonly
            b.use :label, class: 'col-sm-3 control-label'

            b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
              ba.use :input
              ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
              ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
            end
          end

          sf_config.wrappers :horizontal_boolean, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.optional :readonly

            b.wrapper tag: 'div', class: 'col-sm-offset-3 col-sm-9' do |wr|
              wr.wrapper tag: 'div', class: 'checkbox' do |ba|
                ba.use :label_input, class: 'col-sm-9'
              end

              wr.use :error, wrap_with: { tag: 'span', class: 'help-block' }
              wr.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
            end
          end

          sf_config.wrappers :horizontal_radio_and_checkboxes, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.optional :readonly

            b.use :label, class: 'col-sm-3 control-label'

            b.wrapper tag: 'div', class: 'col-sm-9' do |ba|
              ba.use :input
              ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
              ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
            end
          end

          sf_config.wrappers :inline_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :pattern
            b.optional :min_max
            b.optional :readonly
            b.use :label, class: 'sr-only'

            b.use :input, class: 'form-control'
            b.use :error, wrap_with: { tag: 'span', class: 'help-block' }
            b.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
          end
          sf_config.default_wrapper = :horizontal_form
          sf_config.wrappers :default, class: :input,
            hint_class: :field_with_hint, error_class: :field_with_errors do |b|
            b.use :html5
            b.use :placeholder
            b.optional :maxlength
            b.optional :pattern
            b.optional :min_max
            b.optional :readonly
            b.use :label_input
            b.use :hint,  wrap_with: { tag: :span, class: :hint }
            b.use :error, wrap_with: { tag: :span, class: :error }
          end
          sf_config.default_wrapper = :default
          sf_config.boolean_style = :nested
          sf_config.button_class = 'btn'
          sf_config.error_notification_tag = :div
          sf_config.error_notification_class = 'error_notification'
          sf_config.form_class = "simple_form form-horizontal"
          sf_config.browser_validations = false
          sf_config.boolean_label_class = 'checkbox'
        end
      end
    end

  end
end

