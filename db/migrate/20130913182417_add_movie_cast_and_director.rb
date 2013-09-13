class AddMovieCastAndDirector < ActiveRecord::Migration
  def change
    create_table :cast_members do |t|
      t.string :name

      t.timestamps
    end

    create_table :directors do |t|
      t.string :name

      t.timestamps
    end

    create_table :movie_cast_member_assignments do |t|
      t.integer :movie_id
      t.integer :cast_member_id

      t.timestamps
    end

    add_column :movies, :director_id, :integer

    drop_table :movie_person_assignments
    drop_table :people
  end
end
