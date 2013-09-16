module CornellAssembliesRails
  module Rails
    module DatetimePickerBuilderMethods
      def date_picker_field(method, options={})
        @template.send :date_picker_field, @object_name, method, options
      end
      def datetime_picker_field(method, options={})
        @template.send :datetime_picker_field, @object_name, method, options
      end
    end
  end
end
