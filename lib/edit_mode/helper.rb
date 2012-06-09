module EditMode
  module EditModeHelpers
    
    # Returns a span tag which is only shown in edit mode.
    # 
    #   show_only_in_edit_mode_span do
    #     content_tag :p do
    #       "This text is shown only in edit mode."
    #     end
    #   end
    # 
    # will basically return
    # 
    #   <span class="show_only_in_edit_mode">
    #     <p>
    #       This text is shown only in edit mode.
    #     </p>
    #   </span>
    # 
    # The rest is done via javascript.
    def show_only_in_edit_mode_span( &block )
      content_tag :span, :class => 'show_only_in_edit_mode' do
        yield 
      end
    end

    # Returns a span tag which is only shown when *not* in edit mode.
    # 
    #   do_not_show_in_edit_mode_span do
    #     content_tag :p do
    #       "This text is not shown in edit mode."
    #     end
    #   end
    # 
    # will basically return
    # 
    #   <span class="do_not_show_in_edit_mode">
    #     <p>
    #       This text is not shown in edit mode.
    #     </p>
    #   </span>
    # 
    # The rest is done via javascript.
    def do_not_show_in_edit_mode_span( &block )
      content_tag :span, :class => 'do_not_show_in_edit_mode' do
        yield
      end
    end

  end
end
