class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :difficulty
      t.integer :minutes
      t.string :type
      t.integer :likes

      t.timestamps
    end
  end
end
