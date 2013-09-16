module CornellAssembliesRails
  module Rails
    module DatetimePickerHelpers
      def date_picker_field_tag(name, value, options={})
        content_tag( :div, text_field_tag( name, value, options ) +
          input_calendar_button, data: { behavior: "date-picker" },
        class: "input-append date" )
      end
      def datetime_picker_field_tag(name, value, options={})
        content_tag( :div, text_field_tag( name, value, options ) +
          input_calendar_button, data: { behavior: "datetime-picker" },
        class: "input-append datetime" )
      end
      def date_picker_field(object_name, method, options={})
        content_tag( :div, text_field( object_name, method, options ) +
          input_calendar_button,
          data: { behavior: "date-picker" },
          class: "input-append date" )
      end
      def datetime_picker_field(object_name, method, options={})
        content_tag( :div, text_field( object_name, method, options ) +
          input_calendar_button,
          data: { behavior: "datetime-picker" },
          class: "input-append datetime" )
      end
      def input_calendar_button
        calendar_icon = content_tag(:i, nil, {  class: "icon-calendar",
          data: { :"time-icon" => "icon-time", :"date-icon" => "icon-calendar"} })
        content_tag(:span, calendar_icon, { class: "add-on" })
      end
      def input_now_button
        now_icon = content_tag(:i, nil, { class: "icon-check" })
        content_tag(:a, now_icon+"now", { class: "btn btn-now",
          data: { behavior: "now-button"} })
      end
    end
  end
end
