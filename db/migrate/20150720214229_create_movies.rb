class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :thumbnail
      t.string :url
      t.date :release_date

      t.timestamps null: false
    end
  end
end
