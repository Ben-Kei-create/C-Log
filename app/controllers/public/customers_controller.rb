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