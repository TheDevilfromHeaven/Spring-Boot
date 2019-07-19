<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>搜素展示</title>
		<link rel="stylesheet" type="text/css" href="/css/search/search.css"/>
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
		<!-- 主体 -->
		<div class="content">
			<!-- 顶部 -->
			
			
			<!-- 一级导航 -->
			<div class="nav_a">
				<div class="search">
						<form action="/SearchController/Search">
								<#if keyword?exists>
								<input type="text" name="keyword" value="${keyword}"/>
								<button type="submit">
									<i></i>
								</button>
								<#else>								
								<input type="text" name="keyword" value=""/>
								<button type="submit">
									<i></i>
								</button>
								</#if>
						</form>
				</div>
				<div id="type">
					<a href="/SearchController/Search?keyword=" class="btn">全部</a>
					<a href="/SearchController/phoneGame" class="btn">手游</a>
					<a href="/SearchController/singlePlayGame" class="btn">单机</a>
					<a href="/SearchController/onlineGame" class="btn">网游</a>
					<a href="/SearchController/chessGame" class="btn">棋牌</a>
				</div>
			</div>
			<!-- 中心 -->
			<div class="center">
				<div style="width:100%;">
					<#list search as search>
						<div id="showGame">
							<div id="Game">
								<div style="width:200px;height:200px;float:left;">
									<img src="${search.game_picture }" style="width:100%;height:100%"/>
								</div>
								<div style="width:280px;float:left;margin:0px 10px">
									<h5><a href="/GamesController/game?game_name_cn=${search.game_name_cn }">游戏名：${search.game_name_cn }</a></h5>
									<P>游戏类型：${search.game_type_name }</P>
									<P>游戏平台：${search.game_platform }</P>
									<P>开发商：${search.game_developers }</P>
									<P>发行日期：${search.game_lssue_date }</p>
								</div>
							</div>
						</div>
					</#list>
					<#if search??&& (search?size > 0)>
						<#else>
						<div style="text-align: center;margin-top:20px;">没有查到相关游戏！</div>
					</#if>
				</div>
			</div>
			
			<div class="nav_b">
				<#if type == "search">
					<div style="width:100%;margin-top:20px;">
						<div style="text-align:center;margin-bottom: 10px;">
							当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
						</div>
						<div style="margin:auto;width:29%;">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="/SearchController/Search?keyword=${keyword}&currentPage=1">首页</a></li>
									<#if pageInfo.pageNum != 1>  
										<li class="page-item"><a class="page-link"
											href="/SearchController/Search?keyword=${keyword}&currentPage=${pageInfo.pageNum-1}"
											aria-label="Previous"><span aria-hidden="true">&laquo;</span>
										</a></li>
									</#if>
									<#list pageInfo.navigatepageNums as page_Num>
										<#if page_Num == pageInfo.pageNum>
											<li class="page-item"><a class="page-link" href="#">${page_Num}</a></li>
											<#else>
												<li class="page-item">
													<a class="page-link" href="/SearchController/Search?keyword=${keyword}&currentPage=${page_Num}">${page_Num}</a>
												</li>
										</#if>
									</#list>
									<#if pageInfo.hasNextPage>
										<li class="page-item"><a class="page-link"
											href="/SearchController/Search?keyword=${keyword}&currentPage=${pageInfo.pageNum+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</#if>
									<li class="page-item"><a class="page-link" href="/SearchController/Search?keyword=${keyword}&currentPage=${pageInfo.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				<#else>
					<div style="width:100%;margin-top:20px;">
						<div style="text-align:center;">
							当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页，总共：${pageInfo.total}条记录
						</div>
						<div style="margin:auto;width:27%;">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="/SearchController/${type}?currentPage=1">首页</a></li>
									<#if pageInfo.pageNum != 1>  
										<li class="page-item"><a class="page-link"
											href="/SearchController/${type}?currentPage=${pageInfo.pageNum-1}"
											aria-label="Previous"><span aria-hidden="true">&laquo;</span>
										</a></li>
									</#if>
									<#list pageInfo.navigatepageNums as page_Num>
										<#if page_Num == pageInfo.pageNum>
											<li class="page-item"><a class="page-link" href="#">${page_Num}</a></li>
											<#else>
												<li class="page-item">
													<a class="page-link" href="/SearchController/${type}?currentPage=${page_Num}">${page_Num}</a>
												</li>
										</#if>
									</#list>
									<#if pageInfo.hasNextPage>
										<li class="page-item"><a class="page-link"
											href="/SearchController/${type}?currentPage=${pageInfo.pageNum+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</#if>
									<li class="page-item"><a class="page-link" href="/SearchController/${type}?currentPage=${pageInfo.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
				</#if>
			</div>
			
			<!-- 底部 -->
			<div class="foot">
				<p style="line-height: 24px;font-size:24px;">你的加入是让我们前进的动力，请关注我们的微博、微信公众号获取我们的最新动态。</p>
				<div style="width:40%;float:left;">
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