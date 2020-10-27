class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index

  def new
    @item = Item.find(params[:item_id])
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      @purchase_address.save
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

  def address_params
    params.require(:purchase_address).permit(:prefecture_id, :postal_code, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
