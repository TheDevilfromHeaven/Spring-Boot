<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>论坛分页</title>
		<link rel="stylesheet" type="text/css" href="/css/reply/reply.css"/>
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/LogAndReg/LogAndReg.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
		<script type="text/javascript" src="/js/reply/reply.js"></script>
		<script type="text/javascript" src="/js/outLogin/outLogin.js"></script>
		<style>
			body{
				background: rgb(212,230,247);
			}
		</style>
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
						<a class="outLogin" href="javascript:void(0)">退出</a>
						<#else>
						<a href="#" data-toggle="modal" data-target="#loginModel" data-dismiss="modal">登录</a>
						<a href="#" data-toggle="modal" data-target="#registerModel" data-dismiss="modal">注册</a>
					</#if>
				</div>
			</div>
		</div>
	
		<div class="main">
			<div class="head" style="background-image: url(/img/reply/reply_head.jpg);"></div>
			
			<div style="width:100%;height:60px;border-top: 1px solid rgb(192,192,192);">
				<div style="width:100%;line-height: 50px;padding: 5px 0px 0px 20px;">
						<div style="width:200px;float:left;">
							当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页
						</div>
						<div style="float:left;margin-top:7px;">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=1">首页</a></li>
									<#if pageInfo.pageNum != 1>  
										<li class="page-item"><a class="page-link"
											href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pageNum-1}"
											aria-label="Previous"><span aria-hidden="true">&laquo;</span>
										</a></li>
									</#if>
									<#list pageInfo.navigatepageNums as page_Num>
										<#if page_Num == pageInfo.pageNum>
											<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${page_Num}">${page_Num}</a></li>
											<#else>
												<li class="page-item">
													<a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${page_Num}">${page_Num}</a>
												</li>
										</#if>
									</#list>
									<#if pageInfo.hasNextPage>
										<li class="page-item"><a class="page-link"
											href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pageNum+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</#if>
									<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
			</div>
			
			<div class="center">
				<div class="reply">
					<ul>
						<#if pageInfo.pageNum == 1>
							<li>
								<div class="user_info">
								<div class="user_head">
									<img alt="图片不存在" src="/img/head/${post.user_head_img!}">
								</div>
								<div class="user_name">${post.user_name!}</div>
								</div>
								<div class="content">
									<div class="text">${post.post_content}</div>
									<div class="time">${post.post_time?string("yyyy-MM-dd HH:mm")}</div>
								</div>
							</li>
						</#if>
						<#list reply as reply>
							<li>
								<div class="user_info">
								<div class="user_head">
									<img alt="图片不存在" src="/img/head/${reply.user_head_img!}">
								</div>
								<div class="user_name">${reply.user_name!}</div>
								</div>
								<div class="content">
									<div class="text">${reply.reply_content}</div>
									<div class="time">${reply.reply_time?string("yyyy-MM-dd HH:mm")}</div>
								</div>
							</li>
						</#list>
					</ul>
				</div>
				<div class="c_right">
					热帖排行榜（等待后续开发）
					<ul>
						<li>html中引入调用另一个公用html模板文件的方法19040 ℃</li>
						<li>input[type=file]去掉“未选择任何文件”及样式改进10786 ℃</li>
						<li>Jetbrains系列激活补丁JetbrainsCrack-2.8更新6161 ℃</li>
						<li>js获取input上传文件的文件名和扩展名的方法5683 ℃</li>
						<li>HTML img src图片路径不存在，则显示一张默认图片的方法</li>
						<li>HTML引入文件的绝对路径、相对路径、根目录5284 ℃</li>
						<li>HTML img src图片路径不存在，则显示一张默认图片的方法</li>
						<li>HTML引入文件的绝对路径、相对路径、根目录5284 ℃</li>
					</ul>
				</div>
			</div>
			
			<div style="width:100%;height:60px;border-top: 1px solid rgb(192,192,192);">
				<div style="width:100%;line-height: 50px;padding: 5px 0px 0px 20px;">
						<div style="width:200px;float:left;">
							当前第：${pageInfo.pageNum}页，总共：${pageInfo.pages}页
						</div>
						<div style="float:left;margin-top:7px;">
							<nav aria-label="Page navigation">
								<ul class="pagination">
									<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=1">首页</a></li>
									<#if pageInfo.pageNum != 1>  
										<li class="page-item"><a class="page-link"
											href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pageNum-1}"
											aria-label="Previous"><span aria-hidden="true">&laquo;</span>
										</a></li>
									</#if>
									<#list pageInfo.navigatepageNums as page_Num>
										<#if page_Num == pageInfo.pageNum>
											<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${page_Num}">${page_Num}</a></li>
											<#else>
												<li class="page-item">
													<a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${page_Num}">${page_Num}</a>
												</li>
										</#if>
									</#list>
									<#if pageInfo.hasNextPage>
										<li class="page-item"><a class="page-link"
											href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pageNum+1}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</#if>
									<li class="page-item"><a class="page-link" href="/ReplyController/${forum_name}?post_id=${post.post_id}&currentPage=${pageInfo.pages}">末页</a></li>
								</ul>
							</nav>
						</div>
					</div>
			</div>
			
			<div class="replyArea">
				<div class="replyEdit">
					<form action="/ReplyController/${info}">
						<input type="hidden" name="post_id" value="${post.post_id}">
						<div class="form-group">
							<div class="row">
								<label style="line-height: 38px;width:70px;text-align: right;">内容：</label>
								<textarea id="post_content" name="reply_content" rows="5" class="form-control" style="width:60%;"></textarea>
								<span id="tip_content" style="line-height: 38px;padding-left:20px;"></span>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<label style="line-height: 38px;width:8%;"></label>
								<#if Session["user_id"]?exists>
									<input id="sending" type="submit" class="btn btn-info" style="margin-left:15%;width:100px;">
									<#else>
									<input class="btn btn-info" disabled value="登录后才能发送" style="margin-left:15%;">
								</#if>
							</div>
						</div>
					</form>
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