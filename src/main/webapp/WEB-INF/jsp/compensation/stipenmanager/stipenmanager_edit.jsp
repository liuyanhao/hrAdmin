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
					
					<form action="stipenmanager/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STIPENMANAGER_ID" id="STIPENMANAGER_ID" value="${pd.STIPENMANAGER_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬名称:</td>
								<td><input type="text" name="STIPEND_NAME" id="STIPEND_NAME" value="${pd.STIPEND_NAME}" maxlength="20" placeholder="这里输入薪酬名称" title="薪酬名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">登记人姓名:</td>
								<td><input type="text" name="STIPEND_USER_NAME" id="STIPEND_USER_NAME" value="${pd.STIPEND_USER_NAME}" maxlength="20" placeholder="这里输入登记人姓名" title="登记人姓名" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">交通补贴:</td>
								<td><input type="number" name="STIPEN_WEAL_JOURNEY" id="STIPEN_WEAL_JOURNEY" value="${pd.STIPEN_WEAL_JOURNEY}" maxlength="32" placeholder="这里输入交通补贴" title="交通补贴" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">午餐补贴:</td>
								<td><input type="number" name="STIPEN_WEAL_LUNCH" id="STIPEN_WEAL_LUNCH" value="${pd.STIPEN_WEAL_LUNCH}" maxlength="32" placeholder="这里输入午餐补贴" title="午餐补贴" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">登记时间:</td>
								<td><input class="span10 date-picker" name="GTIPEND_DATE" id="GTIPEND_DATE" value="${pd.GTIPEND_DATE}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="登记时间" title="登记时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪资类型:</td>
								<td><input type="number" name="STIPEND_TYPE" id="STIPEND_TYPE" value="${pd.STIPEND_TYPE}" maxlength="32" placeholder="这里输入薪资类型" title="薪资类型" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬总额:</td>
								<td><input type="number" name="STIPEND_WEAL" id="STIPEND_WEAL" value="${pd.STIPEND_WEAL}" maxlength="32" placeholder="这里输入薪酬总额" title="薪酬总额" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">审批状态:</td>
								<td><input type="number" name="STATUS" id="STATUS" value="${pd.STATUS}" maxlength="32" placeholder="这里输入审批状态" title="审批状态" style="width:98%;"/></td>
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
			if($("#STIPEND_NAME").val()==""){
				$("#STIPEND_NAME").tips({
					side:3,
		            msg:'请输入薪酬名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEND_NAME").focus();
			return false;
			}
			if($("#STIPEND_USER_NAME").val()==""){
				$("#STIPEND_USER_NAME").tips({
					side:3,
		            msg:'请输入登记人姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEND_USER_NAME").focus();
			return false;
			}
			if($("#STIPEN_WEAL_JOURNEY").val()==""){
				$("#STIPEN_WEAL_JOURNEY").tips({
					side:3,
		            msg:'请输入交通补贴',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEN_WEAL_JOURNEY").focus();
			return false;
			}
			if($("#STIPEN_WEAL_LUNCH").val()==""){
				$("#STIPEN_WEAL_LUNCH").tips({
					side:3,
		            msg:'请输入午餐补贴',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEN_WEAL_LUNCH").focus();
			return false;
			}
			if($("#GTIPEND_DATE").val()==""){
				$("#GTIPEND_DATE").tips({
					side:3,
		            msg:'请输入登记时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GTIPEND_DATE").focus();
			return false;
			}
			if($("#STIPEND_TYPE").val()==""){
				$("#STIPEND_TYPE").tips({
					side:3,
		            msg:'请输入薪资类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEND_TYPE").focus();
			return false;
			}
			if($("#STIPEND_WEAL").val()==""){
				$("#STIPEND_WEAL").tips({
					side:3,
		            msg:'请输入薪酬总额',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEND_WEAL").focus();
			return false;
			}
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请输入审批状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
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