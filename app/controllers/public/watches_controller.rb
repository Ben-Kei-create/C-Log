class Public::WatchesController < ApplicationController

  def create
    @post_Watched = Watch.new(customer_id: current_customer.id, movie_id: params[:movie_id])
    @post_Watched.save
    redirect_to movie_path(params[:movie_id])
  end

  def destroy
    @post_Watched = Watch.find_by(customer_id: current_customer.id, movie_id: params[:movie_id])
    @post_Watched.destroy
    redirect_to movie_path(params[:movie_id])
  end

  def index
    @watch = Watch.where(customer_id: current_customer.id)
    @watch = @watch.page(params[:page]).per(15)
  end
end