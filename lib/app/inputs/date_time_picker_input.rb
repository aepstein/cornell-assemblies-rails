class DateTimePickerInput < SimpleForm::Inputs::StringInput
  DEFAULT_FORMAT = '%Y-%m-%d %I:%M %P'

  def input_html_options
    super.merge( value: object.send(method).
      try( :strftime, DateTimePickerInput::DEFAULT_FORMAT ) )
  end

  def input_html_classes
    super.push "ui-datetime-picker"
  end
end

