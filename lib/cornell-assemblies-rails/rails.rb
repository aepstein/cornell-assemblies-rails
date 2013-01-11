module CornellAssembliesRails
  module Rails
    autoload :Authenticator, 'cornell-assemblies-rails/rails/authenticator'
    autoload :Breadcrumbs, 'cornell-assemblies-rails/rails/breadcrumbs'
    autoload :Notifiable, 'cornell-assemblies-rails/rails/notifiable'
    autoload :Authenticable, 'cornell-assemblies-rails/rails/authenticable'
    autoload :Searchable, 'cornell-assemblies-rails/rails/searchable'
    autoload :HasPhone, 'cornell-assemblies-rails/rails/has_phone'
    autoload :HasLdapEntry, 'cornell-assemblies-rails/rails/has_ldap_entry'
    autoload :TableHelpers, 'cornell-assemblies-rails/rails/table_helpers'
    autoload :MarkdownHelpers, 'cornell-assemblies-rails/rails/markdown_helpers'
    autoload :WrappedButton, 'cornell-assemblies-rails/rails/wrapped_button'
    require 'cornell-assemblies-rails/rails/engine'
    require 'cornell-assemblies-rails/version'
  end
end

