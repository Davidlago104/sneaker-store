class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.boolean :recommendation
      t.string :title
      t.string :thoughts
      t.belongs_to :user, foreign_key: true
      t.belongs_to :sneakers, foreign_key: true

      t.timestamps
    end
  end
end
