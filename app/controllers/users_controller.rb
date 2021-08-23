class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :likes]
  
  def index
  end

  def show
   @user = User.find(params[:id])
   @pagy, @posts = pagy(@user.posts.order(id: :desc))
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:succes] = 'アカウントを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = "アカウントの登録に失敗しました。"
      render :new
    end
  end
  
  def likes
    @user = User.find(params[:id])
    @pagy, @favorites = pagy(@user.likes)
  end


  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :photo, :content)
  end
end