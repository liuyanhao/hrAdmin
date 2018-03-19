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
					
					<form action="stipendtype/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STIPENDTYPE_ID" id="STIPENDTYPE_ID" value="${pd.STIPENDTYPE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪资类型:</td>
								<td><input type="text" name="STIPENDNAME" id="STIPENDNAME" value="${pd.STIPENDNAME}" maxlength="255" placeholder="这里输入薪资类型名称" title="薪资类型名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">是否启用:</td>
								<td>
									<select  name="ISREMOVE" id="ISREMOVE" style="width:98%;">
										<option value="0" <c:if test="${pd.ISREMOVE == 0}">selected </c:if> >停用</option>
										<option value="1" <c:if test="${pd.ISREMOVE == 1}">selected</c:if> >启用</option>
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
			if($("#STIPENDNAME").val()==""){
				$("#STIPENDNAME").tips({
					side:3,
		            msg:'请输入薪资类型名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPENDNAME").focus();
			return false;
			}
			if($("#ISREMOVE").val()==""){
				$("#ISREMOVE").tips({
					side:3,
		            msg:'请输入是否删除',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISREMOVE").focus();
			return false;
			}
			if($("#CREATEUSER").val()==""){
				$("#CREATEUSER").tips({
					side:3,
		            msg:'请输入创建人',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CREATEUSER").focus();
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