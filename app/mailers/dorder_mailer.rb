class DorderMailer < ApplicationMailer
	def notify_order_placed(dorder)
		@dorder        = dorder
		@user        	 = dorder.user
		@dproduct_lists = @dorder.dproduct_lists

		mail(to: @user.email , subject: "[JDstore] 感谢您完成本次的下单，以下是您这次购物明细 #{dorder.token}")
	end

	def apply_cancel(dorder)
		@dorder       = dorder
		@user        = dorder.user
		@dproduct_lists = @dorder.dproduct_lists

		mail(to: "admin@test.com" , subject: "[JDStore] 用户#{dorder.user.email}申请取消订单 #{dorder.token}")
	end
	def notify_ship(dorder)
		@dorder        = dorder
		@user         = dorder.user
		@dproduct_lists = @dorder.dproduct_lists

		mail(to: @user.email, subject: "[JDStore] 您的订单 #{dorder.token}已发货")
	end

	def notify_cancel(dorder)
		@dorder        = dorder
		@user         = dorder.user
		@dproduct_lists = @dorder.product_lists

		mail(to: @user.email, subject: "[JDStore] 您的订单 #{dorder.token}已取消")
	end
end
