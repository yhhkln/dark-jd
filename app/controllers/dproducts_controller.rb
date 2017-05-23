class DproductsController < ApplicationController

	def index
   	@dproducts = Dproduct.all
 	end

	def show
   	@dproduct = Dproduct.find(params[:id])
 	end

	def add_to_dcart
	  @dproduct = Dproduct.find(params[:id])
		if !current_dcart.dproducts.include?(@dproduct)
		  current_dcart.add_dproduct_to_dcart(@dproduct)
			flash[:notice] = "#{@dproduct.title}已经成功到碗里来"
   	else
     	flash[:warning] = "你的碗里已经有了，又不是自助餐，爱就要克制"
 		end
		    redirect_to :back

	end

end
