class DatePickerInput < Formtastic::Inputs::StringInput
  if defined?(ActiveSupport::CoreExtensions)
  	DATE_FORMATS = ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS
  else
    DATE_FORMATS = Date::DATE_FORMATS
  end

  def input_html_options
    super.merge( :class => [super[:class], "ui-date-picker"].compact.join(" "),
      :value => object.send(method).try( :strftime, (DATE_FORMATS[:default] || '%Y-%m-%d') ) )
  end
end

