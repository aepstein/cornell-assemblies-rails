class DatePickerInput < SimpleForm::Inputs::StringInput
  include CornellAssembliesRails::Rails::DatetimepickerInputMethods
  def input
    # TODO now button behavior
    date_input = @builder.text_field(attribute_name, input_html_options)
    template.content_tag(:div, date_input + input_calendar_button,
      data: { behavior: "date-picker" }, class: "input-append date")
  end
  
  def input_html_options
    value = object.send(attribute_name)
    super.merge( { value: object.send(attribute_name).
      try( :to_formatted_s, :db ) } )
  end
end

