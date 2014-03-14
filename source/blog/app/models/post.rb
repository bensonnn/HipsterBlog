class Post < ActiveRecord::Base
   has_and_belongs_to_many :tags
  # Remember to create a migration!

  # def stuff(tag)
  #   #tag = :a
  #   #tags = [:a,:b,:c]
  #   included = tags.include?(tag)
  #   Post.where(included)
  # end
end


