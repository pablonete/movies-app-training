class MoviesController < ApplicationController
  def show
    render locals: { movie: Movie.find(params["id"]) }
  end
end