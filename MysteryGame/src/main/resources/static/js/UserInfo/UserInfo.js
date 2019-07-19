$(function(){
	$(".list li:first").css("background","rgb(0,161,251)");
	
	$(".list li").click(function(){
		$(".container").hide();
		$(".list li").css("background","");
		$(this).css("background","rgb(0,161,251)");
		$("#"+$(this).index()+"").show();
	});
	
	$(".interest").click(function(){
		var id = $("#user_id").val();
		$.ajax({
			async: false,
			dataType: "json",
			url:"/UserInfoController/interest",
			data:{"user_id":id},
			success:function(result){
				var data = result;
				con = "";
				$.each(data,function(index,item){
					con += "<a href="+"/GamesController/game?game_name_cn="+item.interest_game+" class="+"btn"+" onclick="+"javascript:location.replace(this.href);event.returnValue=false;"+ ">"+item.interest_game+"</a>"
						 + "<div><a href="+"/UserInfoController/delFollow?game_name="+item.interest_game+""+" class="+"delet"+">x</a></div>";
				});
				$("#2 div").html(con);
			},
			error:function(result){
			}
		});
	});
	
	$("#datetimepicker").datetimepicker({
    	format:'YYYY-MM-DD',
    	locale:'zh-cn',
    	Default: moment.locale(),
        icons: {
            date: "iconfont icon-shouye",
            previous: 'iconfont icon-left-circle',
            next: 'iconfont icon-right-circle',
        }
    });
	
	$("#save").click(function(){
		var user_email = $("#user_email").val();
		var email = /\w[-\w.+]*@([A-Za-z0-9][-A-Za-z0-9]+\.)+[A-Za-z]{2,14}/;
		if(user_email == null || user_email == ""){
			return true;
		}else if(!user_email.match(email)){
			$("#tip_email").css("color","red");
			$("#tip_email").html("你输入的邮箱格式是错误的！")
			return false;
		}
	});
});