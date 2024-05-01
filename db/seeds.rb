# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Cleaning DB...'
User.destroy_all
puts 'DB cleaned!'

puts 'Creating users...'
kitty = User.create!(
  email: 'Kitty@email.com',
  password: '123123',
  display_name: 'Kitty',
  image_url: 'https://img.freepik.com/free-vector/cute-cat-sitting-pizza-cartoon-vector-icon-illustration-animal-food-icon-concept-isolated-flat_138676-9558.jpg?w=240'
)
bunny = User.create!(
  email: 'bunny@email.com',
  password: '123123',
  display_name: 'Bunny',
  image_url: 'https://img.freepik.com/free-vector/cute-rabbit-holding-carrot-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5071.jpg?w=240'
)
doggy = User.create!(
  email: 'doggo@email.com',
  password: '123123',
  display_name: 'Doggo',
  image_url: 'https://img.freepik.com/free-vector/cute-husky-dog-sitting-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-4567.jpg?w=240'
)
foxy = User.create!(
  email: 'foxy@email.com',
  password: '123123',
  display_name: 'foxy',
  image_url: 'https://img.freepik.com/free-vector/cute-fox-sitting-with-scarf-autumn-cartoon-icon-illustration-animal-nature-icon-isolated-flat-cartoon-style_138676-3115.jpg?w=240'
)
users = User.all
puts "Users created!"

puts 'Creating channels...'
channel = Channel.create!(name: 'Purrfect Paws', user: kitty)
Channel.create!(name: 'No nap no life', user: foxy)
Channel.create!(name: 'Hoppy Hour', user: bunny)
Channel.create!(name: 'Wooftube', user: doggy)
Channel.create!(name: 'Goodest bois and gurls', user: users.sample)
Channel.create!(name: 'Pawsome tales', user: users.sample)
Channel.create!(name: 'Snuggle squat', user: users.sample)
Channel.create!(name: 'Paws and Pause', user: users.sample)
puts "Channels created!"

puts 'Creating memberships...'
users.each { |u| Membership.create!(channel:, user: u) unless u == channel.user }
puts 'Memberships created!'

puts 'Creating posts...'
30.times do
  user = users.sample
  Post.create(
    user:,
    postable: channel,
    content: case user
             when kitty
               Faker::TvShows::BigBangTheory.quote
             when doggy
               Faker::JapaneseMedia::StudioGhibli.quote
             when bunny
               Faker::Movies::HarryPotter.quote
             else
               Faker::Movies::StarWars.quote
             end
  )
end
post = Post.all.sample
5.times do
  user = users.sample
  Post.create(
    user:,
    postable: post,
    content: Faker::Movie.quote
  )
end
puts 'Posts created!'

puts 'Seed finished!'
