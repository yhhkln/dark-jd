class DproductsController < ApplicationController

	def index
   	@dproducts = Dproduct.all
 	end

	def show
   	@dproduct = Dproduct.find(params[:id])
 	end

end
