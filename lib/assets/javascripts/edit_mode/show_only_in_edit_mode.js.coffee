
jQuery ->

  # When edit mode is entered, on all included '.editable' elements the 'edit' event is triggered.
  # When edit mode is left, the events 'save' or 'cancel' are triggered.
  # For <span class="show_only_in_edit_mode"></span> tags, these events are rather simple:
  # Just show or hide these spans!
  $( ".show_only_in_edit_mode" ).live( "edit", ->
    $( this ).show()
  ).live( "save cancel", ->
    $( this ).hide()
  )

  # And just the opposite for <span class="do_not_show_in_edit_mode"></span>.
  $( ".do_not_show_in_edit_mode" ).live( "edit", ->
    $( this ).hide()
  ).live( "save cancel", ->
    $( this ).show()
  )

  # In order to receive these events, the .show_only_in_edit_mode elements have to be .editable as well.
  $( ".show_only_in_edit_mode,.do_not_show_in_edit_mode" ).addClass( "editable" )