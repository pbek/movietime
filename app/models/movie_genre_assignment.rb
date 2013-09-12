class MovieGenreAssignment < ActiveRecord::Base
  attr_accessible :movie_id, :genre_id

  belongs_to :movie
  belongs_to :genre
end
