class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :food_id
      t.string :location

      t.timestamps

    end
  end
end
