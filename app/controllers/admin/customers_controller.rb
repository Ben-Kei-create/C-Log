class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(2)
   end

  def show
   @customer = Customer.find(params[:id])
   @profile_image = @customer.profile_image
   @impression = @customer.impressions.order(created_at: :desc).first
  end

  #管理者が、"全ての"会員がしたコメントの一覧を見ることができるページです。
  def comments
   @reviews = PostComment.all
  #    @reviews = PostComment.where(movie_id: params[:id], customer_id: pa)
  end

  #管理者が、一人会員のコメント一覧をみるために必要なページです。
  def customer_comments
   @customer = Customer.find(params[:id])
   @profile_image = @customer.profile_image
   @post_comments = PostComment.where(customer_id: @customer).page(params[:page]).per(3)
  end
end