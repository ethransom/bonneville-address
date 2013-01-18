# TODO: extract?

class PurdyFormBuilder < ActionView::Helpers::FormBuilder
  def text_field(sym, text, *args)
    options = args.extract_options!
    options.merge!({ :placeholder => text })

    purdy_field(sym, text) do
      super sym, *[options]
    end
  end

  def text_area(sym, text, *args)
    options = args.extract_options!
    options.merge!({ :placeholder => text })

    purdy_field(sym, text) do 
      super sym, *[options]
    end
  end

  def password_field(sym, text, *args)
    options = args.extract_options!
    options.merge!({ :placeholder => text })

    purdy_field(sym, text) do
      super sym, *[options]
    end
  end

  def error
    if !@object.nil? && @object.errors.any?
      @template.content_tag("div", "There were some errors with your information", :class => "form_error").html_safe
    end
  end

  private

  def purdy_field(sym, text)
    html = ""

    html << label(sym, text, :class => "placeholder")
    html << yield
    unless @object.errors[sym].empty?
      html << @template.content_tag("span", :class => "field-error") do
        @object.errors[sym].first
      end
    end

    html = @template.content_tag("div", :class => "field") { @template.raw html }

    html.html_safe
  end
end