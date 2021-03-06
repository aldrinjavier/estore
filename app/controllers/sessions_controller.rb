class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			flash[:success] = 'Welcome back' 
			log_in user
			redirect_to user
		else
			flash[:danger] = 'Invalid email/password combination' # Not quite right!
			# Create an error message.
			render 'new'
		end
	end

	def destroy
		log_out if logged_in?
		redirect_to root_url
	end
end
