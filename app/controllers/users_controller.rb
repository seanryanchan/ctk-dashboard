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
    @user.rank = 1
    if @user.save
      format.html { redirect_to @user, notice: 'Purchasing account was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
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
