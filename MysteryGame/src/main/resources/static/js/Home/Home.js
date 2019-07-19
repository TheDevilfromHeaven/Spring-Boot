$(function(){
	$(".content-spe-right li:eq(0)").find(".off").attr("class","on");
	$(".content-spe-right li:eq(0)").find(".game_img").show();
	$(".content-spe-right li:eq(0)").css({"height":"195px","border-top":"1px dashed gray"});
	
	$(".content-spe-right li").hover(function(){
		var list = $(this).index();
		$(".game_img").hide();
		$(".content-spe-right li").css("height","40px");
		$(".on").attr("class","off");
		$(this).css("height","195px");
		$(this).find(".off").attr("class","on");
		$(this).find(".game_img").show();
	});
	
	$(".content-spe-center a:first").css("color","red");
	$(".content-spe-center a:eq(1)").css("color","red");
});