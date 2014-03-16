class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user

  before_save :set_hipster_rating

  validates :body, :presence => true
  validates :title, :presence => true

  private
  def set_hipster_rating
    self.rating = HipsterRater::Post.hipness(self.body)
  end
end
