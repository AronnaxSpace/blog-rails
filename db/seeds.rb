require "ffaker"

5.times do |i|
  User.create(
    email: "user_#{i}@aronnax.space",
    password: "Pa$$w0rD1"
  )
end

10.times do
  Post.create(
    title: FFaker::Lorem.sentence,
    content: FFaker::Lorem.paragraph
  )
end
