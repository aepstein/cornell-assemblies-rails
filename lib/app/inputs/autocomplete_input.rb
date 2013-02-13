class AutocompleteInput < SimpleForm::Inputs::StringInput
  def input
    super + if options[:label_method] != options[:value_method]
      @builder.hidden_field(attribute_name, {  class: ( "autocomplete-target" ),
        value: object.send(attribute_name).try( options[:value_method] ) } )
    else
      ""
    end
  end

  def input_html_options
    data_options = { url: options[:url] }
    options[:label_method] ||= :to_s
    options[:value_method] ||= :id
    if options[:dynamic_term] && options[:dynamic_id]
      data_options[:dynamic_term] = options[:dynamic_term]
      data_options[:dynamic_id] = options[:dynamic_id]
    end
    super.merge( data: data_options, value: object.send(attribute_name).try( options[:label_method] ) )
  end

  def input_html_classes
    super.push "autocomplete"
  end
end

