class Public::CustomersController < ApplicationController
# # Cinema Logbook
 def new
  @impression = Impression.new
 end

 def show
   @customer = Customer.find(current_customer.id)
   @profile_image = @customer.profile_image
   @impression = @customer.impressions.order(created_at: :desc).first
 end

 def withdrawal
   @customer = Customer.find(params[:id])
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
   @customer.update(is_deleted: true)
   reset_session
   flash[:notice] = "退会処理を実行いたしました"
   redirect_to root_path
 end

 def edit
   @customer = Customer.find(current_customer.id)
 end

  def update
   current_customer.update(customer_params)
   redirect_to customer_path(current_customer)
  end

  def comment
   @post_comments = PostComment.where(customer_id: current_customer.id).page(params[:page]).per(3)
  end

  def destroy
   post_comment = PostComment.find_by(id: params[:id])
   post_comment.delete  # データ（レコード）を削除
   redirect_to comment_path(current_customer)  # 投稿一覧画面へリダイレクト
  end

  def comment_detail
   @comment_detail = PostComment.find(params[:id])
  end

private

 def customer_params
    params.require(:customer).permit(:profile_image, :name, :name_kana, :postal_code, :address, :telephone_number, :email)
 end
end



#   def update
#    current_customer.update(customer_params)
#    redirect_to customer_path(current_customer)
#   end

# #   def unsubscribe
# #   end

#  private
#   def customer_params
#     params.require(:customer).permit(:profile_image, :name, :name_kana, :postal_code, :address, :telephone_number, :email)
#   end
# end



# class Admin::ItemsController < ApplicationController

#   def new
#   @item = Item.new
#   end

#   def create
#   @item = Item.new(item_params)
#   @item.save
#   redirect_to admin_item_path(@item.id)
#   end

#   def index
#   @items = Item.all
#   @items = Item.page(params[:page]).per(10)
#   @genres = Genre.all
#   end

#   def show
#   @post_image = PostImage.new
#   @item = Item.find(params[:id])
#   @items = Item.all
#   end

#   def edit
#     @item = Item.find(params[:id])
#   end

#   def update
#     @item = Item.find(params[:id])
#     @item.update(item_params)
#     redirect_to admin_item_path(@item.id)
#   end

#   private

#   def item_params
#     params.require(:item).permit(:name, :introduction, :price, :is_active, :profile_image, :genre_id)
#   end

#   def genre_params
#     params.require(:genre).permit(:name)
#   end

#   end
