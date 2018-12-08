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
		<title>重置密码结果 - 人力资源管理系统</title>
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
									<span class="grey" id="id-text2">资源管理系统</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; 颜豪 刘熙财</h4>
							</div>
							<div class="space-6">

							</div>
							<div class="position-relative">
								<div id="resetPwdAccess-box" class="forgot-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<br/><img src="<%=basePath%>static/images/jzx.gif" id='msg' />
											<h4 class="lighter block red" id='errInfo'>${errInfo}</h4>
											<strong id="second_shows" class="green">6秒</strong>后关闭
											<div class="space-6"></div>
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
                timer(5);
            });

            //倒计时
            function timer(intDiff){
                window.setInterval(function(){
                    $('#second_shows').html('<s></s>'+intDiff+'秒');
                    intDiff--;
                }, 1000);
            }
		</script>
		<script src="../static/login/js/bootstrap.min.js"></script>
		<script src="../static/js/jquery-1.7.2.js"></script>
		<script src="../static/login/js/jquery.easing.1.3.js"></script>
		<script src="../static/login/js/jquery.mobile.customized.min.js"></script>
		<script src="../static/login/js/camera.min.js"></script>
		<script type="text/javascript" src="../static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="../static/js/jquery.cookie.js"></script>
	</body>
</html>
