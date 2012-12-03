class DateTimePickerInput < Formtastic::Inputs::StringInput
  DEFAULT_FORMAT = '%Y-%m-%d %I:%M %P'

  def input_html_options
    new_class = [super[:class], "ui-datetime-picker"].compact.join(" ")
    super.merge( class: new_class, value: object.send(method).
      try( :strftime, DateTimePickerInput::DEFAULT_FORMAT ) )
  end
end

