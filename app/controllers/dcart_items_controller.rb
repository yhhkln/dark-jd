class DcartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @dcart = current_dcart
    @dcart_item = @dcart.dcart_items.find_by(dproduct_id: params[:id])
    @dproduct = @dcart_item.dproduct
    @dcart_item.destroy

    flash[:warning] = "成功将 #{@dproduct.title} 从碗里拿走!"
    redirect_to :back
  end
  def update
    @dcart = current_dcart
    @dcart_item = @dcart.dcart_items.find_by(dproduct_id: params[:id])

    if @dcart_item.dproduct.quantity >= dcart_item_params[:quantity].to_i
      @dcart_item.update(dcart_item_params)
      
      flash[:notice] = "碗里的东西变多了，好挤呀！"
    else
      flash[:warning] = "都在碗里了"
    end

    redirect_to dcarts_path
  end

  private

  def dcart_item_params
    params.require(:dcart_item).permit(:quantity)
  end
end
