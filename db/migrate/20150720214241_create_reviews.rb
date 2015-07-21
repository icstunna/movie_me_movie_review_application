class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :email
      t.text :content
      t.integer :score
      t.belongs_to :movie

      t.timestamps null: false
    end
  end
end
