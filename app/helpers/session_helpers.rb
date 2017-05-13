helpers do
  def current_user
    @current_user ||= session[:user_id] &&
    User.find_by_id(session[:user_id])
  end

  def is_logged_in?
    !!current_user
  end
end
