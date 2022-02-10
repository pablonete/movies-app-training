class MoviesController < ApplicationController
  def index
    render locals: { movies: Movie.take(10) }
  end

  def show
    render locals: { movie: Movie.find(params["id"]) }
  end

  def new
    render locals: { movie: Movie.new }
  end

  def create
    movie_params = params.require(:movie).permit(:title, :director, :year)
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to movie
    else
      render "new", locals: { movie: movie }
      # TODO Show movie.errors.full_messages
    end
  end
end