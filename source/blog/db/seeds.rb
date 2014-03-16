Tag.destroy_all
Post.destroy_all

posts = Array.new(5) { Post.create(title: Hipster.sentence.capitalize, body: Hipster.paragraph) }

tags = Array.new(20) { Tag.create(name: Hipster.words.last) }

tags.each do |tag|
  tag.posts << posts.sample << posts.sample
end
