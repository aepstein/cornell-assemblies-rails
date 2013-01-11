class DatePickerInput < SimpleForm::Inputs::StringInput
  if defined?(ActiveSupport::CoreExtensions)
  	DATE_FORMATS = ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
  else
    DATE_FORMATS = Date::DATE_FORMATS
  end

  DEFAULT_FORMAT = '%Y-%m-%d'

  def input_html_options
    super.merge( value: object.send(method).
      try( :strftime, (DATE_FORMATS[:default] || DatePickerInput::DEFAULT_FORMAT) ) )
  end

  def input_html_classes
    super.push "ui-date-picker"
  end
end

