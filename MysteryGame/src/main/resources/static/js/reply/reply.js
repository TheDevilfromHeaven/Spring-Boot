$(function(){
	$("#sending").click(function(){
		var post_content = $("#post_content").val();
		if(post_content == "" || post_content == null){
			$("#tip_content").css("color","red");
			$("#tip_content").html("你还没有写内容呢");
			return false;
		}
	});
});