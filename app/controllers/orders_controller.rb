class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wish_list, only: [:create]

  def create
    quantity = params[:quantity].to_i
    amount = @wish_list.amount * quantity

    order = current_user.orders.new(
      amount: amount,
      quantity: quantity,
      wish_list: @wish_list
    )

    if order.save
      redirect_to checkout_order_path(id: order.serial)
    else
      redirect_to buy_wish_list_path(@wish_list), alert: "訂單建立失敗"
    end
  end

  def checkout
    #
  end

  private
  def find_wish_list
    @wish_list = WishList.find(params[:wish_list_id])
  end
end
