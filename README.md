# EditMode  [![Build Status](https://secure.travis-ci.org/fiedl/edit_mode.png?branch=master)](http://travis-ci.org/fiedl/edit_mode)

<img src="https://github.com/fiedl/edit_mode/raw/master/test_app/app/assets/images/screenshot.png" height="300" align="right" vspace="20" hspace="20" />

*edit_mode* is a *ruby on rails gem* that allows you to toggle an edit mode on a normal show view. 
Think of it as a grouped in-place editing. 
This also toggles [best_in_place](https://github.com/bernat/best_in_place) fields.

The edit mode is activated by pressing an 'edit' button on a show view. This shows additional editing tools 
and switches on the best_in_place form fields. When editing is finished, use 'save' or 'cancel' buttons to 
quit the edit mode and return to a normal show view. 
Several editing groups per page are supported. Thus, you can have several 'boxes' to edit on a page.

## Demo

You might want to have a look at [this demo app at heroku](http://edit-mode-test-app.herokuapp.com/).

The [code of this demo app can be found here](https://github.com/fiedl/edit_mode/tree/master/test_app).

## Installation

Add this line to your application's Gemfile:

    gem 'edit_mode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install edit_mode

### Include Assets

In `app/assets/javascripts/application.js`, add:

```javascript
//= require edit_mode
```
	
In `app/assets/stylesheets/application.css`, add:

```css
/*
 *...
 *= require edit_mode
 */
```

## Usage

### Basic View

For a basic example, see: https://github.com/fiedl/edit_mode/blob/master/test_app/app/views/users/show.html.erb

### edit_mode_group

The edit mode is toggled within a `<span class="edit_mode_group"></span>`. The buttons to 'edit', 'save' and 'cancel' should also be placed inside this span.

You can also have several edit_mode_group spans on a page, as shown in the demo app.

### Tool Buttons

To enter and exit the edit mode, use buttons 'edit', 'save' and 'cancel'. These can be anchors, images, et cetera. They only have to have the correct css classes: 

```html
<span class="edit_mode_group">
  <a class="edit_button" href="#">edit</a>
  <a class="save_button" href="#">save</a>
  <a class="cancel_button" href="#">cancel</a>
  ...
</span>
```

### show_only_in_edit_mode

Within the edit_mode_group span, you may place certain elements that should only be shown when in edit mode. You can use this for 'add' buttons or 'destroy' buttons.

```html
<span class="edit_mode_group">
  ...
  <span class="show_only_in_edit_mode">
    <a href="#">add</a>
  </span>
</span>
```

The same, the other way round:

```html
<span class="edit_mode_group">
  ...
  <span class="do_not_show_in_edit_mode">
    <img src="..." alt="This picture is not shown in edit mode." />
  </span>
</span>
```

### best_in_place

In the edit_mode_group span, all [best_in_place](https://github.com/bernat/best_in_place) elements are toggled as well.

### '.editable' Triggers

If you need custom behaviour inside the edit_mode_group span, you can use these triggers: For all elements of the class `.editable`, the events `edit`, `save` and `cancel` are triggered, when entering or exiting edit mode.

```html
<span class="edit_mode_group">
  ...
  <span class="editable custom_element">Test</span>
</span>
```

Bind the event via JavaScript, e.g. with jQuery:

```coffee
jQuery ->
  $( ".custom_element" ).bind( "edit", ->
    alert( "This element has just entered edit mode." )
  )
```

### Adding .editable Elements Using Ajax

If you would like to add .editable elements (e.g. `.best_in_place` elements or `.show_only_in_edit_mode` elements) using
ajax, you have to call `apply_edit_mode()` on the newly added elements in order to have them provide the proper methods
and triggers.

For example, if you have added a `<span id="my_new_edit_mode_span">...</span>` containing
the edit_mode elements using ajax, just call via javascript (jQuery):
    
```javascript
$( "#my_new_edit_mode_span" ).apply_edit_mode()
```    

And if you want to enter edit_mode for this span, call instead:
    
```javascript
$( "#my_new_edit_mode_span" ).apply_edit_mode().trigger( "edit" )
```

## Documentation

http://rubydoc.info/github/fiedl/edit_mode/frames

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request



