class MoviePersonAssignment < ActiveRecord::Base
  attr_accessible :movie_id, :person_id, :assignment_type

  belongs_to :movie
  belongs_to :person

  TYPE_CAST_MEMBER = 1
  TYPE_DIRECTOR = 2
end
