require "faker"

# seeds of User
100.times do |user|
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  email = Faker::Internet.email
  password = Faker::Internet.password(8)

  User.seed do |s|
    s.first_name = first_name
    s.last_name = last_name
    s.email = email
    s.password = password
  end
  user # rubocopに怒られるので、timesメソッドのブロック引数を明示的に設置
end
