require 'spec_helper'

describe "button behaviour", js: true do

  before do
    @user = User.new( first_name: "John", last_name: "Doe", date_of_birth: "1995-12-21" )
    @user.save
    visit user_path( @user )
  end

  describe "javascript requirements: " do
    describe "edit event" do
      describe "on a best_in_place element" do
        it "should show the input field for editing" do
          page.should_not have_selector "input"
          page.execute_script( " $('.best_in_place.editable:first').trigger('edit') " )
          page.should have_selector( "input", count: 1 )
        end
      end
      describe "on an edit_mode_group" do
        it "should show the input fields for all contained best_in_place fields" do
          page.should_not have_selector "input"
          page.execute_script( " $('.edit_mode_group:first').trigger('edit') " )
          page.should have_selector( "input", count: 2 )
        end
      end
    end
  end

  describe "edit button" do

    it "should be visible outside and invisible in edit mode" do
      page.should have_selector( ".edit_button", visible: true, count: 2 )
      click_on 'edit'
      page.should have_selector( ".edit_button", visible: true, count: 1 )
      page.should_not have_selector( ".edit_button", visible: true, count: 2 )
      click_on 'cancel'
      page.should have_selector( ".edit_button", visible: true, count: 2 )
    end

    it "should activate the edit mode" do
      page.should_not have_selector( ".edit_mode_group.currently_in_edit_mode" )
      click_on 'edit'
      page.should have_selector( ".edit_mode_group.currently_in_edit_mode" )
    end

    it "should activate the edit mode only for the own edit_mode_group" do
      click_on 'edit'
      page.should have_field( 'first_name' )
      page.should_not have_field( 'date_of_birth' )
    end

  end

  describe "save button" do
    it "should be visible only in edit mode" do
      page.should_not have_selector( ".save_button", visible: true )
      click_on 'edit'
      page.should have_selector( ".save_button", visible: true )
    end

    it "should save the best_in_place fields" do
      click_on 'edit'
      fill_in 'first_name', with: 'Jane'
      click_on 'save'
      page.should_not have_content( "First Name: John" )
      page.should have_content( "First Name: Jane" )
    end
  end

  describe "cancel button" do
    it "should be visible only in edit mode" do
      page.should_not have_selector( ".cancel_button", visible: true )
      click_on 'edit'
      page.should have_selector( ".cancel_button", visible: true )
    end

    it "should *not* save the best_in_place fields" do
      click_on 'edit'
      fill_in 'first_name', with: 'Jane'
      click_on 'cancel'
      page.should have_content( "First Name: John" )
      page.should_not have_content( "First Name: Jane" )
    end
  end
 

end
