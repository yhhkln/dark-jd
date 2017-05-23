class DcartsController < ApplicationController
	def clean
   	current_dcart.clean!
   	flash[:warning] = "破碗难圆啊少年"
   	redirect_to dcarts_path
 	end

	def checkout
    @dorder = Dorder.new
  end

end
