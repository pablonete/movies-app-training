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
    movie = Movie.new(movie_params)
    if movie.valid?
      movie.save
      redirect_to movie
    else
      render "new", locals: { movie: movie }
      # TODO Show movie.errors.full_messages
    end
  end

  def edit
    render locals: { movie: Movie.find(params["id"]) }
  end

  def update
    movie = Movie.find(params["id"])
    
    if movie.update(movie_params)
      movie.save
      redirect_to movie
    else
      render "edit", locals: { movie: movie }
      # TODO Show movie.errors.full_messages
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :director_id, :year)
  end
end