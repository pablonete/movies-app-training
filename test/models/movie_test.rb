require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test 'movie is valid with a title' do
    movie = build(:movie, title: "Parasite", director: "Bong Joon-ho")
    assert_equal movie.title, "Parasite"
    assert_equal movie.director, "Bong Joon-ho"
  end

  test 'movie requires a title that is not whitespaces' do
    movie = build(:movie, title: " ")
    refute_predicate movie, :valid?
  end

  test 'movie requires a title' do
    movie = build(:movie, title: nil, director: "Test")
    refute_predicate movie, :valid?
  end

  test 'list movie titles' do
    create(:movie, title: "Movie1")
    create(:movie, title: "Movie2")

    assert_equal ["Movie1", "Movie2"], Movie.titles
  end

  test 'sort movies by likes' do
    a = create(:movie, title: "a", facebook_likes: 100)
    c = create(:movie, title: "c", facebook_likes: 3)
    b = create(:movie, title: "b", facebook_likes: 20)

    assert_equal [a, b, c], Movie.sort_by_likes
  end

  test 'get year by movie title' do
    create(:movie, title: "Interstellar", year: "2018")
    
    assert_equal "2018", Movie.year_by_title("Interstellar")

    assert_nil Movie.year_by_title("unknown title")
  end

  test 'get movies with more than certain likes' do
    a = create(:movie, facebook_likes: 100)
    c = create(:movie, facebook_likes: 3)
    b = create(:movie, facebook_likes: 20)

    assert_equal 1, Movie.count_above_likes(20)
  end

  test 'we can create a movie with a factory' do
    assert_predicate create(:movie), :valid?
  end
end
