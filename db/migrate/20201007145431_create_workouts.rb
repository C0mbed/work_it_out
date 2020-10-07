class CreateWorkouts < ActiveRecord::Migration[6.0]
  def change
    create_table :workouts do |t|
      t.string :title
      t.string :difficulty
      t.integer :minutes
      t.string :workout_type
      t.integer :likes
      t.integer :user_id

      t.timestamps
    end
  end
end
