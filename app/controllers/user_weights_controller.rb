class UserWeightsController < ApplicationController

  def create
    @user_weight = current_user.user_weights.create(weight_params)
    if @user_weight.save
      flash[:success] = "Weight #{@user_weight.weight} added for #{@user_weight.created_at}"
      redirect_to user_path(current_user)
    else
      redirect_to user_path(current_user)
    end
  end

  def show
    @user_weight = UserWeight.find(params[:id])
  end

  def edit
    @user_weight = UserWeight.find(params[:id])
  end

  def update
    @user_weight = UserWeight.find(params[:id])
    if @user_weight.update(weight_params)
      flash[:success] = "Weight #{@user_weight.weight} successfully updated at #{@user_weight.updated_at}"
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end


  private
  def weight_params
    params.require(:user_weight).permit(:weight)
  end
end
