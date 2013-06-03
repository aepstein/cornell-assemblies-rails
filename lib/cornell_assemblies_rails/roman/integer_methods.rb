require 'cornell_assemblies_rails/roman'

module CornellAssembliesRails
  module Roman
    module IntegerMethods
      # takes a number and options hash and outputs a string in any currency format
      def to_roman
        value = self
        ROMAN_DIGITS.keys.reverse.inject('') do |result, decimal|
          while value >= decimal
            value -= decimal
            result += ROMAN_DIGITS[decimal]
          end
          result
        end
      end
    end
  end
end

