class DordersController < ApplicationController+  before_action :authenticate_user!, only: [:create]

  def show
    @dorder = Dorder.find(params[:id])
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
      redirect_to dorder_path(@dorder)
    else
      render 'dcarts/checkout'
    end
  end

  private

  def dorder_params
    params.require(:dorder).permit(:billing_name, :billing_address, :shipping_name, :shipping_address)
  end
end
