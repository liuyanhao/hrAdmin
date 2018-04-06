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
					
					<form action="stipendmanager/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STIPENDMANAGER_ID" id="STIPEDNMANAGER_ID" value="${pd.STIPENDMANAGER_ID}"/>
						<input type="hidden" name="STATUS" id="STATUS" value="${pd.STATUS}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬名称:</td>
								<td><input type="text" name="STIPEND_NAME" id="STIPEND_NAME" value="${pd.STIPEND_NAME}" maxlength="20" placeholder="这里输入薪酬名称" title="薪酬名称" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪资类型:</td>
								<td>
									<select name="STIPENDTYPE_ID" id="STIPENDTYPE_ID" style="width:98%;">
										<option value="">请选择</option>
										<c:forEach items="${typeList}" var="var" varStatus="vs" >
											<option value="${var.STIPENDTYPE_ID}" <c:if test="${pd.STIPENDTYPE_ID == var.STIPENDTYPE_ID }"> selected</c:if> >${var.STIPENDNAME}</option>
										</c:forEach>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">基本薪资:</td>
								<td>
                                    <div class="input-group">
                                    <input type="number" name="BASE_STIPEND" id="BASE_STIPEND" value="${pd.BASE_STIPEND}" class="form-control" maxlength="32" placeholder="这里输入基本薪资" title="薪资类型" onkeyup="this.value=this.value.replace(/[^\d]/ig,'')" style="width:98%;"/>
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </td>
								<td style="width:75px;text-align: right;padding-top: 13px;">午餐补贴:</td>
								<td>
                                    <div class="input-group">
                                        <input type="number" name="STIPEN_WEAL_LUNCH" id="STIPEN_WEAL_LUNCH" value="${pd.STIPEN_WEAL_LUNCH}" maxlength="32" placeholder="这里输入午餐补贴" title="午餐补贴"onkeyup="this.value=this.value.replace(/[^\d]/ig,'')" style="width:98%;"/>
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">交通补贴:</td>
								<td>
                                    <div class="input-group">
                                        <input type="number" name="STIPEN_WEAL_JOURNEY" id="STIPEN_WEAL_JOURNEY" value="${pd.STIPEN_WEAL_JOURNEY}" maxlength="32" placeholder="这里输入交通补贴" title="交通补贴" onkeyup="this.value=this.value.replace(/[^\d]/ig,'')" style="width:98%;"/>
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </td>
								<td style="width:75px;text-align: right;padding-top: 13px;">薪酬总额:</td>
								<td>
                                    <div class="input-group">
                                        <input type="number" name="STIPEND_WEAL" id="STIPEND_WEAL" value="${pd.STIPEND_WEAL}" maxlength="32" placeholder="这里输入薪酬总额" title="薪酬总额" onkeyup="this.value=this.value.replace(/[^\d]/ig,'')" style="width:98%;"/>
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </td>
							</tr>
							<c:if test="${ msg == 'audit'}" >
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">登记时间:</td>
								<td>${pd.GTIPEND_DATE}</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">登记人:</td>
								<td>${pd.STIPEND_USER_NAME}</td>
							</tr>
							</c:if>
							<c:if test="${ msg == 'audit' && pd.STATUS == 0 }" >
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="audit(1);">通过</a>
									<a class="btn btn-mini btn-danger" onclick="audit(2);">拒绝</a>
								</td>
							</tr>
							</c:if>
							<c:if test="${msg == 'audit' && pd.STATUS != 0 }" >
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">审核状态:</td>
								<td><span style="color: #8a0e1b;font-size: 26px"><c:if test="${pd.STATUS == 1}">通过</c:if><c:if test="${pd.STATUS == 2}">不通过</c:if></span></td>
							</tr>
							</c:if>
							<c:if test="${msg == 'edit' || msg == 'save'}" >
							<tr>
								<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>
							</tr>
							</c:if>
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

		//审核
		function audit(status){
            $("#STATUS").val(status);
            $("#Form").submit();
            $("#zhongxin").hide();
            $("#zhongxin2").show();
		}
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
			if($("#STIPENDTYPE_ID").val()==""){
				$("#STIPENDTYPE_ID").tips({
					side:3,
		            msg:'请选择薪资类型',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STIPENDTYPE_ID").focus();
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