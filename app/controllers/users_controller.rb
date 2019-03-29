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

  def createPurchasing
    @user = User.new(user_params)
    @user.rank = UsersHelper::PURCHASING
    if @user.save
      log_in(@user)
      flash.now[:success] = "Successfully logged in."
      redirect_to products_path
    else
      render 'newPurchasing'
    end
  end

  # This is for existing logged in users, when they make another account.
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
      @newUser.rank = UsersHelper::PURCHASING
    when 'Admin'
      @newUser.rank = UsersHelper::ADMIN
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
