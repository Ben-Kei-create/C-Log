class Public::MoviesController < ApplicationController
  require 'ostruct'
  require 'themoviedb-api'
  Tmdb::Api.key("0710fca52ffb53cb379f38e8f53fcce6")
  Tmdb::Api.language("ja") # こちらで映画情報の表示の際の言語設定を日本語にできます

  # def search
  # end

  def show
    @movie = Tmdb::Movie.detail(params[:id])
    # @movie = Tmdb::Search.movie()
    # moviedata = Tmdb::Collection.detail(10)
    # pp moviedata
  end

  def index
    @moviedata = Tmdb::Search.movie("Harry")
    pp @moviedata
  end
end