module CornellAssembliesRails
  module Rails
    module DatetimepickerInputMethods
      def input_calendar_button
        calendar_icon = template.content_tag(:i, nil, {  class: "icon-calendar",
          data: { :"time-icon" => "icon-time", :"date-icon" => "icon-calendar"} })
        template.content_tag(:span, calendar_icon, { class: "add-on" })
      end
      def input_now_button
        now_icon = template.content_tag(:i, nil, { class: "icon-check" })
        template.content_tag(:a, now_icon+"now", { class: "btn btn-now",
          data: { behaviour: "now-button"} })
      end
    end
  end
end
