$(function(){
	$("#follow").click(function(){
		var game_name = $("#game_name").val();
		$.ajax({
			async: false,
			dataType: "json",
			url:"/GamesController/addFollow",
			data:{"game_name":game_name},
			success:function(result){
				if(result == true){
					window.location.reload();
				}else{
					alert("false");
				}
			},
			error:function(){
				alert("请你先登录！");
			}
		});
	});
});