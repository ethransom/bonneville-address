class Section < ActiveRecord::Base
  has_many :posts

  extend FriendlyId
  friendly_id :name, use: :slugged

  def recent_posts num
    posts.order("created_at DESC").limit(3)
  end
end
