class FavoritesController < ApplicationController
  before_action :set_item 

  def create
    @favorite = Favorite.new(user_id: current_user.id,  item_id: @item.id)
    @favorite.save
    render 'create.js.erb'
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, item_id:  @item.id)
    @favorite.destroy
    render 'destroy.js.erb'
  end

  private

  def set_item
    @item = Item.find_by(id: params[:item_id])
  end
end
