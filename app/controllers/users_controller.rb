class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  def new
    @user = User.new()
    render 'create_account'
  end

  def createPurchasing
    @user = User.new(user_params)
    @user.rank = 0
    if @user.save
      redirect_to products_path
    else
      new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_entry
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
