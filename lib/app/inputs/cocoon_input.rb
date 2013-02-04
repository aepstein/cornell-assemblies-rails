# Makes cocoons easier to implement [adapted from original for formtastic]
# (see https://github.com/nathanvda/cocoon/pull/104)
class CocoonInput < SimpleForm::Inputs::Base

  def input
    output = wrapped_simple_fields << links

    template.content_tag(:div, output.html_safe, wrapper_html_options)
  end

  def wrapper_html_options
    data = super.merge( class: 'input cocoon' )
    if options[:ordered_by]
      data['data-ordered_by'] = options[:ordered_by]
    end
    data
  end

  def simple_fields_for
    @builder.simple_fields_for(method) do |fields|
      if fields.object
        template.render partial: "#{singular_method}_fields", locals: { f: fields }
      end
    end
  end

  def wrapped_simple_fields
    template.content_tag(:div, simple_fields_for, class: 'forms')
  end

  def links
    template.content_tag(:div, class: 'links') do
      template.link_to_add_association template.t(".add_#{singular_method}"), builder, method, input_html_options
    end
  end

  def input_html_options
    super.merge(
      'data-association-insertion-node' => '.forms',
      'data-association-insertion-traversal' => 'parentSiblings',
      'data-association-insertion-method' => 'append'
    )
  end

  private

  def singular_method
    @singular_method ||= method.to_s.singularize
  end
end

