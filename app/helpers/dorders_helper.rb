module DordersHelper
	def render_dorder_paid_state(dorder)
   	if dorder.is_paid?
     	"已付款"
   	else
     	"未付款"
   	end
 	end

end
