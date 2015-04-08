require 'faker'

 # Create Posts
 50.times do
   Post.create!(
     title:  Faker::Lorem.sentence,
     body:   Faker::Lorem.paragraph
   )
 end
 posts = Post.all
 
 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: Faker::Lorem.paragraph
   )
 end
 
# Assignment
if !Post.exists?(title: "unique post")
  Post.create!(
      title: "unique post",
      body: "this data should be idempotent"
    )
end

# Assignment
if !Comment.exists?(body: "unique comment")
  Comment.create!(
      post: Post.find_by_title("unique post"),
      body: "unique comment"
    )
end


 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"