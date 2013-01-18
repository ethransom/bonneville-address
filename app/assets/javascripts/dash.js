$(function() {


	$("#send").click( function() {
		$.ajax({
			url: $("#to").val(),
			data: 	$("#stuff").val() ,
			success: function(data) {
				$('#result').html(data);
				$("#notices").append("Success! <br />");
			},
			failure: function() {
				$("#notices").append("Failure.  <br />");
			},
			type: 	$("#with").val()
		});
	});
	$("#notices").append("Good to Go <br />");
	$("#convert").click(function() {
		$("#escaped").val( escape( $("#escapee").val() ) );
	});
	
	$(document).ajaxSend(function(event, request, settings) {
    if ( settings.type.toLowerCase() == 'post' ) {
        settings.data = (settings.data ? settings.data + "&" : "")
                + "authenticity_token=" + encodeURIComponent( AUTH_TOKEN );
        request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    }
	});




	$("a.tab").each(function() {
		$(this).click(function() {
			$("div.tab").hide();
			$("a.tab").removeClass("current");
			$(this).addClass("current");
			$("div#"+$(this).attr('id') ).toggle();
		});
	});
	$("div.tab").hide();
	$("a#home").click();
	
	$("button#add-post").click(function() {
		$("#new-post").show();
	});
	$("#new-post").hide();
	$("form#new_post").bind('submit', function(e) {
		
		var data = "post%5Bname%5D="+escape($("#post_name").val() )+
			"&post%5Btitle%5D="+ escape($("#post_title").val() )+
			"&post%5Bcontent%5D="+escape($("#post_content").val() );
		
		alert( data );
		$.ajax({
			url: '/posts.json',
			data: 	data,
			success: function(data) {
				$("#notices").append("Success! <br />");
				alert(data);
			},
			422: function() {
				$("#notices").append("Failure.  <br />");
				alert(data);
			},
			type: 	'post'
		});
		
		
		e.preventDefault();
		return false;
	});
});


