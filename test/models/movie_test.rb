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

  test 'list movie titles' do
    Movie.create!(title: "Movie1")
    Movie.create!(title: "Movie2")

    assert_equal ["Movie1", "Movie2"], Movie.titles
  end

  test 'sort movies by likes' do
    a = Movie.create!(title: "a", facebook_likes: 100)
    c = Movie.create!(title: "c", facebook_likes: 3)
    b = Movie.create!(title: "b", facebook_likes: 20)

    assert_equal [a, b, c], Movie.sort_by_likes
  end

  test 'get year by movie title' do
    Movie.create!(title: "Interstellar", year: "2018")
    
    assert_equal "2018", Movie.year_by_title("Interstellar")

    assert_nil Movie.year_by_title("unknown title")
  end

  test 'get movies with more than certain likes' do
    a = Movie.create!(title: "a", facebook_likes: 100)
    c = Movie.create!(title: "c", facebook_likes: 3)
    b = Movie.create!(title: "b", facebook_likes: 20)

    assert_equal 1, Movie.count_above_likes(20)
  end
end
