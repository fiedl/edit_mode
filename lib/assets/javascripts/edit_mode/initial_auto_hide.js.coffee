
jQuery ->

  # The tool buttons and the .show_only_in_edit_mode elements first are hidden via css (in case JavaScript does not work).
  # In order to use .hide() and .show() of jQuery, we need to restore the display css property
  # and hide the elements via jQuery.
  $( ".save_button,.cancel_button,.show_only_in_edit_mode" ).css( "display", "inline-block" ).hide()

