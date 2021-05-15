class UsersController < ApplicationController
  def show

  end
  def index
    @user =current_user

  end
end
