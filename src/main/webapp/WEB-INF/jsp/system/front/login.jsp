<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>登录页面 - 人力资源管理系统</title>
		<meta name="description" content="User login page" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="../static/ace/css/bootstrap.css" />
		<link rel="stylesheet" href="../static/ace/css/font-awesome.css" />
		<!-- text fonts -->
		<link rel="stylesheet" href="../static/ace/css/ace-fonts.css" />
		<!-- ace styles -->
		<link rel="stylesheet" href="../static/ace/css/ace.css" />
		<!--[if lte IE 9]>
			<link rel="stylesheet" href="../static/ace/css/ace-part2.css" />
		<![endif]-->
		<link rel="stylesheet" href="../static/ace/css/ace-rtl.css" />
		<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../static/ace/css/ace-ie.css" />
		<![endif]-->
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="../static/ace/js/html5shiv.js"></script>
		<script src="../static/ace/js/respond.js"></script>
		<![endif]-->
		<script>
        //window.setTimeout(showlxc,3000);
			var timer;
			function showlxc(){
				lxci = 1;
				//关闭提示晃动屏幕，注释掉这句话即可
				timer = setInterval(xzlxc2, 10);
			};
			var current = 0;
			function xzlxc(){
				current = (current)%360;
				document.body.style.transform = 'rotate('+current+'deg)';
				current ++;
				if(current>360){current = 0;}
			};
			var lxci = 1;
			var current2 = 1;
			function xzlxc2(){
				if(lxci>50){
					document.body.style.transform = 'rotate(0deg)';
					clearInterval(timer);
					return;
				}
				current = (current2)%360;
				document.body.style.transform = 'rotate('+current+'deg)';
				current ++;
				if(current2 == 1){current2 = -1;}else{current2 = 1;}
				lxci++;
			};
		</script>
	</head>

	<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-users red"></i>
									<span class="red">人力</span>
									<span class="white" id="id-text2">资源管理系统</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; 颜豪 刘熙财</h4>
							</div>
							<div class="space-6"></div>
							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												请输入您的登录信息
											</h4>
											<div class="space-6"></div>
											<form action="front/${msg }.do" method="post">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="USERNAME" id="userName" class="form-control" placeholder="账号" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="PASSWORD" id="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<div style="float: left;width: 68%">
																<input type="text" name="code" id="code" class="form-control" placeholder="验证码" style="width: 97%"/>
																</div>
																<div style="float: left;">
																<i><img style="height:33px;" id="codeImg" alt="点击更换" title="点击更换" src="" /></i>
															</div>
														</span>
													</label>
													<div class="space"></div>
													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" id="saveid"  onclick="savePaw();" class="ace" />
															<span class="lbl">记住我</span>
														</label>
														<button type="button" class="width-35 pull-right btn btn-sm btn-primary" onclick="severCheck();">
															<i class="ace-icon fa fa-key"></i>
															<span class="bigger-110">登录</span>
														</button>
													</div>
													<div class="space-4"></div>
												</fieldset>
											</form>
											<div class="social-or-login center">
											<%--	<span class="bigger-110">Or Login Using</span>--%>
											</div>
											<div class="space-6"></div>
											<%--<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>
												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>
												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>--%>
										</div><!-- /.widget-main -->
										<div class="toolbar clearfix">
											<div>
												<a href="#" data-target="#forgot-box" class="forgot-password-link">
													<i class="ace-icon fa fa-arrow-left"></i>
													忘记了密码
												</a>
											</div>
											<div>
												<a href="#" data-target="#signup-box" class="user-signup-link">
													注册
													<i class="ace-icon fa fa-arrow-right"></i>
												</a>
											</div>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->
								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												找回密码
											</h4>
											<div class="space-6"></div>
											<p>
												请输入你的E-mail并接收邮件验证链接
											</p>
											<form action="front/find_pwd.do" method="post" id="findPassword">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="EMAIL" id="findEMAIL" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<div class="clearfix">
														<button type="button" class="width-35 pull-right btn btn-sm btn-danger" onclick="sendPwdEmail()">
															<i class="ace-icon fa fa-lightbulb-o"></i>
															<span class="bigger-110">发送给我!</span>
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /.widget-main -->
										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												返回登录
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												新用户注册
											</h4>
											<div class="space-6"></div>
											<p> 输入你的详细信息: </p>
											<form action="front/front_regiester.do" method="post" id="regiesterForm">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="EMAIL" id="r_email" onblur="hasE('${pd.USERNAME }')"  class="form-control" placeholder="电子邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="USERNAME" id="r_userName" onblur="hasU()" class="form-control" placeholder="账号" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="NAME" id="r_name"    class="form-control" placeholder="姓名" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="SFID" id="SFID"   class="form-control" placeholder="身份证号" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="PASSWORD" id="r_password" class="form-control" placeholder="请输入密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="chkpwd" id="chkpwd" class="form-control" placeholder="输入确认密码" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
													</label>
													<label class="block">
														<input type="checkbox" class="ace" id="iAgree" />
														<span class="lbl">
															我接受
															<a href="#">用户协议</a>
														</span>
													</label>
													<div class="space-24"></div>
													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">重置</span>
														</button>
														<button type="button" class="width-65 pull-right btn btn-sm btn-success" onclick="save()">
															<span class="bigger-110">注册</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>
										<div class="toolbar center">
											<a href="#" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												去登录
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
							</div><!-- /.position-relative -->
							<div class="navbar-fixed-top align-right">
								<br />
								&nbsp;
								<a id="btn-login-dark" href="#">Dark</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-blur" href="#">Blur</a>
								&nbsp;
								<span class="blue">/</span>
								&nbsp;
								<a id="btn-login-light" href="#">Light</a>
								&nbsp; &nbsp; &nbsp;
							</div>
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->
		<!-- basic scripts -->
		<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='../static/ace/js/jquery.js'>"+"<"+"/script>");
		</script>
		<!-- <![endif]-->
		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../static/ace/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->
		<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='../static/ace/js/jquery.mobile.custom.js'>"+"<"+"/script>");
		</script>
		<!-- inline scripts related to this page -->
		<script type="text/javascript">
			jQuery(function($) {
			 $(document).on('click', '.toolbar a[data-target]', function(e) {
				e.preventDefault();
				var target = $(this).data('target');
				$('.widget-box.visible').removeClass('visible');//hide others
				$(target).addClass('visible');//show target
			 });
			});

			//you don't need this, just used for changing background
			jQuery(function($) {
			 $('#btn-login-dark').on('click', function(e) {
				$('body').attr('class', 'login-layout');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-light').on('click', function(e) {
				$('body').attr('class', 'login-layout light-login');
				$('#id-text2').attr('class', 'grey');
				$('#id-company-text').attr('class', 'blue');
				
				e.preventDefault();
			 });
			 $('#btn-login-blur').on('click', function(e) {
				$('body').attr('class', 'login-layout blur-login');
				$('#id-text2').attr('class', 'white');
				$('#id-company-text').attr('class', 'light-blue');
				
				e.preventDefault();
			 });
			 
			});

            //服务器校验
            function severCheck(){
                if(check()){
                    var userName = $("#userName").val();
                    var password = $("#password").val();
                    var code = "qq1094921525lxc"+userName+",lxc,"+password+"QQ1094921525lxc"+",lxc,"+$("#code").val();
                    $.ajax({
                        type: "POST",
                        url: 'login',
                        data: {KEYDATA:code,tm:new Date().getTime()},
                        dataType:'json',
                        cache: false,
                        success: function(data){
                            if("success" == data.result){
                                saveCookie();
                                window.location.href="/front/main/index";
                            }else if("usererror" == data.result){
                                $("#userName").tips({
                                    side : 1,
                                    msg : "用户名或密码有误",
                                    bg : '#FF5080',
                                    time : 15
                                });
                                showlxc();
                                $("#userName").focus();
                            }else if("codeerror" == data.result){
                                $("#code").tips({
                                    side : 1,
                                    msg : "验证码输入有误",
                                    bg : '#FF5080',
                                    time : 15
                                });
                                showlxc();
                                $("#code").focus();
                            }else{
                                $("#userName").tips({
                                    side : 1,
                                    msg : "缺少参数",
                                    bg : '#FF5080',
                                    time : 15
                                });
                                showlxc();
                                $("#userName").focus();
                            }
                        }
                    });
                }
            }

            function savePaw() {
                if (!$("#saveid").attr("checked")) {
                    $.cookie('userName', '', {
                        expires : -1
                    });
                    $.cookie('password', '', {
                        expires : -1
                    });
                    $("#userName").val('');
                    $("#password").val('');
                }
            }

            $(document).ready(function() {
                changeCode();
                $("#codeImg").bind("click", changeCode);
            });

            function changeCode() {
                $("#codeImg").attr("src", "/code.do?t=" + genTimestamp());
            }

            function genTimestamp() {
                var time = new Date();
                return time.getTime();
            }

            //客户端校验
            function check() {
                if ($("#userName").val() == "") {
                    $("#userName").tips({
                        side : 2,
                        msg : '用户名不得为空',
                        bg : '#AE81FF',
                        time : 3
                    });
                    showlxc();
                    $("#userName").focus();
                    return false;
                } else {
                    $("#userName").val(jQuery.trim($('#userName').val()));
                }
                if ($("#password").val() == "") {
                    $("#password").tips({
                        side : 2,
                        msg : '密码不得为空',
                        bg : '#AE81FF',
                        time : 3
                    });
                    showlxc();
                    $("#password").focus();
                    return false;
                }
                if ($("#code").val() == "") {
                    $("#code").tips({
                        side : 1,
                        msg : '验证码不得为空',
                        bg : '#AE81FF',
                        time : 3
                    });
                    showlxc();
                    $("#code").focus();
                    return false;
                }
                $("#login-box").tips({
                    side : 1,
                    msg : '正在登录 , 请稍后 ...',
                    bg : '#68B500',
                    time : 10
                });
                return true;
            }

            //记住密码
            function saveCookie() {
                if ($("#saveid").attr("checked")) {
                    $.cookie('userName', $("#userName").val(), {
                        expires : 7
                    });
                    $.cookie('password', $("#password").val(), {
                        expires : 7
                    });
                }
            }

            jQuery(function() {
                var userName = $.cookie('userName');
                var password = $.cookie('password');
                if (typeof(userName) != "undefined"
                    && typeof(password) != "undefined") {
                    $("#userName").val(userName);
                    $("#password").val(password);
                    $("#saveid").attr("checked", true);
                    $("#code").focus();
                }
            });

            //发送邮件
            function sendPwdEmail() {
                // 找回密码
                var EMAIL = $("#findEMAIL").val();
                // console.log(EMAIL);
                $.ajax({
                    type: "get",
                    url : '/front/find_pwd.do?EMAIL='+ EMAIL +'&tm='+new Date().getTime(),
                    //beforeSend: validateData,
                    cache: false,
                    success: function(data) {
                        console.log(data);
                        if (data != null && data.length > 0) {
                            if (data.msg == 'ok') {
                                $("#msg").tips({
                                    side: 3,
                                    msg: '发送成功',
                                    bg: '#68B500',
                                    time: 4
                                });
                            } else {
                                $("#msg").tips({
                                    side: 3,
                                    msg: '邮件发送失败,请联系管理员（18101298728）检查邮件服务器配置是否正确!',
                                    bg: '#FF0000',
                                    time: 6
                                });
                            }
                            setTimeout("close()", 6000);
                            timers(5);
                        }
                    }
                });
            }

            //保存
            function save(){
                if($("#iAgree").val() != true){
                    $("#iAgree").tips({
                        side:3,
                        msg:'请勾选用户协议',
                        bg:'#AE81FF',
                        time:2
                    });
                    return false;
				}
                if($("#r_userName").val()=="" || $("#r_userName").val()=="此用户名已存在!"){
                    $("#r_userName").tips({
                        side:3,
                        msg:'输入账号',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#r_userName").focus();
                    $("#r_userName").val('');
                    $("#r_userName").css("background-color","white");
                    return false;
                }else{
                    $("#r_userName").val(jQuery.trim($('#r_userName').val()));
                }
                if($("#EMAIL").val()==""){

                    $("#EMAIL").tips({
                        side:3,
                        msg:'输入邮箱',
                        bg:'#AE81FF',
                        time:3
                    });
                    $("#EMAIL").focus();
                    return false;
                }else if(!ismail($("#EMAIL").val())){
                    $("#EMAIL").tips({
                        side:3,
                        msg:'邮箱格式不正确',
                        bg:'#AE81FF',
                        time:3
                    });
                    $("#EMAIL").focus();
                    return false;
                }
                if($("#user_id").val()=="" && $("#password").val()==""){
                    $("#password").tips({
                        side:3,
                        msg:'输入密码',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#password").focus();
                    return false;
                }
                if($("#password").val()!=$("#chkpwd").val()){
                    $("#chkpwd").tips({
                        side:3,
                        msg:'两次密码不相同',
                        bg:'#AE81FF',
                        time:3
                    });
                    $("#chkpwd").focus();
                    return false;
                }
                if($("#name").val()==""){
                    $("#name").tips({
                        side:3,
                        msg:'输入姓名',
                        bg:'#AE81FF',
                        time:3
                    });
                    $("#name").focus();
                    return false;
                }
                    $("#regiesterForm").submit();
            }

            //注册 判断用户名是否存在
            function hasU(){
                var USERNAME = $("#r_userName").val();
                $.ajax({
                    type: "POST",
                    url: '<%=basePath%>happuser/hasU.do',
                    data: {USERNAME:USERNAME,tm:new Date().getTime()},
                    dataType:'json',
                    cache: false,
                    success: function(data){
                        if("success" == data.result){
                            $("#r_userName").css("background-color","#D16E6C");
                        }else{
                            $("#r_userName").css("background-color","#D16E6C");
                            setTimeout("$('#r_userName').val('此用户名已存在!')",500);
                        }
                    }
                });
            }

            // 注册 判断邮箱是否存在
            function hasE(USERNAME){
                var EMAIL = $("#r_email").val();
                $.ajax({
                    type: "POST",
                    url: '<%=basePath%>happuser/hasE.do',
                    data: {EMAIL:EMAIL,USERNAME:USERNAME,tm:new Date().getTime()},
                    dataType:'json',
                    cache: false,
                    success: function(data){
                        if("success" != data.result){
                            $("#r_email").tips({
                                side:3,
                                msg:'邮箱'+EMAIL+'已存在',
                                bg:'#AE81FF',
                                time:3
                            });
                            $('#r_email').val('');
                        }
                    }
                });
            }

            //倒计时
            function timers(intDiff){
                window.setInterval(function(){
                    $('#second_shows').html('<s></s>'+intDiff+'秒');
                    intDiff--;
                }, 1000);
            }
		</script>
		<c:if test="${'1' == pd.msg}">
			<script type="text/javascript">
                $(tsMsg());
                function tsMsg(){
                    alert('此用户在其它终端已经早于您登录,您暂时无法登录');
                }
			</script>
		</c:if>
		<c:if test="${'2' == pd.msg}">
			<script type="text/javascript">
                $(tsMsg());
                function tsMsg(){
                    alert('您被系统管理员强制下线');
                }
			</script>
		</c:if>
		<script src="../static/login/js/bootstrap.min.js"></script>
		<script src="../static/js/jquery-1.7.2.js"></script>
		<script src="../static/login/js/jquery.easing.1.3.js"></script>
		<script src="../static/login/js/jquery.mobile.customized.min.js"></script>
		<script src="../static/login/js/camera.min.js"></script>
	<%--	<script src="../static/login/js/templatemo_script.js"></script>--%>
		<script type="text/javascript" src="../static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	</body>
</html>
