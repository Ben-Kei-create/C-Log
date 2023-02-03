class Public::PostCommentsController < ApplicationController



  def create
    comment = PostComment.new(post_comments_params)
    comment.customer_id = current_customer.id
    comment.movie_id = params[:movie_id]
    comment.save
    redirect_to customer_path(current_customer.id)
  end

  def index

  end

  private

  def post_comments_params
    params.require(:post_comment).permit(:comment, :customer_id, :movie_id)
  end

end
