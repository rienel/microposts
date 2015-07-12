class UsersController < ApplicationController
  before_action :favorite_get, only: [:show, :favorites]

  def show # 追加
    @user = User.find(params[:id])
    @microposts = @user.microposts.page(params[:page]).per(5)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  # お気に入り登録している取得
  def favorites
    @user = User.find(params[:id])
    @microposts = Favorite.where(user_id: params[:id])
#    @microposts = @favorite.micropost
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def favorite_get
    # フォロー、フォロワーの数を検索
    @favorite_num =  Favorite.where(user_id: params[:id]).count
  end
end
