# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    email = params[:email]
    password = params[:password]

    user = User.login(email, password)

    if user
      session[:user] = user.id
      redirect_to root_path, notice: '登入成功'
    else
      redirect_to login_users_path, alert: '登入失敗'
    end
  end

  def destroy
    session[:user] = nil
    redirect_to root_path, notice: '已登出'
  end
end
