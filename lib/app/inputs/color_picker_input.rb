class ColorPickerInput < SimpleForm::Inputs::StringInput
  def input_html_classes
    super.push "colorpicker"
  end
end

