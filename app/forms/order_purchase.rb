class OrderPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id, :purchase_id, :token

  # orderテーブルのバリデーション
  validates :token, :postal_code, :city, :addresses, :phone_number, presence: true

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
  validates :phone_number, length: {maximum: 11} 

  with_options numericality: { other_than: 0, message: 'Select'} do
    validates :prefecture_id
  end
  # purchaseテーブルのバリデーションを入力→外部キーのみなのでなさげなので空白のままで。

  def save
    # purchaseテーブルの情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # orderの情報を保存しorderという変数に代入トークンを保存したいがカラムには存在しない。
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number,purchase_id: purchase.id)
  end
end