//= require jquery
//= require jquery_ujs
// require_tree .
//= require validations
//= require jquery.tokeninput
//= require_self

var support = {
	placeholder: (function () {
		var i = document.createElement('input');
    	return 'placeholder' in i;
	})
};

$(function() {
 	$('input[type="text"]#post_tag_tokens').tokenInput('/tags.json', {
		crossDomain: false,
		preventDuplicates: true,
		hintText: $('#post_tag_tokens').data('hint'),

	}); 

	// progressively enhance placeholders
	if(support.placeholder) {
		$(".placeholder").each(function () {
			var p = $(this).parent();

			// remove the <div> container as well as the label
			if(p.hasClass("field_with_errors"))
				p.remove();
			else
				$(this).remove();
		});
		$("body").addClass('placeholders'); // needed?
	} 


});
