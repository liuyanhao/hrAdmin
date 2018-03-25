﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../system/index/top.jsp"%>
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
					<div class="hr hr-18 dotted hr-double"></div>
					<div class="row">
						<div class="col-xs-12">

						<!-- 存放生成的html开头  -->
						<form class="form-horizontal" role="form" id="FORM" action="wantexam/saveSubject.do">
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="JOB_TYPE_ID">职位分类：</label>
								<div class="col-sm-9">
									<select  name="JOB_TYPE_ID" id="JOB_TYPE_ID"  placeholder="这里选择工作职位类别" onchange="jobType()"  title="职位类别" class="col-xs-10 col-sm-5" >
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
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" >出题人：</label>
								<div class="col-sm-9">
									<input type="hidden" name="setThemeUser"  value="${setThemeUser}">
									<p class="form-control-static">${setThemeUser}</p>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="JOB_MESSAGE_ID">职位名称：</label>
								<div class="col-sm-9">
									<select name="JOB_MESSAGE_ID" id="JOB_MESSAGE_ID" placeholder="请选择职位名称"  class="col-xs-10 col-sm-5">
										<option value=""></option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="EXAM_TIME">考试时间：</label>
								<div class="col-sm-9">
									<input type="number" id="EXAM_TIME" placeholder="考试时间" class="col-xs-10 col-sm-5"><span class="input-icon input-icon-right">分钟</span>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							出题信息
						</div>
						<div class="col-md-6">

						</div>
							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
								<thead>
								<tr>
									<th class="center">试题分类</th>
									<th class="center">题目类型</th>
									<th class="center">可用题数</th>
									<th class="center">出题数</th>
								</tr>
								</thead>

								<tbody>
								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${not empty varList}">
											<c:forEach items="${varList}" var="var" varStatus="vs">
												<tr>
													<td class='center'>${var.SUBJECT_TYPE_NAME}</td>
													<td class='center'>${var.SUBJECTMANAGE}</td>
													<td class='center'>${var.counts}</td>
													<td class="center">
														 <input id="" name="" type="number"  value="0" />
													</td>
												</tr>

											</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="100" class="center" >没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>
								</tbody>
							</table>
						</form>
						<!-- 存放生成的html结尾 -->

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>
s	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../system/index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		$(top.hangge());

        //选择职位类别 级联查询
        function jobType(){
            var JOB_TYPE_ID = $("#JOB_TYPE_ID").val();
            $("#JOB_MESSAGE_ID option").remove();
            $.ajax({
                type:"GET",
                url: "<%=basePath%>jobmessage/select-job-name.do?JOB_TYPE_ID=" + JOB_TYPE_ID + "&tm="+new Date().getTime(),
                success: function(data){
                    //  console.log(data);
                    if(data != null && data.length > 0){
                        var html="<option value=''>请选择</option>";
                        for(var i=0; i<data.length; i++){
                            html+="<option value='"+data[i].JOB_MESSAGE_ID+"' >"+data[i].JOB_NAME+"</option>";
                        }
                    }
                    $("#JOB_MESSAGE_ID").html(html);
                    $("#JOB_MESSAGE_ID").trigger("create");
                }
            })
        }
		$(function() {
                //日期框
                $('.date-picker').datepicker({autoclose: true, todayHighlight: true});
                //下拉框
                if (!ace.vars['touch']) {
                    $('.chosen-select').chosen({allow_single_deselect: true});
                    $(window)
                        .off('resize.chosen')
                        .on('resize.chosen', function () {
                            $('.chosen-select').each(function () {
                                var $this = $(this);
                                $this.next().css({'width': $this.parent().width()});
                            });
                        }).trigger('resize.chosen');
                    $(document).on('settings.ace.chosen', function (e, event_name, event_val) {
                        if (event_name != 'sidebar_collapsed') return;
                        $('.chosen-select').each(function () {
                            var $this = $(this);
                            $this.next().css({'width': $this.parent().width()});
                        });
                    });
                    $('#chosen-multiple-style .btn').on('click', function (e) {
                        var target = $(this).find('input[type=radio]');
                        var which = parseInt(target.val());
                        if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
                        else $('#form-field-select-4').removeClass('tag-input-style');
                    });
                }
            });
	</script>
</body>
</html>