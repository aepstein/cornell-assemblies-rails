class DatePickerInput < SimpleForm::Inputs::StringInput
  def input
    super +
    @builder.hidden_field(attribute_name, { class: attribute_name.to_s + "-alt"})
  end

  def input_html_classes
    super.push "ui-date-picker"
  end
end

