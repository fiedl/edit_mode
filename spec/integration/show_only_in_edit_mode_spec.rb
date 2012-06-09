require 'spec_helper'

describe "show only in edit mode span tags", js: true do

  before do
    @user = User.new( first_name: "John", last_name: "Doe", date_of_birth: "1995-12-21" )
    @user.save
    visit user_path( @user )
  end

  it "should not be visible when not in edit mode" do
    page.should_not have_selector( ".show_only_in_edit_mode", visible: true )
  end

  it "should be visible in edit mode" do
    click_on 'edit'
    page.should have_selector( ".show_only_in_edit_mode", visible: true )
  end

  it "should be invisible after exiting the edit mode" do
    click_on 'edit'
    click_on 'cancel'
    page.should_not have_selector( ".show_only_in_edit_mode", visible: true )
  end

end
