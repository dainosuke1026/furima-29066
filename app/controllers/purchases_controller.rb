class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  before_action :move_to_index

  def new
    @purchase_address = PurchaseAddress.new
  end
  
  def create
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to controller: :items, action: :index
    else
      render 'new'
    end
  end
  
  private

  def item_data
    @item = Item.find(params[:item_id])
  end
  
  def move_to_index
    if (current_user.id == item_data.user_id) || item_data.purchase
      redirect_to controller: :items, action: :index
    end
  end

  def address_params
    params.require(:purchase_address).permit(:prefecture_id, :postal_code, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: item_data.id, token: params[:token], price: item_data.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: address_params[:price],
        card: address_params[:token],
        currency: 'jpy'
      )
  end
end
