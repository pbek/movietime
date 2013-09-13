class RenameTypeToAssignmentTypeInMoviePersonAssignments < ActiveRecord::Migration
  def change
  	rename_column :movie_person_assignments, :type, :assignment_type
  end
end
