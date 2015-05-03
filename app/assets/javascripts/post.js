jQuery(function($) {
 $('.post-new-comment').bind("enterKey",function(e){

 					var comment_content = this.value;
 					var  url = $(this).attr("data-url");
 					var this_input = $(this);

						$.ajax({
						  method: "POST",
						  url: url,
						  data: { content: comment_content }
						})
						  .done(function( msg ) {
						    this_input.val("");
						  });
		});

		$('.post-new-comment').keyup(function(e){
		if(e.keyCode == 13)
		{
		  $(this).trigger("enterKey");
		}
		});

});