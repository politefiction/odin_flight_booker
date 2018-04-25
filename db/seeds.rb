# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

6.times do
    Airport.create(name: Array.new(3){ [*"A".."Z"].sample }.join)
end

50.times do
    time = rand(Time.now..2.weeks.from_now)
    Flight.create(
        departure: time, 
        arrival: (time + 3.hours), 
        from_airport: Airport.find(rand(1..3)), 
        to_airport: Airport.find(rand(4..6))
    )
end

