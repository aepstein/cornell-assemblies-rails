module CornellAssembliesRails
  module Rails
    require 'cornell-assemblies-rails/rails/engine'
    require 'cornell-assemblies-rails/version'
  end
end

::ActiveSupport.on_load(:action_controller) do
  include Authenticator
end

