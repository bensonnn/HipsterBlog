Tag.destroy_all
Post.destroy_all
Word.destroy_all
User.destroy_all

posts = Array.new(5) { Post.create(title: Hipster.sentence.capitalize, body: Hipster.paragraph) }

tags = Array.new(20) { Tag.create(name: Hipster.words.last) }

tags.each do |tag|
  tag.posts << posts.sample << posts.sample
end

require 'csv'
File.new("db/words.txt", "r").each do |file|
  file.split(" ").each do |word|
    Word.create(word: word.downcase)
  end
end

User.create(username: 'tonyta') {|user| user.password = '1234'}
User.create(username: 'dannybenson') {|user| user.password = '4321'}

user_ids = User.all.map(&:id)
Post.all.each do |post|
  post.update(user_id: user_ids.sample)
end

