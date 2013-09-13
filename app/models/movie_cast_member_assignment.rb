class MovieCastMemberAssignment < ActiveRecord::Base
  attr_accessible :movie_id, :cast_member_id

  belongs_to :movie
  belongs_to :cast_member
end
