class Director < ApplicationRecord
  has_many :movies

  def self.alphabetically
    order(:name)
  end
end