# EditMode

Toggle an edit mode on a normal show view. Think of it as a grouped in-place editing. 
This also toggles [best_in_place](https://github.com/bernat/best_in_place) fields.

The edit mode is activated by pressing an 'edit' button on a show view. This shows additional editing tools \
and switches on the best_in_place form fields. When editing is finished, use 'save' or 'cancel' buttons to quit the edit mode and ret\
urn to a normal show view. Several editing groups per page are supported. Thus, you can have several 'boxes' to edit on a page.

## Installation

THIS IS NOT READY, YET.

Add this line to your application's Gemfile:

    gem 'edit_mode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edit_mode

TODO: Include css and js.

## Usage

* Basic view
* edit_mode_group
* tool buttons
* show_only_in_edit_mode, do_not_show_in_edit_mode
* best_in_place
* editable: edit, save, cancel

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

