class Movie < ActiveRecord::Base
  attr_accessible :length, :name, :plot, :plot_summary, :plot_synopsis, :poster_url, :rating, :tagline, :trailer_url, :votes, :year
end
