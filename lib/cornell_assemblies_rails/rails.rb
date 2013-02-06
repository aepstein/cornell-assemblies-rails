module CornellAssembliesRails
  module Rails
    autoload :Authenticator, 'cornell_assemblies_rails/rails/authenticator'
    autoload :Breadcrumbs, 'cornell_assemblies_rails/rails/breadcrumbs'
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
    require 'cornell_assemblies_rails/rails/engine'
    require 'cornell_assemblies_rails/version'
  end
end

