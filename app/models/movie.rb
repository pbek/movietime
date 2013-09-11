class Movie < ActiveRecord::Base
  attr_accessible :imdb_id, :directory_name, :source_id, :length, :name, :plot, :plot_summary, :plot_synopsis, :poster_url, :rating, :tagline, :trailer_url, :votes, :year

  belongs_to :source

  validates :name,
    :presence => true
end
