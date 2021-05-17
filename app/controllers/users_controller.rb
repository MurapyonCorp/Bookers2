class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  end
  def index
    @user =current_user
    @book = Book.new
    @users = User.all

  end
  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:title, :body)
  end
end
