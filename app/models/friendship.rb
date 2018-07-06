class Friendship < ApplicationRecord  
  belongs_to :users, optional: true  
  belongs_to :friend, :class_name => 'User'   
end
