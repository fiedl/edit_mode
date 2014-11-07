class User < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :date_of_birth, :description
end
