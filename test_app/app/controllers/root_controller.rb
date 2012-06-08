class RootController < ApplicationController

  def index
    if User.first
      redirect_to User.first
    else
      redirect_to controller: 'users', action: 'index'
    end
  end

end
