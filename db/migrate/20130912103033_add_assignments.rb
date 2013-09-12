class AddAssignments < ActiveRecord::Migration
  def change
    create_table :movie_genre_assignments do |t|
      t.integer :movie_id
      t.integer :genre_id

      t.timestamps
    end

    create_table :movie_person_assignments do |t|
      t.integer :movie_id
      t.integer :person_id
      t.integer :type

      t.timestamps
    end
  end
end
