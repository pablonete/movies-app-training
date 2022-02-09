require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    movie = Movie.create!(title: "Parasite", director: "Bong Joon-ho")
    visit movie_path(movie.id)

    assert_text "Parasite"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show for a different movie" do
    movie = Movie.create!(title: "Titanic", director: "James Cameron")
    visit movie_path(movie.id)

    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "visiting the index page" do
    Movie.create!(title: "Parasite", director: "Bong Joon-ho")
    Movie.create!(title: "Titanic", director: "James Cameron")

    visit movies_path

    assert_text "Parasite"
    assert_text "Bong Joon-ho"
    assert_text "Titanic"
    assert_text "James Cameron"
  end

  test "adding a new movie" do
    visit movies_path

    assert_button "Add new movie"
    click_on "Add new movie"
    
    assert_current_path new_movie_path
    assert_selector "form.new_movie"
  end
end
