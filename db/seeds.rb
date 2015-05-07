require 'faker'

# Create posts
#50.times do
  #Post.create!(
    #title:  Faker::Lorem.sentence,
    #body:   Faker::Lorem.paragraph
   # )
#end
#posts = Post.all

# Create comments
#100.times do
  #Comment.create!(
    #post: posts.sample,
    #body: Faker::Lorem.paragraph
    #)
#end

# Create ads
10.times do
  Advertisement.create!(
    title:  Faker::Company.name,
    price:  Faker::Number.number(3)
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Advertisement.count} ads created"