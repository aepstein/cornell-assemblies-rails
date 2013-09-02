module CornellAssembliesRails
  module Rails
    autoload :Authenticator, 'cornell_assemblies_rails/rails/authenticator'
    autoload :Breadcrumbs, 'cornell_assemblies_rails/rails/breadcrumbs'
    autoload :CocoonHelpers, 'cornell_assemblies_rails/rails/cocoon_helpers'
    autoload :Notifiable, 'cornell_assemblies_rails/rails/notifiable'
    autoload :FlashHelpers, 'cornell_assemblies_rails/rails/flash_helpers'
    autoload :Authenticable, 'cornell_assemblies_rails/rails/authenticable'
    autoload :Searchable, 'cornell_assemblies_rails/rails/searchable'
    autoload :HasPhone, 'cornell_assemblies_rails/rails/has_phone'
    autoload :HasLdapEntry, 'cornell_assemblies_rails/rails/has_ldap_entry'
    autoload :TableHelpers, 'cornell_assemblies_rails/rails/table_helpers'
    autoload :MarkdownHelpers, 'cornell_assemblies_rails/rails/markdown_helpers'
    autoload :WrappedButton, 'cornell_assemblies_rails/rails/wrapped_button'
    autoload :HasUserName, 'cornell_assemblies_rails/rails/has_user_name'
    autoload :NestedErrorHelpers, 'cornell_assemblies_rails/rails/nested_error_helpers'
    autoload :Notice, 'cornell_assemblies_rails/rails/notice'
    autoload :DatetimepickerInputMethods, 'cornell_assemblies_rails/rails/datetimepicker_input_methods'
    require 'squeel'
    require 'cornell_assemblies_rails/rails/engine'
    require 'cornell_assemblies_rails/version'
  end
end

