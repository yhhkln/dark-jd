class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def set_locale
    if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
      session[:locale] = params[:locale]
    end

    I18n.locale = session[:locale] || I18n.default_locale
  end


  def admin_required
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin."
   end
  end

  def dadmin_required
    if !current_user.dadmin?
      redirect_to "/", alert: "You are not dadmin."
    end
  end

  def require_is_admin
  if !current_user.admin?
    flash[:alert] = 'You are not admin'
    redirect_to root_path
  end
end


  helper_method :current_cart

  def current_cart
    @current_cart ||= find_cart
  end

  private

  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    if cart.blank?
      cart = Cart.create
    end
    session[:cart_id] = cart.id
    return cart
  end

  helper_method :current_dcart

  def current_dcart
    @current_dcart ||= find_dcart
  end

  private

  def find_dcart
    dcart = Dcart.find_by(id: session[:dcart_id])
    if dcart.blank?
      dcart = Dcart.create
    end
    session[:dcart_id] = dcart.id
    return dcart
  end
end
