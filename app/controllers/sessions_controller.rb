class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      #
    else
      #
    end
    new
  end
  def destroy

  end
end
