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

    fill_in :movie_title, with: "Drop Dead Fred"
    fill_in :movie_director, with: "James Cameron"
    fill_in :movie_year, with: 1997

    click_on "Create"

    # TODO assert_current_path "/movies/"
    assert_selector "h1", text: "Drop Dead Fred"
    assert_text "James Cameron"
  end

  test "cannot add a new movie without title" do
    visit new_movie_path

    click_on "Create"

    # It should fail and stay on the form page
    assert_selector "form.new_movie"
  end

  test "editing a new movie" do
    movie = Movie.create(title: "A Movie To Edit")

    visit movie_path(movie.id)

    click_on "Edit Movie"

    assert_selector "form.edit_movie"

    fill_in "Title", with: "Edited Movie"

    click_on "Update"

    assert_text "Edited Movie"
  end
end
