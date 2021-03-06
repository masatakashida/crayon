class UsersController < ApplicationController
  layout 'crayon'
  # ---------------------
  # テストコード書いてない
  # ---------------------
  def index
  	@users = User.all
  end
  # ---------------------
  # テストコード書いてない
  # ---------------------
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to root_url
  	else
  		render 'new'
  	end
  end



  private

  	def user_params
  		params.require(:user).permit(:name, :email)
  	end
end
