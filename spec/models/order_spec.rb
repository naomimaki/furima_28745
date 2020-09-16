# require 'rails_helper'

# RSpec.describe Order, type: :model do
#   describe "Ordersテーブルに情報が保存できること" do
#     before do
#       @order = FactoryBot.build(:order)
#     end
  
#     it "ordersテーブルのすべてのカラムに情報があると保存ができる" do
#       expect(@order).to be_valid
#     end

#     it "郵便番号が３桁−４桁の形式になっている場合は保存できる" do
#       expect(@order).to be_valid
#     end

#     it "郵便番号にハイフンが入っていないと保存できない" do
#       @order.postal_code = '1111111'
#       @order.valid?
#       expect(@order.errors.full_messages).to include('Postal code Input correctly')
#     end

#     it "prefecture_idが０以外であれば保存できる" do
#       expect(@order).to be_valid
#     end

#     it "prefecture_idが０の場合は保存できない" do
#       @order.prefecture_id = '0'
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Prefecture Select")
#     end

#     it "cityが空の場合は保存できない" do
#       @order.city = nil
#       @order.valid?
#       expect(@order.errors.full_messages).to include("City can't be blank")
#     end
  
#     it "addressesが空の場合は保存できない" do
#       @order.addresses = nil
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Addresses can't be blank")
#     end

#     it "building_nameが空の場合は保存できる" do
#       @order.building_name = nil
#       expect(@order).to be_valid
#     end

#     it "phone_numberが半角数字11桁であれば保存できる" do
#       expect(@order).to be_valid
#     end

#     it "phone_numberが空の場合は保存できない" do
#       @order.phone_number = nil
#       @order.valid?
#       expect(@order.errors.full_messages).to include("Phone Nnumber can't be blank")
#     end

#     it "tokenが生成されている場合は保存できる" do
#       expect(@order).to be_valid
#     end

#     it "tokenが生成されていない場合は保存できない" do
#       @order.token = nil
#       expect(@prder.errors.full_messages).to include("Token can't be blank")
#     end
#   end
# end

