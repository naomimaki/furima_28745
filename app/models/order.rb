class Order < ApplicationRecord 
  attr_accessor :token
  
  belongs_to :purchase
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

end
