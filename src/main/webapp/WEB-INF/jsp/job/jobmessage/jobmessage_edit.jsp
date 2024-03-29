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
					
					<form action="jobmessage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="JOB_MESSAGE_ID" id="JOB_MESSAGE_ID" value="${pd.JOB_MESSAGE_ID}"/>
						<input type="hidden" name="JOB_TYPE_ID" value="${pd.JOB_TYPE_ID}"/>

						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职位类别:</td>
								<td>
									<select id="JOB_TYPE_ID" name="JOB_TYPE_ID" disabled="disabled" title="职位类别" style="width:98%;">
										<option value="">请选择</option>
										<c:choose>
											<c:when test="${not empty jobTypeList}">
												<c:forEach items="${jobTypeList}" var="var" varStatus="vs">
													<option value="${var.JOB_TYPE_ID}" <c:if test="${pd.JOB_TYPE_ID == var.JOB_TYPE_ID}"> selected</c:if> >${var.TYPE_NAME}</option>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<option value=""></option>
											</c:otherwise>
										</c:choose>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">工作名称:</td>
								<td><input type="text" name="JOB_NAME" id="JOB_NAME" value="${pd.JOB_NAME}" maxlength="255" placeholder="这里输入工作名称" title="工作名称" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬待遇:</td>
								<td>

									<select  name="STIPENDTYPE_ID" id="STIPENDTYPE_ID" placeholder="这里选择薪资待遇" title="薪资待遇" style="width:98%;">
										<option>请选择</option>
										<c:forEach items="${stipendTypeList}" var="var" varStatus="vs">
											<option value="${var.STIPENDTYPE_ID}" <c:if test="var.STIPENDTYPE_ID == pd.STIPENDTYPE_ID">selected</c:if> >${var.STIPENDNAME}</option>
										</c:forEach>
									</select>
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

<c:if test="${'edit' == msg }">
	<div>
		<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>stipendtype/listOne.do?STIPENDTYPE_ID=${pd.STIPENDTYPE_ID}&JOB_TYPE_ID=${pd.JOB_TYPE_ID}" style="margin:0 auto;width:805px;height:368px;;"></iframe>
	</div>
</c:if>

<footer>
<div style="width: 100%;padding-bottom: 2px;" class="center">
	<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
	<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
</div>
</footer>

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
            if($("#JOB_TYPE_ID").val()==""){
                $("#JOB_TYPE_ID").tips({
                    side:3,
                    msg:'请选择职位类别',
                    bg:'#AE81FF',
                    time:2
                });
                $("#JOB_TYPE_ID").focus();
                return false;
            }
			if($("#JOB_NAME").val()==""){
				$("#JOB_NAME").tips({
					side:3,
		            msg:'请输入工作名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB_NAME").focus();
			return false;
			}
			if($("#STIPEND_MANAGER_ID").val()==""){
				$("#STIPEND_MANAGER_ID").tips({
					side:3,
		            msg:'请输入薪酬标准id',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPEND_MANAGER_ID").focus();
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