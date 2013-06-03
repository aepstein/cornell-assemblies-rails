require 'cornell_assemblies_rails/currency_methods'
require 'cornell_assemblies_rails/roman/integer_methods'

class Integer
  include CornellAssembliesRails::CurrencyMethods
  include CornellAssembliesRails::Roman::IntegerMethods
end

