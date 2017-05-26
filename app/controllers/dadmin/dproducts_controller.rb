class Dadmin::DproductsController < ApplicationController
	layout "dadmin"
	before_action :authenticate_user!
	before_action :dadmin_required

 	def index
	  @dproducts = Dproduct.all
 	end

	def new
		@dproduct = Dproduct.new
		@dcategories = Dcategory.all.map { |c| [c.name, c.id]}
	end

	def create
		@dproduct = Dproduct.new(product_params)
		@dproduct.dcategory_id = params[:dcategory_id]
		if @dproduct.save
			redirect_to dadmin_dproducts_path
		else
			render :new
		end
	end

	def edit
   	@dproduct = Dproduct.find(params[:id])
		@dcategories = Dcategory.all.map { |c| [c.name, c.id]}
 	end

 	def update
   	@dproduct = Dproduct.find(params[:id])
		@dproduct.dcategory_id = params[:dcategory_id]
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
