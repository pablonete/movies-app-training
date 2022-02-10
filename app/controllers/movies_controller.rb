class MoviesController < ApplicationController
  def index
    render locals: { movies: Movie.take(10) }
  end

  def show
    render locals: { movie: Movie.find(params["id"]) }
  end

  def new
    render "form", locals: { movie: Movie.new }
  end

  def create
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to movie
    else
      render "form", locals: { movie: movie }
      # TODO Show movie.errors.full_messages
    end
  end

  def edit
    render "form", locals: { movie: Movie.find(params["id"]) }
  end

  def update
    movie = Movie.find(params["id"])
    movie.update_attributes(movie_params)
    if movie.valid?
      movie.save
      redirect_to movie
    else
      render "form", locals: { movie: movie }
      # TODO Show movie.errors.full_messages
    end
  end

  private
  
  def movie_params
    params.require(:movie).permit(:title, :director, :year)
  end
end