module EditMode
  class Railtie < Rails::Railtie
    initializer "set view helpers" do
      EditMode::ViewHelpers = ActionView::Base.new
    end
  end
end
