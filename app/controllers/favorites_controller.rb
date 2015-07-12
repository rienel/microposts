class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost    = Micropost.find(params[:format])
    @favorite = current_user.favorites.build(micropost: @micropost)

    if @favorite.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by!(params[:format])
    @favorite.destroy
    redirect_to :back
  end
end
