require "spec_helper"

describe EditMode::EditModeHelpers do
  
  describe "#show_only_in_edit_mode_span" do
    
    it "should generate the corresponding span" do
      nokogiri = Nokogiri::HTML.parse( show_only_in_edit_mode_span { "<p>This text is shown only in edit mode.</p>" } )
      span = nokogiri.css( "span" )
      span.text.should == "<p>This text is shown only in edit mode.</p>"
    end

  end

end
