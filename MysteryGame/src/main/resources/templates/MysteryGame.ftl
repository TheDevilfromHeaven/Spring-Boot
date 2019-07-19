<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>404工作室</title>
		<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/4.3.1/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="/css/Home/MysteryGame.css" />
		<link rel="stylesheet" type="text/css" href="/css/banner/style.css" />
		<link rel="stylesheet" href="/fonts/iconfont.css">
		<link rel="stylesheet" href="/css/daohanglan/daohanglan.css">
		<script src="/webjars/jquery/3.2.1/dist/jquery.min.js"></script>
		<script src="/webjars/bootstrap/4.3.1/js/bootstrap.min.js"></script>	
		<script type="text/javascript" src="/js/LogAndReg/LogAndReg.js"></script>
		<script type="text/javascript" src="/js/banner/pic.js"></script>
		<script type="text/javascript" src="/js/daohang/daohang.js"></script>
		<script type="text/javascript" src="/js/Home/Home.js"></script>
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
						<a href="/LoginController/outLogin">退出</a>
						<#else>
						<a href="#" data-toggle="modal" data-target="#loginModel" data-dismiss="modal">登录</a>
						<a href="#" data-toggle="modal" data-target="#registerModel" data-dismiss="modal">注册</a>
					</#if>
				</div> 
			</div>
		</div>
		<div class="head_bottom">
				<div class="search">
					<form action="/SearchController/Search">
						<input type="text" placeholder="请输入关键词" name="keyword" />
						<button type="submit" class="but">
							<i></i>
						</button>
					</form>
				</div>
		</div>
		<div class="top_bottom">
			<div class="main_bottom">
				
				<div class="nav_bar_bottom">
					<ul>
						<li><a href="">首页</a></li>
						<li><a href="">单机</a></li>
						<li><a href="">手游</a></li>
						<li><a href="">网游</a></li>
						<li><a href="">页游</a></li>
						<li><a href="/ForumController/forum">论坛</a></li>
					</ul>
				</div>
			</div>
		</div>

		<div class="main">
			<div class="content">
	
				<!-- 正文顶部 -->
				<div class="content-top">
					<div class="content-top-left"><span class="iconfont icon-youxifenlei" style="font-size: 24px;"></span>游戏分类</div>
					<div class="line"></div>
					<div class="content-top-center">
						<div class="gameType1">
							<span class="type">手游推荐</span>
							<#list phone_recommend as phone_recommend>
								<a class="showGame" href="/GamesController/game?game_name_cn=${phone_recommend.game_name_cn}">${phone_recommend.game_name_cn}</a>
								<#if phone_recommend_index == 9>
									<#break>
								</#if>
							</#list>
						</div>
						<div class="gameType2">
							<span class="type">热门网游</span>
							<#list list as list>
								<a class="showGame" href="/GamesController/game?game_name_cn=${list.game_name}">${list.game_name}</a>
							</#list>
						</div>
						<div class="gameType3">
							<span class="type">新游推荐</span>
							<#list new_game as new_game>
								<a class="showGame" href="#">${new_game.game_name}</a>
							</#list>
						</div>
					</div>
				</div>
				
				
				<div class="online-head"><span class="iconfont icon-tuijian" style="font-size: 24px;"></span>热门推荐</div>
				<div class="line"></div>
				
				<!-- 正文中部 -->
				<div class="content-center">
						<!-- 图片 大小738px x 430px-->
						<div id="banner">
							<div class="pic">
								<ul>
									<li class="first"><img src="/img/banner/b1.jpg" alt="图片"></li>
									<li><img src="/img/banner/b2.jpg" alt="图片"></li>
									<li><img src="/img/banner/b3.jpg" alt="图片"></li>
									<li><img src="/img/banner/b4.jpg" alt="图片"></li>
									<li><img src="/img/banner/b5.jpg" alt="图片"></li>
								</ul>
							</div>
				
							<div class="but">
								<ul>
									<li class="first"></li>
									<li></li>
									<li></li>
									<li></li>
									<li></li>
								</ul>
							</div>
				
							<div class="picnav">
								<ul>
									<li class="first"><img src="/img/banner/b1.jpg" alt="图片"></li>
									<li><img src="/img/banner/b2.jpg" alt="图片"></li>
									<li><img src="/img/banner/b3.jpg" alt="图片"></li>
									<li><img src="/img/banner/b4.jpg" alt="图片"></li>
									<li><img src="/img/banner/b5.jpg" alt="图片"></li>
								</ul>
							</div>
						</div>
					
					<div style="width:38%">
						<#list list as list>
								<img src="${list.game_img}" class="show_game_img">
								<#if list_index=3>
									<#break>
								</#if>
						</#list>
					</div>
				</div>
	
				<div class="spe-head"><span class="iconfont icon-xiangguanzhuanti" style="font-size: 24px;"></span>相关专题</div>
				<div class="line"></div>
				<!-- 正文底部 -->
	
				<div class="content-spe">
					<div class="content-spe-left">
						<h4>2019年E3游戏展示</h4>
						<iframe style="width:100%;height:100%" src='http://player.youku.com/embed/XNDIyNDUwMzM4MA==' frameborder=0 'allowfullscreen'></iframe>
						<div style="width:100%;height:145px;">
							<p>近期E3游戏展给游戏奉上各种各样的新游戏，新预告和大量的游戏细节。</p>
							<p style="font-size:14px;text-indent: 2em;">任天堂在直面会的最后一刻放出了《塞尔达传说：荒野之息》续作的预告，视频中仅有塞尔达和林克的身影，没有太多信息，但这无法阻挡粉丝们分析猜测的热情。不少粉丝觉得从预告的调性来看，可能和《时之笛》的续作《姆吉拉的假面》有联系，然而根据IGN对游戏总监青沼英二的采访，可以确认《塞尔达传说：荒野之息》续作和《姆吉拉的假面》无关。</p>
						</div>
					</div>
					
					<div class="content-spe-center">
						<h5 style="margin-left:20px;"><span class="iconfont icon-xinwen" style="font-size: 24px;color:blue;"></span>热门游戏公告</h5>
						<#list new as new>
							<a href="/NewController/findNew?new_id=${new.new_id}" class="new_title">${new.new_title}</a>
						</#list>
					</div>
					<div class="content-spe-right">
						<ul>
							<h5><span class="iconfont icon-tuijian-copy-copy" style="font-size: 24px;height:25px;color:red;margin-top:-4px;"></span>热门游戏排行榜</h5>
							<#list list as list>
								<li>
									<span>${list_index+1}</span>
									<div class="off">${list.game_name}</div>
									<div class="game_img" style="display: none;">
										<img src="${list.game_img}" style="width:82%;height:160px;float:right;margin-top:15px">
									</div>
								</li>
							</#list>
						</ul>
					</div>
				</div>

			<div>
				<span class="sll">网页 - 游戏</span>
				<div class="line"></div>
				<div class="content-last"  style="overflow: auto;">
					<div class="content-last-left">
						<div class="yeyou">
							<span class="yeyou-1">经典页游</span> <a href="">更多</a>
							<div class="line1"></div>
							<div class="M7item_a">
								<div class="lis">
									<a href="" class="img" target="_blank"><img
										src="/img/Home/5.png" alt="斗罗大陆"></a>
									<div class="info">
										<a href="" class="bt" target="_blank"><span class="bt-1">斗罗大陆</span></a>
									</div>
								</div>
								<div class="lis">
									<a href="" class="img" target="_blank"><img
										src="/img/Home/0.jpg" alt="三十六计"></a>

									<div class="info">

										<a href="" class="bt" target="_blank"><span class="bt-1">三十六计</span></a>
									</div>
								</div>
								<div class="lis">
									<a href="" class="img" target="_blank"><img
										src="/img/Home/9.png" alt="武林三"></a>

									<div class="info">
										<a href="" class="bt" target="_blank"><span class="bt-1">武林三</span></a>
									</div>
								</div>
								<div class="lis">
									<a href="" class="img" target="_blank"><img
										src="/img/Home/7.jpg" alt="寒刀行"></a>

									<div class="info">
										<a href="" class="bt" target="_blank"><span class="bt-1">寒刀行</span></a>
									</div>
								</div>

							</div>
							<div class="QZ_title">
								<div class="btt">
									<span class="yeyou-1"></i>页游攻略</span> <a href="" target="_blank"
										class="mor">更多<i></i></a>
								</div>
							</div>


							<div class="M7item_b">
								<div class="news_item">
									<div class="lia_c">
										<a href="" target="_blank" class="lis">
											<div class="img">
												<img src="/img/Home/a1.jpg" alt="《武林三》珍珑棋局" />
											</div>
											<div class="bt">《武林三》珍珑棋局</div>
										</a> <a href="" target="_blank" class="lis">
											<div class="img">
												<img src="/img/Home/8.jpg" alt="《斗罗大陆》常见FAQ" />
											</div>
											<div class="bt">《斗罗大陆》常见FAQ</div>
										</a>
									</div>
									<ul class="lis_b">
										<li><span>06-03</span> <a href="" class="bt">《攻城掠地》二级盛世王朝攻略</a>

										</li>
										<li><a href="" class="bt">《攻城掠地》朱然通关攻略</a> <span>05-31</span>
										</li>
										<li><a href="" class="bt">《攻城掠地》武将战斗系统介绍</a> <span>05-31</span>
										</li>
										<li><a href="" class="bt">《攻城掠地》资源获取攻略</a> <span>05-31</span>
										</li>
										<li><a href="" class="bt" target="_blank">《地灵曲》门派介绍</a> <span>05-30</span>
										</li>
										<li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="content-last-right">
						<div class="content-last-right-left">
							<div class="btt">
								<span class="yeyou-1"></i>页游攻略</span> <a href="" target="_blank"
									class="mor">更多</a>
							</div>
							<div class="news_item">
								<div class="lis_a">
									<a href="" class="bt" target="_blank">开服赐礼超有料!《东宫皇子》喜乐大狂欢隆重揭幕</a>
								</div>
								<div class="a-1">
									<div class="a-1-1">
										<img src="/img/Home/6.png" alt="" />
									</div>
									<div class="a-1-2">《东宫皇子》喜迎开服，绝不仅限于七天，开服八天、十六天内皆有福利好礼，快来加入我们，大闹东宫和江湖，疯狂领大礼!开服期间天天都有盛大惊喜。</div>
								</div>
								<div class="news_item">
									<div class="lis_a">
										<a href="" class="bt" target="_blank">开服赐礼超有料!《东宫皇子》喜乐大狂欢隆重揭幕</a>
									</div>
									<div class="a-1">
										<div class="a-1-1">
											<img
												src="https://yeyou.3dmgame.com/uploads/images/thumbnews/20190530/1559183689_863206.jpg"
												alt="" />
										</div>
										<div class="a-1-2">《万灵召唤》是一款主打休闲冒险风的挂机放置类游戏。玩家扮演魔王，击败各位公主并将她们招入己方阵营；魔王与公主组成最强的队伍。</div>
									</div>

									<div class="a-2">
										<ul class="lis_b">
											<li><a href="#" class="bt" target="_blank">《三国杀》
													6月4日维护延时开服公告</a> <span>06-04</span></li>
											<li><a href="#" class="bt" target="_blank">《斩月屠龙》元神系统解析：第四角色毁天灭地!</a>
												<span>06-04</span></li>
											<li><a href="#" class="bt" target="_blank">《无限之心》梦幻回合战睡觉也升级今日上线</a>
												<span>06-04</span></li>
											<li><a href="#" class="bt" target="_blank">《三国计H5》6月4日9:00-12:00合服公告</a>
												<span>06-04</span></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="content-last-right-right">
							<div class="btt">
								<span class="yeyou-1"></i>页游攻略</span> <a href="" target="_blank"
									class="mor">更多</a>
							</div>
							<div class="title8">
								<div class="liss">
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b1">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
									<div class="box_a">
										<div style="display: inline-block;" class="name">
											<a href="javascript:void(0);">武动苍穹</a>
										</div>
										<div style="display: inline-block; margin-left: 10px;"
											class="lx">双线一区</div>
										<div style="display: inline-block; margin-left: 20px;"
											class="time">2019-06-04</div>
									</div>
									<div class="box_b">
										<div style="display: inline-block;" class="lxx">
											<a href="javascript:void(0);" class="img"><img
												src="https://yeyou.3dmgame.com/uploads/images/thumbgameh5/20190415/1555322383_702876.jpg"
												alt="武动苍穹"></a>
										</div>
										<div style="display: inline-block;" class="start">
											<span>开始游戏</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="content-last-under">
							<div class="content-last-under-1">
								<div class="btt">
									<span class="yeyou-1"></i>页游攻略</span> <a href="" target="_blank"
										class="mor">更多</a>
								</div>
							</div>
							<div class="content-last-under-2">
								<div class="content-a">
									<img src="/img/Home/1.jpg" />
								</div>
								<div class="content-a">
									<img src="/img/Home/3.jpg" />
								</div>
								<div class="content-a">
									<img src="/img/Home/4.jpg" />
								</div>
								<div class="content-a">
									<img src="/img/Home/2.png" />
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
			</div>
		</div>
		
		<!-- 正文结束 -->

		<!-- 页面底部 -->
		<!-- 友情链接 -->
		<div class="content-link">
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
