
parser_options = {
	:autolink => true, 
	:no_intra_emphasis => true, 
	:tables => true,
	:superscript => true
}

renderer_options = {
	:hard_wrap => true,
}

::PostsRenderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(renderer_options), parser_options)