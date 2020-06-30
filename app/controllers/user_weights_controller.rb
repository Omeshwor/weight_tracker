class UserWeightsController < ApplicationController
  before_action :set_user_weight, only: [:edit, :update, :destroy, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]


  def create
    @user_weight = current_user.user_weights.create(weight_params)
    if @user_weight.save
      flash[:success] = "Weight #{@user_weight.weight} added for #{@user_weight.created_at}"
      redirect_to user_path(current_user)
    else
      flash[:danger] = "Invalid weight entered, range between 0.1 to 999"
      redirect_to user_path(current_user)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user_weight.update(weight_params)
      flash[:success] = "Weight #{@user_weight.weight} successfully updated at #{@user_weight.updated_at}"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def destroy
    @user_weight.destroy
    flash[:danger] = "Weight deleted"
    redirect_to user_path(current_user)
  end


  private
  def weight_params
    params.require(:user_weight).permit(:weight)
  end

  def set_user_weight
    @user_weight = UserWeight.find(params[:id])
  end

  def require_same_user
    if current_user != @user_weight.user
      flash[:danger] = "You do not have access for this action"
      redirect_to root_path
    end
  end

end
