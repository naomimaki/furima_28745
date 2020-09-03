class Item < ApplicationRecord
  validates :image, :name, :info, :price, :user_id, presence: true
  validates  :name, length: { maximum:40 }
  validates :info, length: { maximum:1000 }
  validates :price, numericality: {greater_than_or_equal_to:300, less_than_or_equal_to:999999 }
  # アクティブハッシュ用のもろもろ
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_delivery

  belongs_to :user
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
      # , message:"Price Out of setting range"
end
