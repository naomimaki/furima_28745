require 'rails_helper'

RSpec.describe OrderPurchase, type: :model do
  describe "Ordersテーブルに情報が保存できること" do
    before do
      @order_purchase = FactoryBot.build(:order_purchase)
    end
  
    it "ordersテーブルのすべてのカラムに情報があると保存ができる" do
      expect(@order_purchase).to be_valid
    end

    it "郵便番号が３桁−４桁の形式になっている場合は保存できる" do
      expect(@order_purchase).to be_valid
    end

    it "郵便番号にハイフンが入っていないと保存できない" do
      @order_purchase.postal_code = '1111111'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include('Postal code Input correctly')
    end

    it "prefecture_idが０以外であれば保存できる" do
      expect(@order_purchase).to be_valid
    end

    it "prefecture_idが０の場合は保存できない" do
      @order_purchase.prefecture_id = '0'
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Prefecture Select")
    end

    it "cityが空の場合は保存できない" do
      @order_purchase.city = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("City can't be blank")
    end
  
    it "addressesが空の場合は保存できない" do
      @order_purchase.addresses = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Addresses can't be blank")
    end

    it "building_nameが空の場合は保存できる" do
      @order_purchase.building_name = nil
      expect(@order_purchase).to be_valid
    end

    it "phone_numberが半角数字11桁であれば保存できる" do
      expect(@order_purchase).to be_valid
    end

    it "phone_numberが空の場合は保存できない" do
      @order_purchase.phone_number = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Phone number can't be blank")
    end

    it "tokenが生成されている場合は保存できる" do
      expect(@order_purchase).to be_valid
    end

    it "tokenが生成されていない場合は保存できない" do
      @order_purchase.token = nil
      @order_purchase.valid?
      expect(@order_purchase.errors.full_messages).to include("Token can't be blank")
    end
  end
end
