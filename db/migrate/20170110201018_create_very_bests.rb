class CreateVeryBests < ActiveRecord::Migration
  def change
    create_table :very_bests do |t|
      t.integer :food_id
      t.integer :venue_id
      t.integer :user_id

      t.timestamps

    end
  end
end
