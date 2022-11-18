class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    render html: user_params
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
