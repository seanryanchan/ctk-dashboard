module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    if @user.nil?
      @user = User.find_by(id: session[:user_id])
    else
      @user
    end
  end

  def logged_in?
    !current_user.nil? && !(session[:user_id].nil?)
  end

  def log_out
    session.delete(:user_id)
    @user = nil
  end
end
