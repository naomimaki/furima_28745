class OrderPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token
  validates :token, :postal_code, :city, :addresses, :phone_number, :prefecture_id, presence: true

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :phone_number, length: {maximum: 11} 

  with_options numericality: { other_than: 0, message: 'Select'} do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end
end