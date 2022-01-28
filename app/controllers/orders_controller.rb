class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_action, only: [:index, :create]

  def index
    @order_delivery = OrderDelivery.new
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.order.present?
      redirect_to root_path
    end
  end

  def new
  end

  def create
    @order_delivery = OrderDelivery.new(order_params)
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_delivery).permit(:price, :post_code, :prefecture_id, :city, :address, :building_name, :tel).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_action
    @item = Item.find(params[:item_id])
  end
end
