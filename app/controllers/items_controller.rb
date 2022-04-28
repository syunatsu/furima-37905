class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if user_signed_in? && current_user.id == item.user_id
      item.destroy
      redirect_to root_path
    end 
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :condition_id, :category_id, :delivery_fee_id,
                                 :prefecture_id, :shipment_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
