class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to controller: :items, action: :index
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
    @user_id = current_user.try(:id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :status_id, :cost_id, :prefecture_id, :day_id).merge(user_id: current_user.id)
  end
end
