class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input
    @builder.datetime_picker_field(attribute_name, input_html_options)
  end
  
  def input_html_options
    value = object.send(attribute_name)
    super.merge( { value: object.send(attribute_name).
      try( :to_formatted_s, :datetime_picker ) } )
  end
end

