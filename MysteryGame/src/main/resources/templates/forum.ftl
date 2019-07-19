<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>论坛</title>
		<link rel="stylesheet" type="text/css" href="/css/forum/forum.css" />
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/LogAndReg/LogAndReg.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
		<script type="text/javascript" src="/js/forum/forum.js"></script>
		<script type="text/javascript" src="/js/outLogin/outLogin.js"></script>
</head>

<body>
	<!-- 头部 -->
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
						<a class="outLogin" href="javascript:void(0)">退出</a>
						<#else>
						<a href="#" data-toggle="modal" data-target="#loginModel" data-dismiss="modal">登录</a>
						<a href="#" data-toggle="modal" data-target="#registerModel" data-dismiss="modal">注册</a>
					</#if>
				</div> 
			</div>
		</div>

	<!-- 主体 -->
	<div class="main">

		<!-- 中心 -->
		<div style="height:250px;background-image: url(/img/forum/forum_head.jpg);"></div>
			
		<div class="content">
			<!-- 中心左侧 -->
			<div class="content-left">
				<ul id="forum_list">
					<#list forums as forum>
						<li style="background-image: url(/img/forum/${forum.forum_img});"><a href="/ForumController/${forum.post}">${forum.forum_name}</a></li>
					</#list>
				</ul>
			</div>
			<!-- 中心右侧侧 -->
			<div class="content-right">
				<div class="right-C">
					<div class="Post">
						<ul>
							<#list postRecommend as postRecommend>
								<li>
								<div class="invitation_title">
									<div class="show_post_name">
										<h5><a id="Post_Id" href="/ReplyController/${forum_name}?post_id=${postRecommend.post_id}">${postRecommend.post_name!}</a></h5>
									</div>
									<div class="show_info">
										<span class="show_user_name">${postRecommend.user_name!}</span>
										<span class="show_game_name">${postRecommend.game_name!}</span>
									</div>
								</div>
								<hr/>
								<div class="inviation_conten">
									<div class="show_post_content">
										<p>${postRecommend.post_content!}</p>
									</div>
									<div class="post_time">
										<span>${postRecommend.post_time?string("yyyy-MM-dd HH:mm")}</span>
									</div>
								</div>
								</li>
							</#list>
						</ul>
					</div>
					<div class="right_R">
						<div class="hot_list">
							<h5>热门帖子</h5>
							<ul>
								<li><span>1</span><a href="#">等待后续开发</a></li>
								<li><span>2</span><a href="#">等待后续开发</a></li>
								<li><span>3</span><a href="#">等待后续开发</a></li>
								<li><span>4</span><a href="#">等待后续开发</a></li>
								<li><span>5</span><a href="#">等待后续开发</a></li>
								<li><span>6</span><a href="#">等待后续开发</a></li>
								<li><span>7</span><a href="#">等待后续开发</a></li>
								<li><span>8</span><a href="#">等待后续开发</a></li>
								<li><span>9</span><a href="#">等待后续开发</a></li>
								<li><span>10</span><a href="#">等待后续开发</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div style="width:80%;height:40px;margin-top:5px">
					<div style="width:60%;line-height: 40px;margin: auto;">
						<div style="width:200px;float:left;">
							当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页
						</div>
						<div style="float:left;">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="/ForumController/${forum_name}?currentPage=1">首页</a></li>
									<#if pageInfo.pageNum != 1>  
										<li class="page-item"><a class="page-link"
											href="/ForumController/${forum_name}?currentPage=${pageInfo.pageNum-1}"
											aria-label="Previous"><span aria-hidden="true">&laquo;</span>
										</a></li>
									</#if>
									<#list pageInfo.navigatepageNums as page_Num>
										<#if page_Num == pageInfo.pageNum>
											<li class="page-item"><a class="page-link" href="/ForumController/${forum_name}?currentPage=${page_Num}">${page_Num}</a></li>
											<#else>
												<li class="page-item">
													<a class="page-link" href="/ForumController/${forum_name}?currentPage=${page_Num}">${page_Num}</a>
												</li>
										</#if>
									</#list>
									<#if pageInfo.hasNextPage>
										<li class="page-item"><a class="page-link"
											href="/ForumController/${forum_name}?currentPage=${pageInfo.pageNum+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</#if>
									<li class="page-item"><a class="page-link" href="/ForumController/${forum_name}?currentPage=${pageInfo.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="EditArea">
			<div class="Edit">
				<form id="EditForm">
					<div class="form-group">
						<div class="row">
							<label style="line-height: 38px;width:70px;text-align: right;">板块名：</label>
							<select id="forum" name="bbs_id" class="form-control" style="width:25%;">
								<#list forums as forum>
									<#if forum_index == 0>
										<option value="${forum.forum_id}">请选择一个版块</option>
										<#else>
										<option value="${forum.forum_id}">${forum.forum_name}</option>
									</#if>
								</#list>
							</select>
							<span id="tip_forum" style="line-height: 38px;padding-left:20px;"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label style="line-height: 38px;width:70px;text-align: right;">游戏名：</label>
							<select id="gameName" name="game_name" class="form-control" style="width:30%;">
								<option>选了版块再选游戏</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label style="line-height: 38px;width:70px;text-align: right;">标题：</label>
							<input id="post_name" name="post_name" class="form-control" type="text" style="width:40%;" autocomplete="off">
							<span id="tip_gameName" style="line-height: 38px;padding-left:20px;"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label style="line-height: 38px;width:70px;text-align: right;">内容：</label>
							<textarea id="post_content" name="post_content" rows="5" class="form-control" style="width:60%;"></textarea>
							<span id="tip_content" style="line-height: 38px;padding-left:20px;"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="row">
							<label style="line-height: 38px;width:8%;"></label>
							<#if Session["user_id"]?exists>
								<input id="submit" type="submit" class="btn btn-info" style="margin-left:20%;width:100px;">
								<#else>
								<input class="btn btn-info" disabled value="登录后才能发帖" style="margin-left:20%;">
							</#if>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 底部页面结束 -->
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