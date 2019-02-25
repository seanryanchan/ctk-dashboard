module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    History.create(user_id: @user.id, date_action: DateTime.now, log_in_timestamp: DateTime.now)
  end

  def current_user
    if (@user.nil?)
      @user = User.find_by(id: session[:user_id])
    else
      @user
    end
  end

  def logged_in?
    !current_user.nil? && !(session[:user_id].nil?)
  end

  def log_out
    if !History.find_by(user_id: session[:user_id]).nil?
      History.find_by(user_id: session[:user_id]).update(log_out_timestamp: DateTime.now)
    end
    session.delete(:user_id)
    @user = nil
  end
end
