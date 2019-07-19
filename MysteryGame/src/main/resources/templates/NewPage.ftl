<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>新闻展示</title>
		<link rel="stylesheet" type="text/css" href="/css/NewPage/news.css" />
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/LogAndReg/LogAndReg.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
	</head>
	<body>
		<div class="head_top">
			<div class="head_main">
				<div class="head_logo">
					<img src="/img/logo.png" style="width:100%;height:100%;">
				</div>
				<div class="head_nav_bar">
					<ul>
						<li><a href="/HomeController/hello"><span class="iconfont icon-shouye"></span>主站</a></li>
						<li><a href=""><span class="iconfont icon-shangcheng"></span>商城</a></li>
						<li><a href="/ForumController/forum"><span class="iconfont icon-luntan"></span>论坛</a></li>
						<li><a href=""><span class="iconfont icon-guanyu "></span>关于我们</a></li>
					</ul>
				</div>
				<div class="head_login">
					<#if Session["user_id"]?exists >
						<a href="/UserInfoController/UserInfo?user_id=${Session["user_id"] }">${Session["user_name"]}</a>
						<#else>
						<a href="#" data-toggle="modal" data-target="#loginModel" data-dismiss="modal">登录</a>
						<a href="#" data-toggle="modal" data-target="#registerModel" data-dismiss="modal">注册</a>
					</#if>
				</div>
			</div>
		</div>
		<!-- 整体 -->
		<div class="new">
			<!-- 顶部 -->
			<div style="width:100%;height:150px;margin-bottom:50px">
				<img src="/img/new/newPage_head.jpg" style="width:100%;height:100%;">
			</div>

			<!-- 中心 -->
			<div class="content">
				<!-- 左侧 -->
				<div class="c_left">
					<h3>${newPage.new_title}</h3>
					<p>${newPage.new_time?string("yyyy-MM-dd HH:mm")}</p>
					<iframe name="show" id="show" frameborder="0" src="${newPage.new_content}" style="width:100%;height:90%;"></iframe>
				</div>
				<!-- 右侧 -->
				<div class="c_right">
					<div class="a">
						<div style="border-bottom: 1px #000000 solid;margin-bottom: 10px;">
							<h4>相关文章:</h4>
						</div>
						<ul>
							<li><a href="#">塑造传奇有多难？全能中单Cat高光英雄</a></li>
							<li><a href="#">【DNF小芝士第6期】师徒系统怎么玩?</a></li>
							<li><a href="#">第六季车王胡旭专访迈向冠军的最后一步</a></li>
							<li><a href="#">【娜塔莎返场】永久角色烈锋6.1免费送</a></li>
							<li><a href="#">原汁原味 体验升级!《和平精英》代言人携全新版本亮相</a></li>
						</ul>
					</div>
					<div class="b">
						<img alt="图片丢失" src="/img/new/adviertisement.png" style="width:100%;height:100%;">
					</div>
				</div>
			</div>
			<!-- 底部 -->
			<div class="foot">
				<div style="border-bottom: 1px #000000 solid;margin-bottom: 10px;width:96%;">
					<h4>更多详情请关注:</h4>
				</div>
				<div class="foot_a">
					<ul>
						<li><a href="#">《404工作室》官方网站：http://404.qq.com</a></li>
						<li><a href="#">《404工作室》官方微博：http://weibo.com/game404</a></li>
						<li><a href="#">《404工作室》官方论坛：http://404.gamebbs.qq.com</a></li>
						<li><a href="#">《404工作室》官方App：http://404.qq.com/app</a></li>
					</ul>
				</div>
				<div class="weibo">
					<a href="javascript:void(0)" style="color:red"><span class="iconfont icon-xinlangdenglu"></span></a>
					<a href="javascript:void(0)" style="color:green"><span class="iconfont icon-weixin_denglu"></span></a>
				</div>
			</div>
		</div>
		
		<!-- 登录 -->
		<div class="modal fade" id="loginModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:550px;padding-top:250px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="iconfont icon-guanbi"></span></button>			
					</div>
					<div class="modal-body">		
						<div class="page-header">
							<h3 style="color:cornflowerblue;font-weight: bold; padding-left: 50px;">用户登录：</h3>
						</div>
							<form class="form-horizontal">			
								<div class="container" style="width:500px;">
									<div class="form-group">
										<div class="row">
											<div class="col-md-3" style="text-align:right">
												<label for="username" class="control-label">
													<span class="iconfont icon-shoujihaoma" style="font-size:30px"></span>
												</label>
											</div>
											<div class="col-md-8">
												<input type="text" name="user_id" id="lg_username" class="form-control" placeholder="请输入手机号" maxlength="11"/>
												<!-- <span style='position:absolute;font-size:13px;color: #f00;'></span> -->
											</div>
										</div>
									</div>
									<p id="lg1" style="padding-left:130px"></p>
									
									<div class="form-group">
										<div class="row">
											<div class="col-md-3" style="text-align:right">
												<label for="password" class="control-label">
													<span class="iconfont icon-mima" style="font-size:30px"></span>
												</label>
											</div>
											<div class="col-md-8">
												<input type="password" name="user_password" id="lg_password" class="form-control" placeholder="请输入密码" maxlength="12"/>
											</div>
										</div>
									</div>
									<p id="lg2" style="padding-left:130px"></p>
													
									<div class="form-group">
										<div class="row">
											<div class="col-md-5" style="padding-left:100px">
												<label class="control-label">
													<input type="checkbox" id="c1" />记住密码
												</label>
											</div>
											<div class="col-md-7">
												<div class="checkbox">
													<label style="color:deepskyblue;">
														<a href="#" data-toggle="modal" data-target="#registerModel" data-dismiss="modal" aria-hidden="true">没有账号去注册</a>
													</label>
												</div>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-md-10" style="padding-left:100px">
												<button id="login" type="submit" class="btn btn-info btn-block">登录</button>
											</div>
										</div>
									</div>
									
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 注册 -->
		<div class="modal fade" id="registerModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" style="width:550px;padding-top:250px;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="iconfont icon-guanbi"></span></button>			
					</div>
					<div class="modal-body">		
						<div class="page-header">
							<h3 style="color:cornflowerblue;font-weight: bold; padding-left: 50px;">用户注册：</h3>
						</div>
							<form action="/RegController/UsersRegister" class="form-horizontal">			
								<div class="container" style="width:500px;">
									<div class="form-group">
										<div class="row">
											<div class="col-md-3" style="text-align:right">
												<label for="username" class="control-label">
													<span class="iconfont icon-shoujihaoma" style="font-size:30px"></span>
												</label>
											</div>
											<div class="col-md-8">
												<input type="text" name="user_id" id="rg_user_id" class="form-control" placeholder="请输入手机号" maxlength="11"/>
											</div>
										</div>
									</div>
									<p id="rg1" style="padding-left:130px"></p>
									
									<div class="form-group">
										<div class="row">
											<div class="col-md-3" style="text-align:right">
												<label for="password" class="control-label">
													<span class="iconfont icon-mima" style="font-size:30px"></span>
												</label>
											</div>
											<div class="col-md-8">
												<input type="password" name="user_password" id="rg_password" class="form-control" placeholder="请输入密码" maxlength="12"/>
											</div>
										</div>
									</div>
									<p id="rg2" style="padding-left:130px"></p>
									
									<div class="form-group">
										<div class="row">
											<div class="col-md-3" style="text-align:right">
												<label for="user_name" class="control-label">
													<span class="iconfont icon-xingmingyonghumingnicheng" style="font-size:30px"></span>
												</label>
											</div>
											<div class="col-md-8">
												<input type="text" name="user_name" id="rg_user_name" class="form-control" placeholder="给自己起个名字吧"/>
											</div>
										</div>
									</div>
									<p id="rg3" style="padding-left:130px"></p>
													
									<div class="form-group">
										<div class="row">
											<div class="col-md-8" style="padding-left:100px">
												<label class="control-label">
													<input type="checkbox" id="c2" />我以同意条例
												</label>
											</div>
										</div>
									</div>
									
									<div class="form-group">
										<div class="row">
											<div class="col-md-10" style="padding-left:100px">
												<button id="register" type="submit" class="btn btn-info btn-block">注册</button>
											</div>
										</div>
									</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>