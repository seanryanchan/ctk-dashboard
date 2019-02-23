class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def newPurchasing
    @user = User.new()
    render 'create_purchasing_account'
  end

  # rank of 0 is purchasing account
  def createPurchasing
    @user = User.new(user_params)
    @user.rank = 0
    if @user.save
      log_in(@user)
      puts logged_in?
      flash.now[:success] = "Successfully logged in."
      redirect_to products_path
    else
      flash.now[:danger] = @user.errors.messages
      redirect_to signup_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
