class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back #{user.first_name} #{user.last_name}"
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid email/password combination, please try again"
      render 'new'
    end
  end

  def destroy
  end
end