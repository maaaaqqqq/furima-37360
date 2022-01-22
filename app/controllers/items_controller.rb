class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order(created_at: 'DESC')
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
    if current_user.id == @item.user_id
      if @item.bought_item_record.present?
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if @item.bought_item_record.nil? && current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      end
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :shippingdate_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end