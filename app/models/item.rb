class Item < ActiveRecord::Base
  belongs_to :user
  
  default_scope {order('created_at DESC')}
  
  validates :name, length: {minimum: 5}, presence: true
end
