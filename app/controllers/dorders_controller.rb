class DordersController < ApplicationController
    before_action :authenticate_user!, only: [:create]

  def show
    @dorder = Dorder.find_by_token(params[:id])
    @dproduct_lists = @dorder.dproduct_lists
  end

  def create
  	@dorder = Dorder.new(dorder_params)
    @dorder.user = current_user
    @dorder.total = current_dcart.total_price

    if @dorder.save
        current_dcart.dcart_items.each do |dcart_item|
          dproduct_list = DproductList.new
          dproduct_list.dorder = @dorder
          dproduct_list.dproduct_name = dcart_item.dproduct.title
          dproduct_list.dproduct_price = dcart_item.dproduct.price
          dproduct_list.quantity = dcart_item.quantity
          dproduct_list.save
        end
      current_dcart.clean!

      DorderMailer.notify_order_placed(@dorder).deliver!

      redirect_to dorder_path(@dorder.token)
    else
      render 'dcarts/dcheckout'
    end
  end

  def pay_with_alipay
    @dorder = Dorder.find_by_token(params[:id])
    @dorder.set_payment_with!("alipay")
    @dorder.make_payment!

    redirect_to dorder_path(@dorder.token), notice: "使用支付宝成功完成付款"
  end

  def pay_with_wechat
    @dorder = Dorder.find_by_token(params[:id])
    @dorder.set_payment_with!("wechat")
    @dorder.make_payment!

    redirect_to dorder_path(@dorder.token), notice: "使用微信成功完成付款"
  end
  def apply_to_cancel
    @dorder = Dorder.find_by_token(params[:id])
    DorderMailer.apply_cancel(@dorder).deliver!
    flash[:notice] = "已提交申请"
    redirect_to :back
  end

  private

  def dorder_params
    params.require(:dorder).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
