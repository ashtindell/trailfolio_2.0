class CreateExcursions < ActiveRecord::Migration
  def change
    create_table :excursions do |t|
        t.string :name
        t.string :city
        t.string :state
        t.text :description
        t.float :price
        t.integer :difficulty
        t.string :duration
        t.boolean :kid_friendly
        t.boolean :dog_friendly
        t.string :seasonality
        t.string :hashtag
        t.integer :user_id

        t.timestamps null: false
    end

    add_index :excursions, :user_id
  end
end
