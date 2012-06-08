module EditMode
  module EditModeHelpers
    
    # Returns a span tag which is only shown in edit mode.
    def show_only_in_edit_mode_span( &block )
      content_tag :span, :class => 'show_only_in_edit_mode' do
        yield 
      end
    end

    # Returns a span tag which is only shown when *not* in edit mode.
    def do_not_show_in_edit_mode_span( &block )
      content_tag :span, :class => 'do_not_show_in_edit_mode' do
        yield
      end
    end

  end
end
