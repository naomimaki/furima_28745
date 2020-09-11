class OrdersController < ApplicationController
  before_action :move_to_index, only: [:new]

  def new
    @item = Item.find(params[:item_id])
  end

  def create
  end
 
  private
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end

