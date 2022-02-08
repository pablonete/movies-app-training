require "application_system_test_case"

class MoviesSystemTest < ApplicationSystemTestCase
  test "visiting the show" do
    visit "/movies/1"

    assert_text "Parasite"
    assert_text "Bong Joon-ho"
  end

  test "visiting the show for a different movie" do
    # As a user,
    # When I visit a movie with the id of 2,
    # I see the title for that movie

    visit movie_path(2)
    assert_text "Other Movie"
  end
end
