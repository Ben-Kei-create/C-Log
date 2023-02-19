class Public::FavoritesController < ApplicationController

  def create
    @post_favorite = Favorite.new(customer_id: current_customer.id, movie_id: params[:movie_id])
    @post_favorite.save
    redirect_to movie_path(params[:movie_id])
  end

  def destroy
    @post_favorite = Favorite.find_by(customer_id: current_customer.id, movie_id: params[:movie_id])
    @post_favorite.destroy
    redirect_to movie_path(params[:movie_id])
  end

  def index
    @favorite = Favorite.where(customer_id: current_customer.id)
    @favorite = @favorite.page(params[:page]).per(15)
  end

end
