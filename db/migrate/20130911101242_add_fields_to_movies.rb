class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :folder_name, :string
    add_column :movies, :source_id, :integer
  end
end
