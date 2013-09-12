class Genre < ActiveRecord::Base
  attr_accessible :name

  has_many :movie_genre_assignments, :dependent => :destroy
  has_many :movies, :through => :movie_genre_assignments
end
