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

30.times do
    Exercise.create(
        name: Faker::FunnyName.name,
        exercise_type: "strength",
        equipment: "none"
    ) 
end

10.times do
    Workout.create(
        title: Faker::FunnyName.name,
        difficulty: 10,
        minutes: 50
    )
end