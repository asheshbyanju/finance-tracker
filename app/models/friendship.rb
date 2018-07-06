class Friendship < ApplicationRecord  
  belongs_to :users
  belongs_to :friends, :class_name => 'User'   
end
