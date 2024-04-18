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
  image_url: 'https://img.freepik.com/free-vector/cute-cat-face-logo-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-flat-vector_138676-9478.jpg?w=360'
)
bunny = User.create!(
  email: 'bunny@email.com',
  password: '123123',
  display_name: 'Bunny',
  image_url: 'https://img.freepik.com/free-vector/cute-rabbit-holding-carrot-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated_138676-5071.jpg?w=360'
)
doggy = User.create!(
  email: 'doggy@email.com',
  password: '123123',
  display_name: 'Doggy',
  image_url: 'https://img.freepik.com/free-vector/happy-shiba-inu-dog-japan-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium-vector-flat-cartoon-style_138676-3650.jpg?w=360'
)
sloth = User.create!(
  email: 'sloth@email.com',
  password: '123123',
  display_name: 'Sloth',
  image_url: 'https://img.freepik.com/free-vector/cute-sloth-sleeping-cartoon-vector-icon-illustration-animal-nature-icon-concept-isolated-premium_138676-6479.jpg?w=360'
)
users = User.all
puts "Users created!"

puts 'Creating channels...'
channel = Channel.create!(name: 'Purrfect Paws', user: kitty)
Channel.create!(name: 'No nap no life', user: sloth)
Channel.create!(name: 'Hopping friends', user: bunny)
Channel.create!(name: 'Goodest bois and gurls', user: doggy)
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
                    Faker::TvShows::Friends.quote
                  when bunny
                    Faker::TvShows::BrooklynNineNine.quote
                  else
                    Faker::TvShows::Spongebob.quote
                  end
  )
end
puts 'Posts created!'

puts 'Seed finished!'
