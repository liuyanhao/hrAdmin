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
								<td>
									<select id="EMPLOYEE_STATE" name="EMPLOYEE_STATE" style="width:98%;" >
										<option value="0" <c:if test="${pd.EMPLOYEE_STATE == 0}">selected</c:if> >未审核</option>
										<option value="1" <c:if test="${pd.EMPLOYEE_STATE == 1}">selected</c:if>>待面试</option>
										<option value="2" <c:if test="${pd.EMPLOYEE_STATE == 2}">selected</c:if>>待笔试</option>
										<option value="3" <c:if test="${pd.EMPLOYEE_STATE == 3}">selected</c:if>>待录用</option>
										<option value="4" <c:if test="${pd.EMPLOYEE_STATE == 4}">selected</c:if>>通过面试</option>
										<option value="5" <c:if test="${pd.EMPLOYEE_STATE == 5}">selected</c:if>>笔试通过</option>
										<option value="6" <c:if test="${pd.EMPLOYEE_STATE == 6}">selected</c:if>>笔试待审核</option>
										<option value="7" <c:if test="${pd.EMPLOYEE_STATE == 7}">selected</c:if>>未通过录用</option>
										<option value="8" <c:if test="${pd.EMPLOYEE_STATE == 8}">selected</c:if>>通过录用</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">录用时间:</td>
								<td><input class="span10 date-picker" name="EMPLOYEE_TIME" id="EMPLOYEE_TIME" value="${pd.EMPLOYEE_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="录用时间" title="录用时间" style="width:98%;"/></td>
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