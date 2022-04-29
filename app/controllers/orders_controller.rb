class OrdersController < ApplicationController
  def index
    @order_destination = OrderDestination.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destinaiton.valid?
      @order_destinaiton.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_destinaiton).permit(:postal_code, :city, :address, :building_name, :phone_number, :prefecture_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
