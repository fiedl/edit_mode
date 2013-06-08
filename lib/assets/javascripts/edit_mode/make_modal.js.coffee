
ready = ->

  # The <span class="edit_mode_group"></span> elements should be modal when in edit mode.
  # That means that everything else should be greyed out.
  # If the user clicks on the shaded (grey) area outside, the edit_mode_group is saved.

  $( ".edit_mode_group" ).bind( "edit", ->
    unless $( this ).hasClass( "modal" )
      modal_edit_mode_group = $( this )
      $( this ).addClass( "modal" )
      $( "body" ).append( "<div class='modal_bg'></div>" )
      $( "div.modal_bg" ).hide().fadeIn().click( ->
        modal_edit_mode_group.trigger( "save" )
      )
  )

  $( ".edit_mode_group" ).bind( "save cancel", ->
    if $( this ).hasClass( "modal" )
      unless $( this ).hasClass( "animating" )
        $( this ).addClass( "animating" )
        setTimeout( ->
          $( "div.modal_bg" ).fadeOut( ->
            $( this ).remove()
            $( ".modal" ).removeClass( "modal animating" )
          )
        , 300 )
  )

$(document).ready(ready)
$(document).on('page:load', ready)