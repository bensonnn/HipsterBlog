class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_and_belongs_to_many :posts

  #assuming tags is a space separated string
  # def tags=(tags)
  #   tags.split(' ').map{ |tag| Tag.create(name: tag) }
  # end

end
