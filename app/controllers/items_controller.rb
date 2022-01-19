class ItemsController < ApplicationController
  def index
    @items = Item.order(id: "DESC")
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :postage_id, :prefecture_id, :shippingdate_id, :image).merge(user_id: current_user.id)
  end
end
