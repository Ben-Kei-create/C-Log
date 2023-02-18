class Admin::CustomersController < ApplicationController

  def index
   @customers = Customer.all
   @customers = Customer.page(params[:page]).per(15)
   end

  def show
   @customer = Customer.find(params[:id])
   @profile_image = @customer.profile_image
   @impression = @customer.impressions.order(created_at: :desc).first
  end

  #管理者が、会員『全ての』コメント一覧を見るために必要なページです。
  def comments
   @reviews = PostComment.all
  # @post_comments = PostComment.where(customer_id: @customer)
  #  @reviews = PostComment.where(movie_id: params[:id], customer_id: pa)
  end

  #管理者が、会員『一人の』コメント一覧を見るために必要なページです。
  def customer_comments
   @customer = Customer.find(params[:id])
   @profile_image = @customer.profile_image
   @post_comments = PostComment.where(customer_id: @customer).page(params[:page]).per(3)
  end

  #管理者が、会員『一人の』コメントの詳細を見るために必要なページです。
  def comment_detail
   @customer = Customer.find(params[:id])
   @customer_comment_detail = PostComment.find(params[:id])
  end
end