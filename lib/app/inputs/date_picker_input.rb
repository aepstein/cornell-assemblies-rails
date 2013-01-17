class DatePickerInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(attribute_name, input_html_options) +
    @builder.hidden_field(attribute_name, { class: attribute_name.to_s + "-alt"})
  end

  def input_html_classes
    super.push "ui-date-picker"
  end
end

