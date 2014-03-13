class Tag < ActiveRecord::Base
  # Remember to create a migration!
  has_and_belongs_to_many :posts

  #assuming tags is a space separated string
  def self.return_tag_objects(string)
    string.downcase.split(' ').map{ |tag| Tag.where(name: tag).first_or_create }
  end

  def self.active
    Tag.all.select { |tag| tag.posts.count > 0 }
  end

end
