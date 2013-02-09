module ApplicationHelper
	def render_markdown(text)
		# html = Redcarpet.new(text, *options).to_html.html_safe
		#syntax_highlight(html).html_safe

		::PostsRenderer.render(text).html_safe
	end
	
	def syntax_highlight(html)
		doc = Nokogiri::HTML(html)
		doc.search("//pre[@lang]").each do |pre|
			pre.replace Albino.colorize(pre.text.rstrip, pre[:lang])
		end
		doc.to_s
	end

	# base form thingamahoosit
	def purdy_form_for(name, *args, &block)
	    options = args.extract_options!
	 
		form_for(name, *(args << options.merge(:builder => PurdyFormBuilder)), &block )
	end

	def page_title
		name = "The Wasatch Gecko"
		if content_for? :title
			name << " | "
			name << content_for(:title)
		end

		name
	end
end