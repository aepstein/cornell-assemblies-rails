module CornellAssembliesRails
  module Rails
    autoload :Authenticator, 'cornell-assemblies-rails/rails/authenticator'
    autoload :Breadcrumbs, 'cornell-assemblies-rails/rails/breadcrumbs'
    autoload :Notifiable, 'cornell-assemblies-rails/rails/notifiable'
    autoload :Authenticable, 'cornell-assemblies-rails/rails/authenticable'
    require 'cornell-assemblies-rails/rails/engine'
    require 'cornell-assemblies-rails/version'
  end
end

