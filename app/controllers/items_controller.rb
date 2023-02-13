class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, :fee_id, :prefecture_id, :delivery_id, :image,
                                 :price).merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to action: :index
  end
end
