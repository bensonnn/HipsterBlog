class User < ActiveRecord::Base
  has_many :posts
  attr_accessor :password
  @password = nil

  before_create :salt_and_hash

  def authenticate(password)
    self.hashword == PasswordHasher.get_hash( password , self.salt )
  end

  private
  def salt_and_hash
    self.salt = PasswordHasher.new_salt
    self.hashword = PasswordHasher.get_hash( @password , self.salt )
    @password = nil
  end
end

