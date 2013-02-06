class DateTimePickerInput < SimpleForm::Inputs::StringInput
  def input
    super +
    @builder.hidden_field(attribute_name, {  class: ( attribute_name.to_s + "-alt" ),
      value: object.send(attribute_name).try( :to_formatted_s, :rfc822 ) } )
  end

  def input_html_options
    value = object.send(attribute_name)
    super.merge( { value: object.send(attribute_name).try( :to_formatted_s, :us_short ) } )
  end

  def input_html_classes
    super.push "ui-datetime-picker"
  end
end

