class Order < ApplicationRecord 
  attr_accessor :token
  
  belongs_to :purchase
  
  # validates :token, :postal_code, :city, :addresses, :phone_number, presence: true

  # validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  # validates :phone_number, length: {maximum: 11} 

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  # with_options numericality: { other_than: 0, message: 'Select'} do
  #   validates :prefecture_id
  # end
  # とりあえずコメントアウトしておく。
end
