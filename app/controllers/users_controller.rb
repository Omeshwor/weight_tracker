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
    @user = User.find(params[:id])
    @userWeights = current_user.user_weights.order(:created_at)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Information updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all associated data is destroyed"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end

end
