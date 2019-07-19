<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>信息完善</title>
		<link rel="stylesheet" type="text/css" href="/css/UserInfo/user.css" />
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/webjars/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="/webjars/moment/2.24.0/min/moment.min.js"></script>
		<script src="/webjars/moment/2.24.0/min/moment-with-locales.min.js"></script>
		<script src="/webjars/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js"></script>
		<script type="text/javascript" src="/js/UserInfo/UserInfo.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
		<script type="text/javascript" src="/js/outLogin/outLogin.js"></script>
	</head>
	<body>
		<!-- 导航栏 -->
		<div class="head_top">
			<div class="head_main">
				<div class="head_logo">
					<img src="/img/logo.png" style="width:100%;height:100%;"> 
				</div>
				<div class="head_nav_bar">
					<ul>
						<li><a href="/HomeController/hello" onclick="javascript:location.replace(this.href);event.returnValue=false; "><span class="iconfont icon-shouye"></span>主站</a></li>
						<li><a href=""><span class="iconfont icon-shangcheng"></span>商城</a></li>
						<li><a href="/ForumController/forum" onclick="javascript:location.replace(this.href);event.returnValue=false; "><span class="iconfont icon-luntan"></span>论坛</a></li>
						<li><a href=""><span class="iconfont icon-guanyu "></span>关于我们</a></li>
					</ul>
				</div>
				<div class="head_login">
					<#if Session["user_id"]?exists>
						<img src="/img/head/${user.userInfo.user_head_img! }" style="width:50px;height:50px;float:left"/>
						<a href="/UserInfoController/UserInfo?user_id=${Session["user_id"] }">${Session["user_name"]}</a>
						<a class="outLogin" href="javascript:void(0)">退出</a>
					</#if>
				</div> 
			</div>
		</div>
		<!-- 主体 -->
		<div class="main">
			<!-- 中心 -->
			<div class="list">
				<ul>
					<li><a href="javasript:void(0)">我的信息</a></li>
					<li><a href="javasript:void(0)">我的头像</a></li>
					<li class="interest"><a href="javasript:void(0)">我的兴趣</a></li>
					<li><a href="javasript:void(0)">我的帖子</a></li>
					<li><a href="javasript:void(0)">签到积分</a></li>
					<li><a href="javasript:void(0)">通知</a></li>
					<li><a href="javasript:void(0)">等级制度</a></li>
					<li><a href="javasript:void(0)">文明制度</a></li>
					<li><a href="javasript:void(0)">管理员申请</a></li>
				</ul>
			</div>
			
			<div class="content">
				<div id="0" class="container" style="margin:20px 0px;">
					<h4>我的信息</h4>
					<hr>
					<form class="form-inline" action="/UserInfoController/changeInfo">
						<div style="width: 100%;padding-bottom:10px;">
							<div style="width: 20%; height: 100%; float: left;">
								<label for="user_name" style="float: right; margin-top: 5px;">昵称：</label>
							</div>
							<input type="text" class="form-control" id="user_name" name="user_name" value="${user.userInfo.user_name! }" style="width:30%" autocomplete="off">
						</div>
						<div style="width: 100%;padding-bottom:10px;">
							<div style="width: 20%; height: 100%; float: left;">
								<label for="user_email" style="float: right; margin-top: 5px;">电子邮箱：</label>
							</div>
							<input class="form-control" id="user_email" name="user_email" value="${user.userInfo.user_email! }" style="width:30%" autocomplete="off">
							<span id="tip_email"></span>
						</div>
						<div style="width: 100%;padding-bottom:10px;">
							<div style="width: 20%; height: 100%; float: left;">
								<label for="email" style="float: right;">性别：</label>
							</div>
							<div>
								<#if user.userInfo.user_sex  == "男">
									<input type="radio" name="user_sex" value="男" checked>男
									<input type="radio" name="user_sex" value="女">女
									<input type="radio" name="user_sex" value="保密">保密
								<#elseif user.userInfo.user_sex == "女">
									<input type="radio" name="user_sex" value="男">男
									<input type="radio" name="user_sex" value="女" checked>女
									<input type="radio" name="user_sex" value="保密">保密
								<#elseif user.userInfo.user_sex == "保密">
									<input type="radio" name="user_sex" value="男">男
									<input type="radio" name="user_sex" value="女">女
									<input type="radio" name="user_sex" value="保密" checked>保密
								<#else>
								</#if>
							</div>
						</div>
						<div style="width: 100%;padding-bottom:10px;">
							<div style="width: 20%; height: 100%; float: left;">
								<label for="user_birthday" style="float: right; margin-top: 5px;">生日：</label>
							</div>
							<div class="col-sm-9">
					             <input name="user_birthday" type="text" placeholder="${user.userInfo.user_birthday?string("yyyy-MM-dd") }" class="form-control datetimepicker-input" id="datetimepicker" data-target="#datetimepicker" data-toggle="datetimepicker" autocomplete="off"/>
					    	</div>
						</div>
						<input id="user_id" type="hidden" name="user_id" value="${Session["user_id"] }">
						<div style="width: 100%;text-align: center;padding-top:50px;">
							<input id="save" type="submit" class="btn btn-info" value="保存" style="width:100px;">
						</div>
					</form>
				</div>
				<div id="1" class="container" style="margin:20px 0px;display:none;">
					<h4>我的头像</h4>
					<hr>
					<div style="margin: 20px auto;width:150px;">
					    <img src="/img/head/${user.userInfo.user_head_img! }" style="width:150px;height:150px"/>
					</div>
					<form action="/UserInfoController/fileUpload" method="post" enctype="multipart/form-data">
						<div style="margin: auto;width:60%">
					        <label>上传图片</label>
					        <input type="file" name="file"/>
						</div>
				        <br>
				        <input id="user_id" type="hidden" name="user_id" value="${Session["user_id"] }">
				        <div  style="margin:auto;width:10%;">
					        <input id="upload" class="btn btn-info" type="submit" value="上传"/>
				        </div>
				    </form>
				</div>
				<div id="2" class="container" style="margin:20px 0px;display:none;">
					<h4>我的兴趣</h4>
					<hr>
					<div id="InterestGame"></div>
				</div>
				<div id="3" class="container" style="margin:20px 0px;display:none;">
					<h4>我的帖子</h4>
					<hr>
					<p>等待后续开发</p>
				</div>
				<div id="4" class="container" style="margin:20px 0px;display:none;">
					<h4>签到积分</h4>
					<hr>
						<p>等待后续开发</p>
				</div>
				<div id="5" class="container" style="margin:20px 0px;display:none;">
					<h4>通知</h4>
					<hr>
						<p>等待后续开发</p>
				</div>
				<div id="6" class="container" style="margin:20px 0px;display:none;">
					<h4>等级制度</h4>
					<hr>
						<p>等待后续开发</p>
				</div>
				<div id="7" class="container" style="margin:20px 0px;display:none;">
					<h4>文明制度</h4>
					<hr>
						<p>等待后续开发</p>
				</div>
				<div id="8" class="container" style="margin:20px 0px;display:none;">
					<h4>管理员申请</h4>
					<hr>
						<p>等待后续开发</p>
				</div>
			</div>
		</div>
	</body>
</html>