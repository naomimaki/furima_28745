class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_derivery
  
  belongs_to:user
  
  validates :image, :name, :info, :category, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id, :price, :user_id, presence :true
  validates :info, length {maximum: 1000 }
  validates :name,length {maximum: 40 }

  with options format: {with: greater_than_or_equal_to: 300 && less_than_or_equal_to: 9999999 message:"Price Out of setting range"} do
    validates :price
  end

  with options format: {with: /\A[0-9]+\z/ message:"Price Half-width number"} do
    validates :price
  end

  # アクティブハッシュのバリデーション
  validates :category_id, numericality: { other_than: 1}
  validates :sales_status_id, numericality: { other_than: 1}
  validates :prefecture_id, numericality: { other_than: 0}
  validates :schedule_delivery_id, numericality: { other_than: 1}
  validates :shipping_fee_status_id, numericality: { other_than: 1}
      #  バリデーションの設定エラーMSGは
      # Image can't be blank
      # Name can't be blank
      # Info can't be blank
      # Price can't be blank
      # Price Half-width number
      # Price Out of setting range
      # Category Select
      # Sales status Select
      # Shipping fee status Select
      # Prefecture Select
      # Scheduled delivery Select
end
