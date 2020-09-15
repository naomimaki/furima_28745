class OrdersController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :set_item, only: [:new, :create]

  def new
    @order = OrderPurchase.new
  end

  def create
    @order = OrderPurchase.new(order_params)
    if @order.valid?
       pay_item
       @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end
 
  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index 
    @item = Item.find(params[:item_id])
    unless user_signed_in? && @item.purchase == nil
      redirect_to root_path
    end
  end


  def order_params
    params.require(:order_purchase).permit( :postal_code, :city, :addresses, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # カラムにない値のやり取りを許可する方法の記述が必要？
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end

