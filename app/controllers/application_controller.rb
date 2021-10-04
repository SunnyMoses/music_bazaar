class ApplicationController < ActionController::Base
	  # before_action :authenticate_user!
	    def after_sign_in_path_for(user)
	    	puts "--------------------------------------------------------"
	    	current_cart
	    	gallery_index_path
	    	if $flag==0
	    	 gallery_index_path
	    	else
	    	# 	"/cart/#{$gcart.id}"
	    		"/carts/#{$gcart.id}"
	    	end

	    end

	    def after_sign_out_path_for(scope)
	    	# session[:user] = nil
	    	puts "]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]"
	    	begin
	    	puts $gcart.id
	    	$gcart.destroy
	    	rescue
	    	puts "[[[[[[[[[[[[[[[[[[[[[[[[[[[[[["
	    	 end
	    	user_session_path

	    end

	    def current_cart
	    	
		    begin
		    	Cart.find(session[:cart_id])
		    rescue  ActiveRecord::RecordNotFound
		    	cart = Cart.create
		    	$gcart=cart
		    	session[:cart_id] = cart.id
		    	cart
		    end
		end

end
