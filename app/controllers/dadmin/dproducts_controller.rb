class Dadmin::DproductsController < ApplicationController
	layout "dadmin"
	before_action :authenticate_user!
	before_action :dadmin_required

 	def index
	  @dproducts = Dproduct.all
 	end

	def new
		@dproduct = Dproduct.new
	end

	def create
		@dproduct = Dproduct.new(product_params)

		if @dproduct.save
			redirect_to dadmin_dproducts_path
		else
			render :new
		end
	end

	def edit
   	@dproduct = Dproduct.find(params[:id])
 	end

 	def update
   	@dproduct = Dproduct.find(params[:id])

   	if @dproduct.update(product_params)
     	redirect_to dadmin_dproducts_path
   	else
     	render :edit
		end
 	end

	private

	def product_params
		params.require(:dproduct).permit(:title, :description, :quantity, :price, :image)
	end
end
