5.times do
  user = User.create(
    name: Faker::Games::LeagueOfLegends.champion,
    email: Faker::Internet.email,
    password: 'pass',
    password_confirmation: 'pass'
  )
end

User.limit(20).each do |user|
  article = user.articles.create(
    body: Faker::Games::LeagueOfLegends.quote,
    title: Faker::Game.title
  )
end
