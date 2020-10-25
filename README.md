# Work It Out

This is an application that allows a user to create a workout and exercises and to add the exercises to the workout.

Key Features: 

- Account creation/User creation/User Authentication/Facebook Login
- Creating Workouts by title, difficulty, minutes, and workout type.
- Users can view other users workouts, and all exercises.  
- Create Exercises by themselves or directly attached to the user Workout.   
- Assign Exercises to Workouts, and add repetitions and set counts. 
- Account management and deletion
- Management and deletion of Exercises and Workouts.  

## Installation & Usage - Assumes Rails is installed on your computer
1. Clone this repository;
2. From the local directory you cloned this repository to, type ```bundle install``` to install the required gems.  
3. From the command line type ```rails s``` and navigate to [http://localhost:3030/](http://localhost:3030/).
4. Create a new user, or login via facebook and enjoy!  

## Development

After checking out the repo, run bin/setup to install dependencies. Then, run rake spec to run the tests. You can also run bin/console for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run bundle exec rake install. To release a new version, update the version number in version.rb, and then run bundle exec rake release, which will create a git tag for the version, push git commits and tags, and push the .gem file to rubygems.org.

## License

The gem is available as open source under the terms of the MIT License.

## Code of Conduct

Everyone interacting in C0mbed codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/C0mbed/vehicle_base/blob/master/CODE_OF_CONDUCT.md).
