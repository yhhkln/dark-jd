class ProductsController < ApplicationController
  # before_action :authenticate_user!, :only, [:new, :edit, :create, :update, :destroy]
  before_action :validate_search_key, only: [:search]
  def index
    @products = Product.all.order("position ASC")
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    @photos = @product.photos.all
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to carts_path, notice: "Update success."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, alert: "Product deleted."
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功将 #{@product.title} 加入购物车"
    else
      flash[:warning] = "你的购物车内已有此物品"
    end
    redirect_to :back
  end


# 搜索
  def search
    if @query_string.present?
      search_result = Product.ransack(@search_criteria).result(:distinct => true)
      @products = search_result.paginate(:page => params[:page], :per_page => 5 )
    end
  end


  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "")
    if params[:q].present?
      @search_criteria = search_criteria(@query_string)
    end
  end


  def search_criteria(query_string)
    { :title_cont => query_string }
  end

# 搜索

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :quantity, :salt, :sugar, :papper, :sauces, :vinegar, :oil)
  end
end
