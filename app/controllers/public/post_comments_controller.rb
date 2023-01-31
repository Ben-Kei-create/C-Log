class Public::PostCommentsController < ApplicationController


  def new
    @post_comment = PostComment.new
  end

  def create
    # post_image = PostImage.find(params[:post_image_id])
    # comment = current_user.post_comments.new(post_comment_params)
    # comment.post_image_id = post_image.id
    # comment.save
    # redirect_to post_image_path(post_image)
  end

  private

  def post_comments_params
    params.require(:post_comment).permit(:comment, :customer_id, :movie_id)
  end

end
