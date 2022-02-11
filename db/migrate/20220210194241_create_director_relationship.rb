class CreateDirectorRelationship < ActiveRecord::Migration[6.0]
  def change
    add_reference :movies, :director, foreign_key: true

    names = Movie.all.pluck(:director).uniq
    directors_by_name = {}
    names.each do |name|
      directors_by_name[name] = Director.create(name: name)
    end

    Movie.all.each do |movie|
      movie.director_id = directors_by_name[movie.director].id
      movie.save
    end

    remove_column :movies, :director
  end
end
