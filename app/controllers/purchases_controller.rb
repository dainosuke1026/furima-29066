class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index

  def new
    @item = Item.find(params[:item_id])
    @address = Address.new
  end
  
  def create
    purchase = Purchase.create(purchase_params)
    @address = Address.create(address_params(purchase))
    if @address.save
      redirect_to controller: :items, action: :index
    else
      render 'new'
    end
  end

  private

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to controller: :items, action: :index
    end
  end

  def purchase_params
    params.permit.merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def address_params(purchase)
    params.require(:address).permit(:prefecture_id, :postal_code, :city, :house_number, :building_name, :phone_number).merge(purchase_id: purchase.id)
  end
end
