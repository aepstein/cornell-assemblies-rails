module CornellAssembliesRails
  module Rails
    module MarkdownHelpers

      def markdown( content )
        sanitize Markdown.new(content, tables: true),
          tags: %w( table thead tbody th tr td )
      end

    end
  end
end

