require 'faker'

# Create posts
50.times do
  Post.create!(
    title:  Faker::Lorem.sentence,
    body:   Faker::Lorem.paragraph
    )
end
posts = Post.all
#Post.create(title: "Jeff's first post", body: "Go Bulls!")


# Create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end
1.times do
  Comment.create!(post: "Jeff's first comment", body: "Go Warriors!")
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
