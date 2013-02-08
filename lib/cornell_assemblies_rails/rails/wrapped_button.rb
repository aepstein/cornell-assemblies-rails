module CornellAssembliesRails
  module Rails
    module WrappedButton
      def wrapped_button(*args, &block)
        template.content_tag :div, :class => "form-actions" do
          options = args.extract_options!
          loading = self.object.new_record? ? I18n.t('simple_form.creating') : I18n.t('simple_form.updating')
          options[:"data-loading-text"] = [loading, options[:"data-loading-text"]].compact
          options[:class] = ['btn-primary', options[:class]].compact
          label = options.delete :label
          args << options
          primary = if label
            args.unshift label
            args.unshift :button
            button(*args, &block)
          else
            submit(*args, &block)
          end
          if cancel = options.delete(:cancel)
            if cancel == "close-modal"
              primary + ' ' + I18n.t('simple_form.buttons.or') + ' ' +
                template.link_to(I18n.t('simple_form.buttons.cancel'), "#",
                                 { "data-dismiss" => "modal", "aria-hidden" => "true" })
            else
              primary + ' ' + I18n.t('simple_form.buttons.or') + ' ' +
                template.link_to(I18n.t('simple_form.buttons.cancel'), cancel)
            end
          else
            primary
          end
        end
      end
    end
  end
end

