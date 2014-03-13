Post.destroy_all

5.times do
  Post.create(title: Hipster.sentence.capitalize, body: Hipster.paragraph)
end
