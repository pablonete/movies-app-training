require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'movie is valid with a title' do
    movie = Movie.new(title: "Parasite", director: "Bong Joon-ho")
    assert_equal movie.title, "Parasite"
    assert_equal movie.director, "Bong Joon-ho"
  end

  test 'movie requires a title that is not whitespaces' do
    movie = Movie.new(title: " ")
    refute_predicate movie, :valid?
  end

  test 'movie requires a title' do
    movie = Movie.new(director: "Test")
    refute_predicate movie, :valid?
  end
end