class Item < ApplicationRecord
  has_one_attached :image

  validates :image, :name, :info, :price, presence: true
  validates  :name, length: { maximum:40 }
  validates :info, length: { maximum:1000 }
  with_options numericality: {with:/\A[a-zA-Z0-9]+\z/, message: 'Half-width number'} do
    validates :price
  end
  with_options inclusion: { in:300..9999999, message:"Out of setting range"} do
    validates :price
  end
  # アクティブハッシュ用
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule_delivery

  belongs_to :user
  # アクティブハッシュのバリデーション
  with_options numericality: { other_than: 0,message:"Select"} do
    validates :category_id
    validates :sales_status_id
    validates :prefecture_id
    validates :schedule_delivery_id
    validates :shipping_fee_status_id
  end
end
