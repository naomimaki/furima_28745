FactoryBot.define do
  factory :order_purchase do
    user_id { '1' }
    item_id { '1' }
    purchase_id { '1' }
    postal_code { '111-1111' }
    prefecture_id { '1' }
    city { '江戸川区中葛西２丁目' }
    addresses { '2-7' }
    phone_number { '09012345678' }
    token { 'tok_b5291825bed29d44ffa94503c92c' }
    building_name { '小林マンション' }
  end
end

