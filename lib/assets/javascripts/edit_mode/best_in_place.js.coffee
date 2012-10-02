
jQuery ->
  $( ".best_in_place" ).best_in_place()
                       .addClass( "editable ")
                       .bind( "edit", (e) ->
                         $( this ).data( 'bestInPlaceEditor' ).activate()
                         $( this ).find( "*" ).unbind( 'blur' )
                                              .unbind( 'click' )
                                              .unbind( 'keyup' )
                                              .unbind( 'submit' )
                                              .bind( 'keyup', keyUpHandler )
                         e.stopPropagation()
                       )
                       .bind( "cancel", (e) ->
                         $( this ).data( 'bestInPlaceEditor' ).abort()
                         e.stopPropagation()
                       )
                       .bind( "save", (e) ->
                         $( this ).data( 'bestInPlaceEditor' ).update()
                         e.stopPropagation()
                       )

  keyUpHandler = (event) ->
    if event.keyCode == 27
      $( this ).closest( ".edit_mode_group" ).trigger( "cancel" )
    if event.keyCode == 13
      unless $( event.target ).is( "textarea" )
        $( this ).closest( ".edit_mode_group" ).trigger( "save" )

