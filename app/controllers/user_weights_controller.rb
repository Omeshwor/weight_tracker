class UserWeightsController < ApplicationController

  def create
    @user_weight = current_user.user_weights.build(weight_params)
    if @user_weight.save
      flash[:success] = "Weight #{@user_weight.weight} added for #{@user_weight.created_at}"
      redirect_to user_path(current_user)
    else
      redirect_to user_path
    end
  end

  def show
    @user_weight = UserWeight.find(params[:id])
  end


  private
  def weight_params
    params.require(:user_weights).permit(:weight)
  end
end
