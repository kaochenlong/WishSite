module UsersHelper
  # memorization
  def current_user
    @__user__ ||= User.find_by(id: session[:user])
  end

  def user_signed_in?
    !!session[:user]
  end
end
