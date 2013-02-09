class AutocompleteInput < SimpleForm::Inputs::StringInput
  def input_html_options
    super.merge( { data: { url: options[:url] } } )
  end

  def input_html_classes
    super.push "autocomplete"
  end
end

