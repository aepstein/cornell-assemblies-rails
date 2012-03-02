module CornellAssembliesRails
  module Rails
    autoload :Authenticator, 'cornell-assemblies-rails/rails/authenticator'
    autoload :Breadcrumbs, 'cornell-assemblies-rails/rails/breadcrumbs'
    autoload :Notifiable, 'cornell-assemblies-rails/rails/notifiable'
    autoload :Authenticable, 'cornell-assemblies-rails/rails/authenticable'
    autoload :Searchable, 'cornell-assemblies-rails/rails/searchable'
    autoload :DatePickerInput, 'app/inputs/date_picker_input'
    autoload :DateTimePickerInput, 'app/inputs/date_time_picker_input'
    require 'cornell-assemblies-rails/rails/engine'
    require 'cornell-assemblies-rails/version'
  end
end

