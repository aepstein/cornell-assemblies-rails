class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    @builder.datetime_picker_field(attribute_name,
      merge_wrapper_options(input_html_options, wrapper_options))
  end
  
  def input_html_options
    value = object.send(attribute_name)
    super.merge( { value: object.send(attribute_name).
      try( :to_formatted_s, :datetime_picker ) } )
  end
end

