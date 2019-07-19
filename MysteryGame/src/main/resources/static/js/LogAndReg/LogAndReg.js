$(function(){
	$("#login").click(function(){
		var id = $("#lg_username").val();
		var password = $("#lg_password").val();
		if(id == "" || id == null){
			$("#lg_username").focus();
			$("#lg1").css("color","red");
			$("#lg1").html("手机号码不能为空");
			return false;
		}else if(password == "" || password == null){
			$("#lg_password").focus();
			$("#lg2").css("color","red");
			$("#lg2").html("密码不能为空");
			$("#lg1").html("");
			return false; 
		}else{
			var result;
			$.ajax({
				async: false,
				type: "POST",
				dataType:"json",
				url:"/LoginController/login",
				data:{"user_id":id,"user_password":password},
				success:function(data){
					if(data == true){
						window.location.reload();
						result = false;
					}else{
						$("#lg2").css("color","red");
						$("#lg2").html("密码错误！");
						result = false;
					}
				},
				error:function(data){
					$("#lg2").css("color","red");
					$("#lg2").html("账号或密码错误！");
					result = false;
				}
			});
			return result;	
		}
	});
	
	$("#register").click(function(){
		var phone=/^1[3|4|5|7|8][0-9]\d{4,8}$/;
		var id = $("#rg_user_id").val();
		var password = $("#rg_password").val();
		var name = $("#rg_user_name").val();
		var check = $("#c2").is(':checked');
		if(id == "" || id == null){
			$("#rg_user_id").focus();
			$("#rg1").css("color","red");
			$("#rg1").html("手机号码不能为空");
			return false;
		}else if(!id.match(phone)){
			$("#rg1").css("color","red");
			$("#rg1").html("格式不正确！");
			return false;
		}else if(password == "" || password == null){
			$("#rg_password").focus();
			$("#rg2").css("color","red");
			$("#rg2").html("密码不能为空");
			$("#rg1").html("");
			$("#rg3").html("");
			return false; 
		}else if(password.length>12 || password.length<6){
			$("#rg2").css("color","red");
			$("#rg2").html("密码长度在6-12之间");
			return false;
		}else if(name == "" || name == null){
			$("#rg_user_name").focus();
			$("#rg3").css("color","red");
			$("#rg3").html("名字不能为空");
			$("#rg1").html("");
			$("#rg2").html("");
			return false; 
		}else if(check != true){
			alert("你还没有同意条例");
			return false;
		}else{
			var result;
			$.ajax({
				async: false,
				type: "POST",
				dataType:"json",
				url:"/RegController/Verification",
				data:{"user_id":id},
				success:function(data){
					if(data == true){
						$("#rg1").css("color","red");
						$("#rg1").html("已被注册！");
						result = false;
					}else{
						result = true;
					}
				},
				error:function(data){
					result = false;
				}
			});
			return result;	
		}
	});
	
});
