class Post < ActiveRecord::Base
	validates :title, :presence => true, :length => {:minimum => 5}

	belongs_to :author
	belongs_to :section
	
	extend FriendlyId
	friendly_id :title, use: :slugged	

	def blurb
		self.content.truncate(500, :separator => ' ')
	end

	def short_preview
		self.content.truncate(50, :separator => ' ')
	end
	
	private 
	
	# TODO: FIIIIIIIX!
	def to_markdown
		
	end
end
