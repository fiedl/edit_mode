ready = ->
  jQuery.fn.apply_edit_mode = ->
    this.apply_initial_auto_hide()
    this.apply_show_only_in_edit_mode()
    this.find( ".best_in_place" ).apply_best_in_place()
    return this

$(document).ready(ready)
$(document).on('page:load', ready)
