
jQuery ->

  # The 'save' and the 'cancel' button are only to be shown in edit mode.
  # In order to receive the proper 'edit', 'save', 'cancel' events, they also have to be .editable.
  $( ".save_button,.cancel_button" ).addClass( "show_only_in_edit_mode editable" )

  # The 'edit' button is only to be shown when not in edit mode.
  $( ".edit_button" ).addClass( "do_not_show_in_edit_mode editable" )

  # The buttons trigger the correspondig events of the surrounding edit_mode_group.
  $( ".edit_button" ).click ( (e) ->
    $( this ).closest( ".edit_mode_group" ).trigger( "edit" )
    e.preventDefault()
  )
  $( ".save_button" ).click( (e) ->
    $( this ).closest( ".edit_mode_group" ).trigger( "save" )
    e.preventDefault()
  )
  $( ".cancel_button" ).click( (e) ->
    $( this ).closest( ".edit_mode_group" ).trigger( "cancel" )
    e.preventDefault()
  )

