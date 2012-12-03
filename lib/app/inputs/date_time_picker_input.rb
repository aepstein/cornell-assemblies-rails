class DateTimePickerInput < Formtastic::Inputs::StringInput
  def input_html_options
    new_class = [super[:class], "ui-datetime-picker"].compact.join(" ")
    super.merge( class: new_class, value: object.send(method).
      try( :strftime, '%Y-%m-%d %I:%M %P' ) )
  end
end

