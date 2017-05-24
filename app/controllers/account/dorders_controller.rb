class Account::DordersController < ApplicationController
	before_action :authenticate_user!

  def index
    @dorders = current_user.dorders.order("id DESC")
  end
end
