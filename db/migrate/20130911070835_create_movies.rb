class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :rating
      t.integer :votes
      t.integer :length
      t.string :trailer_url
      t.text :plot
      t.text :plot_synopsis
      t.text :plot_summary
      t.string :poster_url
      t.string :tagline
      t.integer :year

      t.timestamps
    end
  end
end
