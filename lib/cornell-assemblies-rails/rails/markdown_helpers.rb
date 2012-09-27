module CornellAssembliesRails
  module Rails
    module MarkdownHelpers

      def markdown( content )
        sanitize Markdown.new(content, tables: true).to_html
      end

    end
  end
end

