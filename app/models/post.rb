class Post < ActiveRecord::Base
	validates :title, :presence => true, :length => {:minimum => 5}
	validates_presence_of :content, :author

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

	def publish_date
		created_at.strftime("%A, %B #{created_at.day.ordinalize}")
	end
	
	# TODO: Extract into separate renderer file
	class HTMLWithPants < Redcarpet::Render::XHTML
	  include Redcarpet::Render::SmartyPants
	end

	def content_html
		markdown = Redcarpet::Markdown.new(HTMLWithPants, 
			:autolink => true, 
			:no_intra_emphasis => true
		)
		markdown.render(content).html_safe
	end
end
