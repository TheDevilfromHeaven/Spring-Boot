$(function(){	
	$("#forum").change(function(){
		var forum = $("#forum option:selected").val();
		if(forum == 1){
			$("#gameName").empty();
			$("#gameName").append("<option>选了版块再选游戏</option>");
		}
		if(forum == 2){
			$("#gameName").empty();
			$.ajax({
				async: false,
				url:"/GamesController/OLgameName",
				success:function(result){
					var data = result;
					con = "";
					$.each(data,function(index,item){
						con += "<option value="+item.game_name_cn+">"+item.game_name_cn+"</option>";
					});
					$("#gameName").html(con);
					$("#EditForm").attr("action","/ForumController/OLPost");
				},
				error:function(result){
				}
			})
		}
		if(forum == 3){
			$("#gameName").empty();
			$.ajax({
				async: false,
				url:"/GamesController/SPgameName",
				success:function(result){
					var data = result;
					con = "";
					$.each(data,function(index,item){
						con += "<option value="+item.game_name_cn+">"+item.game_name_cn+"</option>";
					});
					$("#gameName").html(con);
					$("#EditForm").attr("action","/ForumController/SPPost");
				},
				error:function(result){
				}
			})
		}
		if(forum == 4){
			$("#gameName").empty();
			$.ajax({
				async: false,
				url:"/GamesController/PHgameName",
				success:function(result){
					var data = result;
					con = "";
					$.each(data,function(index,item){
						con += "<option value="+item.game_name_cn+">"+item.game_name_cn+"</option>";
					});
					$("#gameName").html(con);
					$("#EditForm").attr("action","/ForumController/PHPost");
				},
				error:function(result){
				}
			})
		}
	});
	
	$("#submit").click(function(){
		var forum = $("#forum option:selected").val();
		var post_name = $("#post_name").val();
		var post_content = $("#post_content").val();
		if(forum == 1){
			$("#tip_forum").html("请选择板块");
			return false;
		}else if(post_name =="" | post_name == null){
			$("#tip_gameName").html("请给一个标题");
			$("#tip_forum").html("");
			return false;
		}else if(post_content =="" | post_content == null){
			$("#tip_content").html("跟大家说几句吧");
			$("#tip_forum").html("");
			$("#tip_gameName").html("");
			return false;
		}else{
			return true;
		}
	});
	
	$("#forum_list li").hover(function(){
		$(this).css("border","3px solid orange");
	},function(){
		$(this).css("border","0px solid orange");
	});
});