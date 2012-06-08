module EditMode
  class Engine < Rails::Engine
    initializer "setup for rails" do
      ActionView::Base.send( :include, EditMode::EditModeHelpers )
    end
  end
end
