User.create!(
  name: "Example User",
  email: "example@user.com",
  password: "password",
  password_confirmation: "password",
  admin: true,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@user.com"
  password = "PassWord"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
end

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content)}
end

users = User.all
user1 = User.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user1.follow(followed) }
followers.each { |follower| follower.follow(user1) }