class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]

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
    @userWeights = @user.user_weights.order(:created_at).paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Information updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end


  def destroy
    @user.destroy
    flash[:danger] = "User and all associated data is destroyed"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = "You do not have access for this action"
      redirect_to root_path
    end
  end

end
