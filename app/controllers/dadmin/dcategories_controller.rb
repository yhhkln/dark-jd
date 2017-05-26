class Dadmin::DcategoriesController < ApplicationController
  layout "dadmin"

  before_action :authenticate_user!
  before_action :admin_required

  def index
    @categories = Dcategory.all
  end

  def new
    @dcategory = Dcategory.new
  end

  def create
    @dcategory = Dcategory.new(dcategory_params)
    if @dcategory.save
      redirect_to dadmin_dcategories_path
    else
      render :new
    end
  end

  def edit
    @dcategory = Dcategory.find(params[:id])
  end

  def update
    @dcategory = Dcategory.find(params[:id])
    if @dcategory.update(dcategory_params)
      redirect_to dadmin_dcategory_path
    else
      render :edit
    end
  end

  def destroy
    @dcategory = Dcategory.find(params[:id])
    @dcategory.destroy
    redirect_to dadmin_dcategories_path, warning: "你已删除这个分类"
  end


  private

  def dcategory_params
    params.require(:dcategory).permit(:name)
  end
end
