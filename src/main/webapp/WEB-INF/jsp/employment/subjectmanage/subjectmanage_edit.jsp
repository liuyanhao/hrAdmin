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
					
					<form action="subjectmanage/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="SUBJECTMANAGE_ID" id="SUBJECTMANAGE_ID" value="${pd.SUBJECTMANAGE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td  style="width:75px;text-align: right;padding-top: 13px;">试卷分类:</td>
								<td>
									<select id="SUBJECT_TYPE" name="SUBJECT_TYPE" onchange="subjectType()" style="width:98%;">
										<option value="" >请选择</option>
										<c:forEach items="${typeList}" var="var" varStatus="vs" >
											<option value="${var.SUBJECTTYPE_ID}" <c:if test="${var.SUBJECTTYPE_ID == pd.SUBJECTTYPE_ID}">selected</c:if> >${var.SUBJECT_TYPE_NAME}</option>
										</c:forEach>
									</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">试题类型:</td>
								<td>
									<select name="SUBJECT_TYPE" id="SUB_TYPE" style="width:98%;">
										<option value="" >请选择</option>
									</select>
								</td>
							</tr>
							<c:if test="${msg == 'edit'}">
								<tr>
									<td style="width:75px;text-align: right;padding-top: 13px;">出题人:</td>
									<td>${pd.ISSUE_PERSON}</td>
									<td style="width:75px;text-align: right;padding-top: 13px;">出题时间:</td>
									<td>${pd.ISSUE_TIME}</td>
								</tr>
							</c:if>
							<tr>
								<td  style="width:75px;text-align: right;padding-top: 13px;">题目:</td>
								<td colspan="3" >
                                    <textarea rows="6" name="SUBJECT_NAME" id="SUBJECT_NAME"  maxlength="255" placeholder="这里输入题目" title="题目" style="width:98%;">${pd.SUBJECT_NAME}</textarea>
                                </td>
							</tr>

							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">A选项:</td>
								<td><input type="text" name="SELECT_A" id="SELECT_A" value="${pd.SELECT_A}" maxlength="50" placeholder="这里输入A选项" title="A选项" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">B选项:</td>
								<td><input type="text" name="SELECT_B" id="SELECT_B" value="${pd.SELECT_B}" maxlength="50" placeholder="这里输入B选项" title="B选项" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">C选项:</td>
								<td><input type="text" name="SELECT_C" id="SELECT_C" value="${pd.SELECT_C}" maxlength="50" placeholder="这里输入C选项" title="C选项" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">D选项:</td>
								<td><input type="text" name="SELECT_D" id="SELECT_D" value="${pd.SELECT_D}" maxlength="50" placeholder="这里输入D选项" title="D选项" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">E选项:</td>
								<td><input type="text" name="SELECT_E" id="SELECT_E" value="${pd.SELECT_E}" maxlength="50" placeholder="这里输入E选项" title="E选项" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">F选项:</td>
								<td><input type="text" name="SELECT_F" id="SELECT_F" value="${pd.SELECT_F}" maxlength="50" placeholder="这里输入F选项" title="F选项" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">正确选项:</td>
								<td><input type="text" name="SELECT_TURE" id="SELECT_TURE" value="${pd.SELECT_TURE}" maxlength="5" placeholder="这里输入正确选项" title="正确选项" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">分值:</td>
								<td><input type="number" name="SCORE" id="SCORE" value="${pd.SCORE}" maxlength="32" placeholder="这里输入分值" title="分值" style="width:98%;"/></td>
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
		$(top.hangge()); //关闭加载状态
        var SUBJECTTYPE_Id = '${pd.SUBJECT_TYPE != null ? pd.SUBJECT_TYPE : ""}';
        window.onload = function(){
            if(SUBJECTTYPE_Id != null){
                subjectType();
			}
        }
		//试题类型 级联查询
		function subjectType(){
		    var subjectTypeId = $("#SUBJECT_TYPE").val();
            $.ajax({
                type:"GET",
                url: "<%=basePath%>subjecttypemx/select-subject-type.do?SUBJECTTYPE_ID=" + subjectTypeId + "&tm="+new Date().getTime(),
                success: function(data){
                    //  console.log(data);
                    var html="<option value='' >请选择</option>";
                    if(data != null && data.length > 0){
                        var select ="";
                        for(var i=0; i<data.length; i++){
                            if(data[i].SUBJECTTYPEMX_ID == SUBJECTTYPE_Id){ select ="selected";}else {select ="";}
                            html+="<option value='"+data[i].SUBJECTTYPEMX_ID+"' " + select + " >"+data[i].SUBJECTMANAGE+"</option>";
                        }
                    }
                    $("#SUB_TYPE").html(html);
                    $("#SUB_TYPE").trigger("create");
                }
            })
		}
		//保存
		function save(){
			if($("#SUBJECT_NAME").val()==""){
				$("#SUBJECT_NAME").tips({
					side:3,
		            msg:'请输入题目',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_NAME").focus();
			return false;
			}
			if($("#SUBJECT_TYPE").val()==""){
				$("#SUBJECT_TYPE").tips({
					side:3,
		            msg:'请选择试卷类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUBJECT_TYPE").focus();
			return false;
			}
			if($("#SELECT_A").val()==""){
				$("#SELECT_A").tips({
					side:3,
		            msg:'请输入A选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_A").focus();
			return false;
			}
			if($("#SELECT_B").val()==""){
				$("#SELECT_B").tips({
					side:3,
		            msg:'请输入B选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_B").focus();
			return false;
			}
			if($("#SELECT_C").val()==""){
				$("#SELECT_C").tips({
					side:3,
		            msg:'请输入C选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_C").focus();
			return false;
			}
			if($("#SELECT_D").val()==""){
				$("#SELECT_D").tips({
					side:3,
		            msg:'请输入D选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_D").focus();
			return false;
			}
			if($("#SELECT_E").val()==""){
				$("#SELECT_E").tips({
					side:3,
		            msg:'请输入E选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_E").focus();
			return false;
			}
			if($("#SELECT_F").val()==""){
				$("#SELECT_F").tips({
					side:3,
		            msg:'请输入F选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_F").focus();
			return false;
			}
			if($("#SELECT_TURE").val()==""){
				$("#SELECT_TURE").tips({
					side:3,
		            msg:'请输入正确选项',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SELECT_TURE").focus();
			return false;
			}

            if($("#SCORE").val()==""){
                $("#SCORE").tips({
                    side:3,
                    msg:'请输入分值',
                    bg:'#AE81FF',
                    time:2
                });
                $("#SCORE").focus();
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