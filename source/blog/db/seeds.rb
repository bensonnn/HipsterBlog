require 'faker'

# Post.create(title: "The first post!", body: "Some content..........................")
# Post.create(title: "Another One!", body: "here we go.")
# Post.create(title: "The last sample!", body: "Other stuff?")

# Post.find(1).tags << Tag.create(name: "DBC")
# Post.find(2).tags << Tag.create(name: "Chicago")
# Post.find(3).tags << Tag.create(name: "Lunch")

# Tag.create(name: "otters").posts << Post.find(1)

50.times do 
  title = Faker::Lorem.words.sample(2).join(' ')
  body = Faker::Lorem.paragraphs(paragraph_count = 3).join("\n")
  Post.create(title: title, body: body)
end

10.times do 
 Tag.create(name: Faker::Lorem.words.sample)
end


Post.all.each do |post|
    post.tags = Tag.all.sample(rand(11))
end
  
