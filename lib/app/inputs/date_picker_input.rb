class DatePickerInput < Formtastic::Inputs::StringInput
  if defined?(ActiveSupport::CoreExtensions)
  	DATE_FORMATS = ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
  else
    DATE_FORMATS = Date::DATE_FORMATS
  end

  DEFAULT_FORMAT = '%Y-%m-%d'

  def input_html_options
    new_class = [super[:class], "ui-date-picker"].compact.join(" ")
    super.merge( class: new_class, value: object.send(method).
      try( :strftime, (DATE_FORMATS[:default] || DatePickerInput::DEFAULT_FORMAT) ) )
  end
end

