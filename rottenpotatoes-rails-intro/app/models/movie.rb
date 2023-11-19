# app/models/movie.rb
class Movie < ActiveRecord::Base
  def self.all_ratings
    # Devuelve un array con todas las clasificaciones posibles
    ['G', 'PG', 'PG-13', 'R']
  end
end

