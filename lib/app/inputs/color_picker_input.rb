class DateTimePickerInput < SimpleForm::Inputs::String
  def input_html_classes
    super.push "colorpicker"
  end
end

