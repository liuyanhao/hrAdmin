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
		<title>重置密码 - 人力资源管理系统</title>
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

	<body class="login-layout light-login">
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
								<h4 class="light-blue" id="id-company-text">&copy; 颜豪科技</h4>
							</div>
							<div class="space-6">
								<br/><img src="static/images/jzx.gif" id='msgp' /><br/>
								<h4 class="lighter block green" id='msg'></h4>
								<strong id="second_shows" class="red">6秒</strong>后关闭
							</div>
							<div class="position-relative">
								<div id="resetPwd-box" class="resetPwd-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="ace-icon fa fa-users blue"></i>
												重置密码
											</h4>
											<div class="space-6"></div>
											<p> 设置您新的密码: </p>
											<form action="<%=basePath%>front/resetPwd.do" method="post" id="restPwdForm">
												<input type="hidden" name="UUID" id="UUID" value="${pd.UUID}">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" name="EMAIL" id="email" value="${pd.EMAIL}" readonly="readonly" class="form-control" placeholder="电子邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text"  id="userName"  value="${pd.USERNAME}" readonly="readonly" class="form-control" placeholder="账号" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="PASSWORD" id="PASSWORD"  class="form-control" placeholder="请输入密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="chkpwd" id="chkpwd" class="form-control" placeholder="输入确认密码" />
															<i class="ace-icon fa fa-retweet"></i>
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
													<div class="space-24"></div>
													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="ace-icon fa fa-refresh"></i>
															<span class="bigger-110">重置</span>
														</button>
														<button type="button" class="width-65 pull-right btn btn-sm btn-success"  onclick="restPwd()">
															<span class="bigger-110">确定</span>
															<i class="ace-icon fa fa-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>
										<div class="toolbar center">
											<a href="<%=basePath%>front/login.do" data-target="#login-box" class="back-to-login-link">
												<i class="ace-icon fa fa-arrow-left"></i>
												去登录
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.signup-box -->
								<div id="resetPwdAccess-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="ace-icon fa fa-key"></i>
												找回密码
											</h4>
											<div class="space-6"></div>
											<p>

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
											<a href="<%=basePath%>front/login.do" data-target="#login-box" class="back-to-login-link">
												返回登录
												<i class="ace-icon fa fa-arrow-right"></i>
											</a>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.resetPwdAccess-box -->
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

            function restPwd(){
                if($("#PASSWORD").val()==""){
                    $("#PASSWORD").tips({
                        side:3,
                        msg:'请输入密码',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#PASSWORD").focus();
                    return false;
                }
                if($("#chkpwd").val()==""){
                    $("#chkpwd").tips({
                        side:3,
                        msg:'请输确认密码',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#chkpwd").focus();
                    return false;
                }
                if($("#PASSWORD").val()!=$("#chkpwd").val()){
                    $("#chkpwd").tips({
                        side:3,
                        msg:'两次密码不相同',
                        bg:'#AE81FF',
                        time:3
                    });
                    $("#chkpwd").focus();
                    return false;
                }
                if($("#code").val()==""){
                    $("#code").tips({
                        side:3,
                        msg:'请输确认验证码',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#code").focus();
                    return false;
                }
                $("#restPwdForm").submit();
			}

            /**

             $.ajax({
                    type: "post",
                    url : '/front/resetPwd.do?tm='+new Date().getTime(),
					data:{UUID:UUID,EMAIL:EMAIL,PASSWORD:PASSWORD,chkpwd:chkpwd,code:code},
                    //beforeSend: validateData,
                    dataType:'json',
                    cache: false,
                    success: function(data) { debugger;
                        console.log(data);
                        if (data != null && data.length > 0) {
                            if (data.result == "success") {
                                debugger;
                                $("resetPwd-box").removeClass("visible");
                                $("resetPwdAccess-box").addClass("visible");
                                $("#msg").tips({
                                    side: 3,
                                    msg: '重置密码成功',
                                    bg: '#68B500',
                                    time: 4
                                });
                            } else {
                                $("#msg").tips({
                                    side: 3,
                                    msg: '重置密码失败,请联系管理员（18911780490）!',
                                    bg: '#FF0000',
                                    time: 6
                                });
                            }
                            setTimeout("close()", 6000);
                            timers(5);
                        }
                    }
                });

			 *
             */

		</script>
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
