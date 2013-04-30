module CornellAssembliesRails
  module Rails
    module MarkdownHelpers

      def markdown( content )
        out = Markdown.new(content, tables: true).to_html
        { '\+' => 'ins', '\-' => 'del' }.each do |mark, tag|
          out.gsub! /\[#{mark}(.+)#{mark}\]/, "<#{tag}>$1</#{tag}>"
        end
        sanitize out
      end

    end
  end
end

