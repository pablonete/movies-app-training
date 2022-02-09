class MoviesController < ApplicationController
  def index
    render locals: { movies: Movie.take(10) }
  end

  def show
    render locals: { movie: Movie.find(params["id"]) }
  end

  def create
    movie_params = params.require(:movie).permit(:title, :director, :year)
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to movie
    else
      # TODO Show movie.errors.error_messages
      redirect_to new_movie_path 
    end
  end
end