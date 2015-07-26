class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :follow_get, only: [:show, :followings, :followers]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end

  def edit
  end

  def update
      if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      flash[:info] = "メッセージを編集しました"
      redirect_to @user
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile, :pref_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def follow_get
    # フォロー、フォロワーの数を検索
    @follower_num =  Relationship.where(follower_id: params[:id]).count
    @followed_num =  Relationship.where(followed_id: params[:id]).count
  end
end
