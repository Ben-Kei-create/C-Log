class Public::MoviesController < ApplicationController
  require 'ostruct'
  require 'themoviedb-api'
  Tmdb::Api.key("0710fca52ffb53cb379f38e8f53fcce6")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    # @movie = Tmdb::Search.movie()
    # moviedata = Tmdb::Collection.detail(10)
    # pp moviedata
    @post_comment = PostComment.new
  end

  def create
    
    redirect_to customer_path(:id)
  end

  def index
    @moviedata = Tmdb::Search.movie("Harry")
    pp @moviedata
  end

  def post_comments_params
    params.require(:post_comment).permit(:comment, :customer_id, :movie_id)
  end

end