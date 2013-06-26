
ready = ->

  # The <span class="edit_mode_group"></span> elements should be modal when in edit mode.
  # That means that everything else should be greyed out.
  # If the user clicks on the shaded (grey) area outside, the edit_mode_group is saved.

  $( ".edit_mode_group" ).bind( "edit", ->
    unless $( this ).hasClass( "edit-mode-modal" )
      modal_edit_mode_group = $( this )
      $( this ).addClass( "edit-mode-modal" )
      $( "body" ).append( "<div class='edit-mode-modal-bg'></div>" )
      $( "div.edit-mode-modal-bg" ).hide().fadeIn().click( ->
        modal_edit_mode_group.trigger( "save" )
      )
  )

  $( ".edit_mode_group" ).bind( "save cancel", ->
    if $( this ).hasClass( "edit-mode-modal" )
      unless $( this ).hasClass( "animating" )
        $( this ).addClass( "animating" )
        setTimeout( ->
          $( "div.edit-mode-modal-bg" ).fadeOut( ->
            $( this ).remove()
            $( ".edit-mode-modal" ).removeClass( "edit-mode-modal animating" )
          )
        , 300 )
  )

$(document).ready(ready)
$(document).on('page:load', ready)