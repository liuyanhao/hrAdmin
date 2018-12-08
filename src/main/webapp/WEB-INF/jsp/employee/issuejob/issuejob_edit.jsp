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
					
					<form action="issuejob/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="ISSUEJOB_ID" id="ISSUEJOB_ID" value="${pd.ISSUEJOB_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:125px;text-align: right;padding-top: 13px;">职位类别:</td>
								<td><select name="JOB_TYPE_ID" id="JOB_TYPE_ID" onchange="jobType()" style="width:98%;" >
									<option value="">请选择</option>
									<c:choose>
										<c:when test="${not empty jobTypeList}">
											<c:forEach items="${jobTypeList}" var="var" varStatus="vs">
												<option value="${var.JOB_TYPE_ID}">${var.TYPE_NAME}</option>
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
								<td style="width:75px;text-align: right;padding-top: 13px;">工作职位:</td>
								<td>
									<select name="JOB_MESSAGE_ID" id="JOB_MESSAGE_ID" style="width:98%;">
										<option value=""></option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招聘人数:</td>
								<td><input type="number" name="COUNTS" id="COUNTS" value="${pd.COUNTS}" maxlength="32" placeholder="这里输入招聘人数" title="招聘人数" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">招聘时间:</td>
								<td><input class="span10 date-picker" name="FOUNDTIME" id="FOUNDTIME" value="${pd.FOUNDTIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="建档时间" title="建档时间" style="width:98%;"/></td>
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
		var  JobMessageId = '${pd.JOB_MESSAGE_ID}';
        window.onload = function(){
            if(JobMessageId != null && JobMessageId != ''){
                jobType();
            }
        }
        //选择职位类别 级联查询
        function jobType(){
            var JOB_TYPE_ID = $("#JOB_TYPE_ID").val();
            $("#JOB_ID option").remove();
            $.ajax({
                type:"GET",
                url: "<%=basePath%>jobmessage/select-job-name.do?JOB_TYPE_ID=" + JOB_TYPE_ID + "&tm="+new Date().getTime(),
                success: function(data){
                    //  console.log(data);
                    if(data != null && data.length > 0){
                        var html="<option value=''>请选择</option>";
                        var selectd ="";
                        for(var i=0; i<data.length; i++){
                            if(JobMessageId == data[i].JOB_MESSAGE_ID) selectd = "selectd";
                            html+="<option value='"+data[i].JOB_MESSAGE_ID+"'" +selectd + " >"+data[i].JOB_NAME+"</option>";
                        }
                    }
                    $("#JOB_MESSAGE_ID").html(html);
                    $("#JOB_MESSAGE_ID").trigger("create");
                }
            })
        }
		//保存
		function save(){
			if($("#JOB_MESSAGE_ID").val()==""){
				$("#JOB_MESSAGE_ID").tips({
					side:3,
		            msg:'请选择工作职位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB_MESSAGE_ID").focus();
			return false;
			}
			if($("#COUNT").val()==""){
				$("#COUNT").tips({
					side:3,
		            msg:'请输入招聘人数',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#COUNT").focus();
			return false;
			}
			if($("#FOUNDTIME").val()==""){
				$("#FOUNDTIME").tips({
					side:3,
		            msg:'请输入建档时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FOUNDTIME").focus();
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