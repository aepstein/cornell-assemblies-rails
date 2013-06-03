module CornellAssembliesRails
  module Rails
    module TableHelpers

      def table_row_tag(increment=true, preorder=false, options={}, &block)
        content_tag 'tr', capture(&block), options.merge( { class: table_row_class(increment,preorder) } )
      end

      def table_row_class(increment=true,preorder=false)
        @table_row_class ||= 'row1'
        out = @table_row_class
        @table_row_class = ( @table_row_class == 'row1' ? 'row2' : 'row1' ) if increment
        @table_row_class = 'row1' if increment == :reset
        preorder ? @table_row_class : out
      end

    end
  end
end

