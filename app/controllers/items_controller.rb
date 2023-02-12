class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if
      @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end
 
  private

  def item_params
    params.require(:item).permit(:name,:text,:category_id, :status_id, :fee_id, :prefecture_id, :delivery_id, :image, :price).merge(user_id: current_user.id)
  end

end
