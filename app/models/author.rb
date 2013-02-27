class Author < ActiveRecord::Base
  has_many :posts

  validates_presence_of :name, :position

  extend FriendlyId
  friendly_id :name, use: :slugged

  def blurb_preview
    self.blurb.truncate(50, :separator => ' ') if blurb?
  end

  def blurb_html
    markdown = Redcarpet::Markdown.new Redcarpet::Render::XHTML, :autolink => true, :no_intra_emphasis => true
    markdown.render(blurb).html_safe
  end
end
