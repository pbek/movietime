class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :name
      t.text :description
      t.string :path

      t.timestamps
    end
  end
end
