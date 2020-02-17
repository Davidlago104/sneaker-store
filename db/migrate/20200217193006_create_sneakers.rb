class CreateSneakers < ActiveRecord::Migration[5.2]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.belongs_to :brand, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
