# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_wish_list, only: [:create]

  def create
    quantity = params[:quantity].to_i
    amount = @wish_list.amount * quantity

    order = current_user.orders.new(
      amount:,
      quantity:,
      wish_list: @wish_list
    )

    if order.save
      redirect_to checkout_order_path(id: order.serial)
    else
      redirect_to buy_wish_list_path(@wish_list), alert: '訂單建立失敗'
    end
  end

  def checkout
    @order = Order.find_by!(serial: params[:id])
    @token = gateway.client_token.generate
  end

  def pay
    order = Order.find_by!(serial: params[:id])

    if order.may_pay?
      result = gateway.transaction.sale(
        amount: order.amount,
        payment_method_nonce: params[:nonce]
      )

      if result.success?
        order.pay!
        redirect_to root_path, notice: '付款成功'
      else
        redirect_to root_path, alert: '付款發生問題'
      end
    else
      redirect_to root_path, alert: '訂單查詢錯誤'
    end
  end

  private

  def find_wish_list
    @wish_list = WishList.find(params[:wish_list_id])
  end

  def gateway
    Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV.fetch('BRAINTREE_MERCHANT_ID', nil),
      public_key: ENV.fetch('BRAINTREE_PUBLIC_KEY', nil),
      private_key: ENV.fetch('BRAINTREE_PRIVATE_KEY', nil)
    )
  end
end
