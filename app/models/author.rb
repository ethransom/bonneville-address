class Author < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name, :position
end
