class UsersController < ApplicationController
  before_action :follow_get, only: [:show, :followings, :followers]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
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
  
  # フォローしているユーザーを取得
  def followings
    @user = User.find(params[:id])
    @follow_users = @user.following_users
  end

  # フォローされているユーザーを取得
  def followers
    @user = User.find(params[:id])
    @follow_users = @user.followed_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def follow_get
    # フォロー、フォロワーの数を検索
    @follower_num =  Relationship.where(follower_id: params[:id]).count
    @followed_num =  Relationship.where(followed_id: params[:id]).count
  end
end
