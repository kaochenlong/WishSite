class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user, :user_signed_in?

  private
  def record_not_found
    render file: "#{Rails.root}/public/404.html",
           status: 404,
           layout: false
  end

  def current_user
    @__user__ ||= User.find_by(id: session[:user])
  end

  def user_signed_in?
    !!session[:user]
  end

  def authenticate_user!
    if not user_signed_in?
      redirect_to login_users_path, alert: "請先登入帳號"
    end
  end
end
