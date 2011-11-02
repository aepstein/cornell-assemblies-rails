class DateTimePickerInput < Formtastic::Inputs::StringInput
  def wrapper_html_options
    super.merge( :class => 'datetime' )
  end

  def input_html_options
    super.merge( :class => [super[:class], "ui-datetime-picker"].compact.join(" "),
      :value => object.send(method).try( :strftime, '%Y-%m-%d %I:%M %P' ) )
  end
end

