class Category < ActiveRecord::Base
  has_many :posts
  validates :name, uniqueness: true
  # Remember to create a migration!
end
