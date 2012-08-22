module CornellAssembliesRails
  module ListifyMethods

    def listify(options={})
      options = { separator: ',', joiner: 'and' }.merge(options)

      case length
      when 0
        ""
      when 1
        first.to_s
      when 2
        join(" #{options[:joiner]} ")
      else
        self[0..(length-2)].join("#{options[:separator]} ") +
        "#{options[:separator]} #{options[:joiner]} #{last}"
      end
    end

  end
end

