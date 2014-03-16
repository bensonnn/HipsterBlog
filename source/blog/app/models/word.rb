class Word < ActiveRecord::Base
  # Remember to create a migration!
  validate :word, uniqueness: true
end
