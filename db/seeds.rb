# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

WEIGHTS = {
  'August 16, 5:41am' => 2540,
  'August 23, 9:30am' => 2540
}

WEIGHTS.each do |time, weight|
  WeighIn.where(weigh_time: Time.parse(time), weight: weight).first_or_create!
end
