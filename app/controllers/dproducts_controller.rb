class DproductsController < ApplicationController
    layout "dproduct"
    def index

    if params[:dcategory].blank?
      @dproducts = Dproduct.all
    else
      @dcategory_id = Dcategory.find_by(name: params[:dcategory]).id
      @dproducts = Dproduct.where(:dcategory_id => @dcategory_id)
    end

    end
    def show
    @dproduct = Dproduct.find(params[:id])
    end
    def add_to_dcart
      @dproduct = Dproduct.find(params[:id])
        if !current_dcart.dproducts.include?(@dproduct)
          current_dcart.add_dproduct_to_dcart(@dproduct)
            flash[:notice] = "#{@dproduct.title}已经成功到后厨"
    else
        flash[:warning] = "后厨已经有了，又不是自助餐，爱就要克制"
        end
            redirect_to :back
    end
end
