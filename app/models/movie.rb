class Movie < ApplicationRecord
  validates :title, presence: true

  # Make a method that returns an array of just movie titles.
  def self.titles
    Movie.pluck(:title)
  end

  # Make a method that returns all movies in order of most to least Facebook likes.
  def self.sort_by_likes
    Movie.order(facebook_likes: :desc)
  end

  # Make a method that can find a movie by its title, and tell you what year it was released.
  def self.year_by_title(title)
    Movie.find_by(title: title)&.year
  end

  # Make a method that returns the number of movies in the database with more than a given number of Facebook likes
  def self.more_likes(likes)
    # Movie.where(facebook_likes: (likes + 1)..)
    Movie.where("facebook_likes > ?", likes)
  end
end