class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def index
    @user =current_user

  end
  def edit


  end
  
  private

  def user_params
    params.require(:user).permit(:title, :body)
  end
end
