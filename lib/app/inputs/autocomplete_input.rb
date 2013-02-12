class AutocompleteInput < SimpleForm::Inputs::StringInput
  def input_html_options
    data_options = { url: options[:url] }
    if options[:dynamic_term] && options[:dynamic_id]
      data_options[:dynamic_term] = options[:dynamic_term]
      data_options[:dynamic_id] = options[:dynamic_id]
    end
    super.merge( data: data_options )
  end

  def input_html_classes
    super.push "autocomplete"
  end
end

