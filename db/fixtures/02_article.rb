require "faker"

# seeds of Article

100.times do |article|
  title = Faker::Markdown.headers
  body = Faker::Markdown.sandwich(5, 3)

  Article.seed do |s|
    s.body = body
    s.title = title
    s.user_id = rand(1..100)
  end
  article # rubocopに怒られるので、timesメソッドのブロック引数を明示的に設置
end
