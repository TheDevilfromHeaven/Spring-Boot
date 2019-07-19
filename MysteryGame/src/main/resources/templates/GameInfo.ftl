<!DOCTYPE html>
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width-device-width,initial-scale=1" />
		<title>游戏内容预览</title>
		<link rel="stylesheet" type="text/css" href="/css/GameInfo/GameInfo.css" />
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="/js/LogAndReg/LogAndReg.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
		<script type="text/javascript" src="/js/GameInfo/GameInfo.js"></script>
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
		<!-- 头部结束 -->


		<!-- 正文开始 -->
		<div class="G-main">
			<div class="G-content">
				<!-- 二级导航栏 -->
				<div class="G-nav">
					<div class="link_L">
						<a href="GameInfo.html" class="on">
							<p>首页</p>
						</a><span></span>
						<a href="#">
							<p>新闻</p>
						</a><span></span>
						<a href="#">
							<p>攻略</p>
						</a><span></span>
						<a href="#">
							<p>资源</p>
						</a><span></span>
						<a href="#">
							<p>图片</p>
						</a><span></span>
						<a href="#">
							<p>论坛</p>
						</a>
					</div>
					<div class="G-search">
						<form name="f" action="/SearchController/Search">
							<input type="text" id="kw" class="ssk" placeholder="请输入关键词" name="keyword"/>
							<input type="submit" value="" class="btn" />
						</form>
					</div>
				</div>
				<!-- 二级导航栏结束 -->

			<!-- 游戏简介 -->
			<div class="G-content-total">
			<div class="G-content-left">	
				<div class="G-Game">
					<div class="G-left">
						<img src="${game.game_picture}" style="width:100%;height:100%">
					</div>
					<div class="G-right">
						<p>中文名：${game.game_name_cn}</p>
						<P>原名：${game.game_name_original }</p>
						<P>其他名称：${game.game_name_other }</p>
						<P>游戏类型：${game.game_type_name }</P>
						<P>游戏平台：${game.game_platform }</P>
						<P>开发商：${game.game_developers }</P>
						<P>发行商：${game.game_publisher }</P>
						<P>发行日期：${game.game_lssue_date }</p>
						<P>游戏人数：${game.game_player_number }</p>
						<P>游戏画面：${game.game_screen }</p>
					</div>
					<div id="followArea">
						<#if exist == "true">
							<button type="button" class="btn btn-warning" style="width:75px;" disabled>已关注</button>
							<#else>
							<input id="game_name" type="hidden" value="${game.game_name_cn}">
							<button id="follow" type="button" style="width:75px;" class="btn btn-warning">关注</button>
						</#if>
					</div>
				</div>
				<div class="G-synopsis">
					${game.game_describe}
				</div>
				<div class="G-recommend">
					<div class="G-recommend-on">
						<ul>
							<li class="on">热门推荐</li>
						</ul>
					</div>
					<div class="G-recommend-lis">
						<a href="#" target="_blank">上线时间介绍</a> 
                        <a href="#" target="_blank">游戏闪退解决方法</a> 
                        <a href="#" target="_blank">潜水宝藏位置</a> 
                        <a href="#" target="_blank">全收集品地图位置</a> 
                        <a href="#" target="_blank">全神教成员位置</a> 
                        <a href="#" target="_blank">地图推荐等级表</a> 
                        <a href="#" target="_blank">全奥利哈钢地图位置</a> 
                        <a href="#" target="_blank">更换性别方法介绍</a>
                        <a href="#" target="_blank">官网地址</a>
                        <a href="#" target="_blank">新英雄上线时间</a>
                        <a href="#" target="_blank">安装失败解决方法</a>
                        <a href="#" target="_blank">国服活动时间表</a>
                        <a href="#" target="_blank">哪个英雄最容易上手</a>
                        <a href="#" target="_blank">下载地址分享</a>
                        <a href="#" target="_blank">新手怎么玩</a>
					</div>
				</div>
			</div>
			<!-- 游戏简介结束 -->
			    <div class="G-sale">
					<div class="G-sale-top">
						<ul class="sell">
						<!-- 6.5 -->
							<li>游戏评论</li>
					    </ul>
						<ul class="on">
							<li><a>评论系统维护升级中，暂不支持评论。</a></li>
							<li><a>很好，虽然内存有点大！但是此游戏能让我入迷。</a></li>
							<li><a>虽然英雄和皮肤太贵了，但还是很好玩。</a></li>
							<li><a>感谢两年半的陪伴，以后也请多多指教。</a></li>
							<li><a>看到这么多好评，只想体验一把肝帝的感觉。</a></li>
							<li><a>为什么我玩个游戏还得排队？</a></li>
							<li><a>超级难受根本抽不到好东西，太难玩了。</a></li>
							<li><a>游戏真的好玩，好玩的不得了，爱死了。</a></li>
							<li><a>我只能说气到秃头，再见吧，你这垃圾游戏。</a></li>
							<li><a>傻子游戏，昨天下载今天卸载，一点都不好玩。</a></li>
						</ul>
					</div>
					<div class="G-sale-foot">
						<div class="download">
							<ul>
								<li>游戏活动</li>
						    </ul>
						</div>
							<ul class="up">
								<li><a href="#">端午狂欢不停歇 人气宝箱限时5折！</a></li>
								<li><a href="#">2019春季赛总决赛即将开战 福利活动来助阵</a></li>
								<li><a href="#">累计在线得好礼，站街即获得纯净黄金增幅书</a></li>
								<li><a href="#">幸福六月，开启运福袋，赢乘龙御天</a></li>
								<li><a href="#">召唤新老战友领好礼</a></li>
								<li><a href="#">五大反外挂计划，对外挂进行多维度“攻防”</a></li>
								<li><a href="#">网易大神猪年欧气集结令 端午开运红包等你赢</a></li>
								<li><a href="#">高校嘉年华长沙漫展集锦 下一站湖南科技大学</a></li>
								<li><a href="#">花开汴京，四周年翻牌领好礼</a></li>
								<li><a href="#">初夏作战开始 每日对战得好礼</a></li>
							</ul>
					</div>
				</div>
				</div>
			</div>
			
		</div>
		<!-- 正文结束 -->

		<!-- 页面底部 -->
		<!-- 友情链接 -->
		<div class="G-content-link">
			<div class="content-link-center">
				<p>友情链接：</p>
				<ul>
					<li><a href="#">硬件设备</a></li>
					<li><a href="#">游戏论坛</a></li>
					<li><a href="#">娱乐频道</a></li>
					<li><a href="#">游戏下载</a></li>
					<li><a href="#">原创专栏</a></li>
					<li><a href="#">游戏商城</a></li>
					<li><a href="#">游戏汉化</a></li>
					<li><a href="#">原创攻略</a></li>
					<li><a href="#">补丁MOD</a></li>
					<li><a href="#">单机游戏</a></li>
					<li><a href="#">手机游戏</a></li>
					<li><a href="#">网络游戏</a></li>
					<li><a href="#">棋牌游戏</a></li>
					<li><a href="#">视频教学</a></li>
					<li><a href="#">游戏直播</a></li>
					<li><a href="#">37游戏</a></li>
					<li><a href="#">斗蟹游戏</a></li>
					<li><a href="#">飞翔下载</a></li>
					<li><a href="#">下载之家</a></li>
					<li><a href="#">吾爱破解</a></li>
				</ul>
			</div>
			<div class="footer">
				<span>404工作室版权所有</span>
				<br>
				<span>广西科师学院 XX级XX专业</span>
			</div>
		</div>
		<!-- 底部页面结束 -->
		
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