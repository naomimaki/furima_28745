class OrdersController < ApplicationController
  before_action :move_to_index, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    @order = OrderPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderPurchase.new(order_params)
    if @order.valid?
       @order.save
      redirect_to root_path
    else
      render 'new'
    end
  end
 
  private
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_purchase).permit( :postal_code, :city, :addresses, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    # カラムにない値のやり取りを許可する方法の記述が必要？
  end

  def pay_item
    Payjp.api_key = ["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      # amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end

