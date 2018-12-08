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
					
					<form action="grantidmanager/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="GRANTIDMANAGER_ID" id="GRANTIDMANAGER_ID" value="${pd.GRANTIDMANAGER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬总额:</td>
								<td><input type="text" name="GRANT_PRICE" id="GRANT_PRICE" value="${pd.GRANT_PRICE}" maxlength="255" placeholder="这里输入薪酬总额" title="薪酬总额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发放时间:</td>
								<td><input class="span10 date-picker" name="GRANT_TIME" id="GRANT_TIME" value="${pd.GRANT_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="发放时间" title="发放时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">发放人:</td>
								<td><input type="text" name="GRANT_USER" id="GRANT_USER" value="${pd.GRANT_USER}" maxlength="255" placeholder="这里输入发放人" title="发放人" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">审核状态:</td>
								<td>
									<select  name="GRANT_STATUS" id="GRANT_STATUS" placeholder="这里输入审核状态" title="审核状态" style="width:98%;">
										<option value="0" <c:if test="${pd.GRANT_STATUS ==0}">selected</c:if> >未审核</option>
										<option value="1" <c:if test="${pd.GRANT_STATUS ==1}">selected</c:if> >通过</option>
										<option value="2" <c:if test="${pd.GRANT_STATUS ==2}">selected</c:if> >未通过</option>
									</select>
								</td>
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
			if($("#GRANT_PRICE").val()==""){
				$("#GRANT_PRICE").tips({
					side:3,
		            msg:'请输入薪酬总额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRANT_PRICE").focus();
			return false;
			}
			if($("#GRANT_TIME").val()==""){
				$("#GRANT_TIME").tips({
					side:3,
		            msg:'请输入发放时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRANT_TIME").focus();
			return false;
			}
			if($("#GRANT_USER").val()==""){
				$("#GRANT_USER").tips({
					side:3,
		            msg:'请输入发放人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRANT_USER").focus();
			return false;
			}
			if($("#GRANT_STATUS").val()==""){
				$("#GRANT_STATUS").tips({
					side:3,
		            msg:'请选择审核状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GRANT_STATUS").focus();
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