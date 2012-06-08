
jQuery ->
  $( ".best_in_place" ).best_in_place()
                       .addClass( "editable ")
                       .bind( "edit", ->
                         $( this ).data( 'bestInPlaceEditor' ).activate()
                         $( this ).find( "*" ).unbind( 'blur' )
                                              .unbind( 'click' )
                                              .unbind( 'keyup' )
                                              .unbind( 'submit' )
                                              .bind( 'keyup', keyUpHandler )
                       )
                       .bind( "cancel", ->
                         $( this ).data( 'bestInPlaceEditor' ).abort()
                       )
                       .bind( "save", ->
                         $( this ).data( 'bestInPlaceEditor' ).update()
                       )

  keyUpHandler = (event) ->
    if event.keyCode == 27
      $( this ).closest( ".edit_mode_group" ).trigger( "cancel" )
    if event.keyCode == 13
      unless $( event.target ).is( "textarea" )
        $( this ).closest( ".edit_mode_group" ).trigger( "save" )