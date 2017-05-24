class Dadmin::DordersController < ApplicationController
	layout "dadmin"

	before_action :authenticate_user!
	before_action :dadmin_required

	def index
		@dorders = Dorder.order("id DESC")
	end

	def show
	 	@dorder = Dorder.find(params[:id])
	 	@dproduct_lists = @dorder.dproduct_lists
	end

	def ship
		@dorder = Dorder.find(params[:id])
		@dorder.ship!
		DorderMailer.notify_ship(@dorder).deliver!
		redirect_to :back
	end

	def shipped
		@dorder = Dorder.find(params[:id])
		@dorder.deliver!
		redirect_to :back
	end

	def cancel
		@dorder = Dorder.find(params[:id])
		@dorder.cancel_order!
		DorderMailer.notify_ship(@dorder).deliver!
		redirect_to :back
	end

	def return
		@dorder = Dorder.find(params[:id])
		@dorder.return_good!
		redirect_to :back
	end
end
