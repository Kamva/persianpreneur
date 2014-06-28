class AdminSessionsController < ApplicationController


	def new
		if logged_in? 
			redirect_to(root_path)
		end
	end

	def create
		if login(params[:email], params[:password])
			redirect_back_or_to(root_path)
		else 
			flash[:notice] = "Wrong Email or Password, Login failed."
			render action: :new
		end
	end

	def destroy
		logout
		redirect_to(root_path)
	end

end
