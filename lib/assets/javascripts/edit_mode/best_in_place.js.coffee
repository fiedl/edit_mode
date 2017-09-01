$(document).ready ->

  jQuery.fn.apply_best_in_place = ->
    this.best_in_place()
        .addClass( "editable ")
        .unbind("edit")
        .bind( "edit", (e) ->
          $( this ).data( 'bestInPlaceEditor' ).activate()
          $( this ).find( "*" ).unbind( 'blur' )
                               .unbind( 'click' )
                               .unbind( 'keyup' )
                               .unbind( 'submit' )
                               .bind( 'keyup', keyUpHandler )
          e.stopPropagation()
        )
        .unbind("cancel")
        .bind( "cancel", (e) ->
          $( this ).data( 'bestInPlaceEditor' ).abort()
          e.stopPropagation()
        )
        .unbind("save")
        .bind( "save", (e) ->
          if String(old_value($(this))) != String(new_value($(this)))
            $(this).data('bestInPlaceEditor').update()
          else
            $(this).data('bestInPlaceEditor').abort()
          e.stopPropagation()
        )
    return this

  $( ".best_in_place" ).apply_best_in_place()

  old_value = (best_in_place)->
    if best_in_place.data('bip-original-content')?
      best_in_place.data('bip-original-content')
    else
      null

  new_value = (best_in_place)->
    v = best_in_place.find('input').val() if best_in_place.find('input').length > 0
    v = best_in_place.find('textarea').val() if best_in_place.find('textarea').length > 0
    v = best_in_place.find('select').find(":selected").text() if best_in_place.find('select').length > 0
    v = null if v == ""
    return v

  keyUpHandler = (event) ->
    if event.keyCode == 27
      $( this ).closest( ".edit_mode_group" ).trigger( "cancel" )
    if event.keyCode == 13
      unless $( event.target ).is( "textarea" )
        $( this ).closest( ".edit_mode_group" ).trigger( "save" )
