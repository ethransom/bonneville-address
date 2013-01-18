
parser_options = {
	:autolink => true, 
	:no_intra_emphasis => true, 
	:superscript => true
}

renderer_options = {
	:hard_wrap => true,

	# I'm afraid there's no HTML in comments
	:filter_html => true, 
}

::CommentsRenderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderer_options), parser_options)