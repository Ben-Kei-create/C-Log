class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(2)
   end

  def comments
   @reviews = PostComment.all
#    @reviews = PostComment.where(movie_id: params[:id], customer_id: pa)
  end

  def show
   @customer = Customer.find(params[:id])
   @profile_image = @customer.profile_image
   @impression = @customer.impressions.order(created_at: :desc).first
  end

end