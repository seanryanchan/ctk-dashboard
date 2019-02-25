class UsersController < ApplicationController

  def show
    if logged_in?
      @user = User.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def newPurchasing
    @user = User.new()
  end

  # rank of 0 is purchasing account
  def createPurchasing
    @user = User.new(user_params)
    @user.rank = 0
    if @user.save
      log_in(@user)
      flash.now[:success] = "Successfully logged in."
      redirect_to products_path
    else
      flash.now[:danger] = @user.errors.messages
      redirect_to signup_path
    end
  end

  # This is for existing logged in users.
  def newUser
    @newUser = User.new()
  end

  def createUser
    @newUser = User.new()
    @newUser.username = params[:user][:username]
    @newUser.password = params[:user][:password]
    @newUser.password_confirmation = params[:user][:password_confirmation]
    case params[:user][:rank]
    when 'Purchasing'
      @newUser.rank = 0
    when 'Admin'
      @newUser.rank = 1
    end
    if @newUser.save
      flash.now[:success] = "Successfully created the user: #{@newUser.username}"
      redirect_to products_path
    else
      flash.now[:danger] = @newUser.errors.messages
      redirect_to create_user_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :rank)
    end
end
