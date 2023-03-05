class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    if @item.user_id != current_user.id || @item.order == nil
      @purchaseform = Purchaseform.new
    else
      redirect_to root_path
    end
  end

  def create
    @purchaseform = Purchaseform.new(order_params)
    if @purchaseform.valid?
      pay_item
      @purchaseform.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchaseform).permit(:postal_code, :prefecture_id, :city, :adress, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
