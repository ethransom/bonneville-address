(function ($) {
	window.onload = function() {
		$('.placeholder').each(function(current) {
			$(this).data('placeholder',$(this).val() ).addClass('input-passive');
		}).bind('focus',function() {
			if ($(this).data('placeholder')==$(this).val())
				$(this).removeClass('input-passive').val('');
		}).bind('blur',function() {
			if($(this).val()=='') {
				$(this).val($(this).data('placeholder')).addClass('input-passive');
			}
		});
	});


	$.fn.isDefault = function() {
		return ( this.val()==this.data('placeholder') );
	}
})( jQuery );