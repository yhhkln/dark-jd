class DproductsController < ApplicationController
	layout "dproduct"
	def index
   	@dproducts = Dproduct.all
 	end

	def show
   	@dproduct = Dproduct.find(params[:id])
 	end

end
