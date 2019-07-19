$(function(){
	var head=$(".head_top").height();
	$(window).scroll(function(){
		var topScr=$(window).scrollTop();
		if (topScr>head) {
			$(".head_top").addClass("fixed");
		}else{
			$(".head_top").removeClass("fixed");
		}
	})
	
	window.addEventListener('pageshow', function (event) {
		if (event.persisted || window.performance &&
				window.performance.navigation.type == 2)
		{
			location.reload();
		}
	},false);
});