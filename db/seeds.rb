# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.free_email,
        password: "password"
    )
end

15.times do
    Exercise.create(
        name: Faker::FunnyName.name,
        exercise_type: "strength",
        equipment: "Weights",
        description: Faker::Quote.famous_last_words
    ) 
end

15.times do
    Exercise.create(
        name: Faker::FunnyName.name,
        exercise_type: "Aerobic",
        equipment: "None",
        description: Faker::Quote.famous_last_words
    ) 
end

5.times do
    Workout.create(
        title: Faker::FunnyName.name,
        difficulty: "hard",
        minutes: 50,
        workout_type: "strength",
        user_id: 4
    )
end

5.times do
    Workout.create(
        title: Faker::FunnyName.name,
        difficulty: "easy",
        minutes: 30,
        workout_type: "Aerobic",
        user_id: 5
    )
end