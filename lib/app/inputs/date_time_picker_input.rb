class DateTimePickerInput < SimpleForm::Inputs::String
  def input
    super +
    @builder.hidden_field(attribute_name, { class: attribute_name.to_s + "-alt"})
  end

  def input_html_classes
    super.push "ui-datetime-picker"
  end
end

