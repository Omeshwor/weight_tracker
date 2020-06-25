class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the weight tracker #{@user.first_name} #{@user.last_name}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def show
  end

  def destroy
  end

  def edit
  end

  def update
  end


  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
