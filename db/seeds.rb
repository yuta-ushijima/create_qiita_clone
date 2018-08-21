require 'faker'

puts "Now Creating User...."

# seeds of User
100.times do |user|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password(8)

  User.create!(
    first_name: first_name,
    last_name: last_name,
    email: email,
    password: password,
  )
end
puts "Complete!"

puts "Now Creating Article...."

# seeds of Article
100.times do |article|
  title = Faker::Markdown.headers
  body = Faker::Markdown.sandwich(5, 3)

  Article.create!(body: body, title: title, user_id: rand(1..100))
end

puts "Complete!"