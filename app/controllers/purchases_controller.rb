class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index
  
  def new
    @item = Item.find(params[:item_id])
  end
  
  def create
    Purchase.create(purchase_params)
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to controller: :items, action: :index
    end
  end

  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
