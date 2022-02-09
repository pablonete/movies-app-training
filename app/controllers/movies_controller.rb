class MoviesController < ApplicationController
  def index
    render locals: { movies: Movie.take(10) }
  end

  def show
    render locals: { movie: Movie.find(params["id"]) }
  end
end