<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- 下拉框 -->
	<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/index/top.jsp"%>
	<!-- 日期框 -->
	<link rel="stylesheet" href="static/ace/css/datepicker.css" />
</head>
<body class="no-skin">
<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<!-- /section:basics/sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<form action="interviewinfo/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="INTERVIEWINFO_ID" id="INTERVIEWINFO_ID" value="${pd.INTERVIEWINFO_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录用状态:</td>
								<td><input type="number" name="EMPLOYEE_STATE" id="EMPLOYEE_STATE" value="${pd.EMPLOYEE_STATE}" maxlength="32" placeholder="这里输入录用状态" title="录用状态" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录用时间:</td>
								<td><input class="span10 date-picker" name="EMPLOYEE_TIME" id="EMPLOYEE_TIME" value="${pd.EMPLOYEE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="录用时间" title="录用时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招聘人id:</td>
								<td><input type="text" name="RESUME_USER_ID" id="RESUME_USER_ID" value="${pd.RESUME_USER_ID}" maxlength="32" placeholder="这里输入招聘人id" title="招聘人id" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招聘人姓名:</td>
								<td><input type="text" name="RESUME_USER_NAME" id="RESUME_USER_NAME" value="${pd.RESUME_USER_NAME}" maxlength="20" placeholder="这里输入招聘人姓名" title="招聘人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
						</table>
						</div>
						<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
					</form>
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
	</div>
	<!-- /.main-content -->
</div>
<!-- /.main-container -->


	<!-- 页面底部js¨ -->
	<%@ include file="../../system/index/foot.jsp"%>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript">
		$(top.hangge());
		//保存
		function save(){
			if($("#EMPLOYEE_STATE").val()==""){
				$("#EMPLOYEE_STATE").tips({
					side:3,
		            msg:'请输入录用状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMPLOYEE_STATE").focus();
			return false;
			}
			if($("#EMPLOYEE_TIME").val()==""){
				$("#EMPLOYEE_TIME").tips({
					side:3,
		            msg:'请输入录用时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMPLOYEE_TIME").focus();
			return false;
			}
			if($("#RESUME_USER_ID").val()==""){
				$("#RESUME_USER_ID").tips({
					side:3,
		            msg:'请输入招聘人id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESUME_USER_ID").focus();
			return false;
			}
			if($("#RESUME_USER_NAME").val()==""){
				$("#RESUME_USER_NAME").tips({
					side:3,
		            msg:'请输入招聘人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESUME_USER_NAME").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}
		
		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
		});
		</script>
</body>
</html>