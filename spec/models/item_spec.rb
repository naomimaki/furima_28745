require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it "すべての入力項目に情報が存在する"do
      expect(@item).to be_valid
    end
   
    it "価格が¥300~¥9,999,999の間であれば登録できる" do
      @item.price = "300"
      expect(@item).to be_valid
    end

    it "priceが¥300~¥9,999,999の間でなければ登録できない" do
      @item.price = "1"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Out of setting range")
    end

    it "priceが半角数字であれば登録できる" do
      @item.price = "300"
      expect(@item).to be_valid
    end
    it "priceが全角であれば登録できない" do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price Half-width number")
    end

    it "imageが空だと登録できない" do
      @item.image = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "category_idが0だと登録できない" do
      @item.category_id = "0"
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select")
    end
  end
end