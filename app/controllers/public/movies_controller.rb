class Public::MoviesController < ApplicationController
  require 'ostruct'
  require 'themoviedb-api'
  Tmdb::Api.key("0710fca52ffb53cb379f38e8f53fcce6")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    @post_comment = PostComment.new
    # @movie = Tmdb::Search.movie()
    # moviedata = Tmdb::Collection.detail(10)
    # pp moviedata
  end

  def create
    @post_comment = PostComment.find(params[:post_comment])
    # comment = current_customer.post_comments.new(post_comment_params)
    comment = PostComment.new(post_comment_params)
    # comment.customer_id = current_customer.id
    # comment.post_comment_id = post_image.id
    comment.save
    redirect_to customer_path(current_customer.id)
  end

  def index
    @moviedata = Tmdb::Search.movie("Harry")
    pp @moviedata
  end

  def review
    @review = PostComment.where(movie_id: params[:id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment, :customer_id, :movie_id)
  end

end