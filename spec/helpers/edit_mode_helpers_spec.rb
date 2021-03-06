require "spec_helper"

describe EditMode::EditModeHelpers do
  
  describe "#edit_mode_group_span" do
   
    it "should generate the corresponding span" do
      nokogiri = Nokogiri::HTML.parse( edit_mode_group_span { "<p>This text is inside an edit_mode_group.</p>" } )
      span = nokogiri.css( "span" )
      span.text.should == "<p>This text is inside an edit_mode_group.</p>"
    end

  end

  describe "#show_only_in_edit_mode_span" do
   
    it "should generate the corresponding span" do
      nokogiri = Nokogiri::HTML.parse( show_only_in_edit_mode_span { "<p>This text is shown only in edit mode.</p>" } )
      span = nokogiri.css( "span" )
      span.text.should == "<p>This text is shown only in edit mode.</p>"
    end

  end

  describe "#do_not_show_in_edit_mode_span" do
   
    it "should generate the corresponding span" do
      nokogiri = Nokogiri::HTML.parse( do_not_show_in_edit_mode_span { "<p>This text is shown only when not in edit mode.</p>" } )
      span = nokogiri.css( "span" )
      span.text.should == "<p>This text is shown only when not in edit mode.</p>"
    end

  end


end
