class AutocompleteInput < SimpleForm::Inputs::StringInput
  def input_html_options
    data_options = { url: options.delete(:url) }
    data_options[:dynamic_term] = options.delete(:dynamic_term)
    data_options[:dynamic_id] = options.delete(:dynamic_id)
    super.merge( { data: data_options } )
  end

  def input_html_classes
    super.push "autocomplete"
  end
end

