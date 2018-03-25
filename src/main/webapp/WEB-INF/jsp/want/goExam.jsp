<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();	String basePath = request.getScheme() + "://" + request.getServerName()
        + ":" + request.getServerPort() + path + "/";
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
                            <form class="form-horizontal" role="form" action="wantexam/toExamList.do">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" >
                                        <b >开始考试</b>
                                    </label>
                                    <div class="col-sm-9">
                                        <p class="form-control-static"></p>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="JOB_TYPE_ID">职位类型：</label>
                                    <div class="col-sm-9">
                                        <input type="hidden" name="JOB_TYPE_ID" value="${pd.JOB_TYPE_ID}" />
                                        <select  name="JOB_TYPE_ID" id="JOB_TYPE_ID"  placeholder="这里选择工作职位类别" onchange="jobType()"  title="职位类别" class="col-xs-10 col-sm-5">
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
                                    <label class="col-sm-3 control-label no-padding-right" for="CARD_ID">身份证号：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="CARD_ID" id="CARD_ID"  placeholder="身份证号码" class="col-xs-10 col-sm-5">
                                    </div>
                                </div>
                         </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-9 control-label no-padding-right" style="color: red"  >${message}</label>
                                <div class="col-sm-3">
                                    <button class="btn  btn-primary" type="submit" onclick="">提交</button>
                                   <%-- <button class="btn btn-danger" type="reset" onclick="">重置</button>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="JOB_MESSAGE_ID">职位名称：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" name="JOB_MESSAGE_ID" value="${pd.JOB_MESSAGE_ID}" />
                                    <select name="JOB_ID" id="JOB_MESSAGE_ID"  disabled="disabled" placeholder="请选择职位名称"  class="col-xs-10 col-sm-5">
                                        <option value=""></option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-date">考试时间：</label>
                                <div class="col-sm-9">
                                    <input class="col-xs-10 col-sm-5 span10 date-picker" aria-readonly="true" name="name" id="form-field-date" value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="日期" title="日期">
                                </div>
                            </div>
                        </div>
                            </form>
                            <!-- 存放生成的html结尾 -->
                            <div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
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
    </div>
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
	<!-- 上传控件 -->
	<script src="static/ace/js/ace/elements.fileinput.js"></script>
	<script type="text/javascript">
		$(top.hangge());
        var JobMessageId = '${pd.JOB_MESSAGE_ID}'; //工作职位分类
        var JobTypeId = '${pd.JOB_TYPE_ID}';// 工作类别名称

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
                        var selectd ="";
                        for(var i=0; i<data.length; i++){
                            if(JobMessageId == data[i].JOB_MESSAGE_ID){ selectd = "selected";}else{selectd="";}
                            html+="<option value='"+data[i].JOB_MESSAGE_ID+"'" +selectd + " >"+data[i].JOB_NAME+"</option>";
                        }
                    }
                    $("#JOB_MESSAGE_ID").html(html);
                    $("#JOB_MESSAGE_ID").trigger("create");
                }
            })
        }

		$(function() {
            if(JobTypeId != null){
                jobType();
            }
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
			//下拉框
			if(!ace.vars['touch']) {
				$('.chosen-select').chosen({allow_single_deselect:true}); 
				$(window)
				.off('resize.chosen')
				.on('resize.chosen', function() {
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				}).trigger('resize.chosen');

				$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
					if(event_name != 'sidebar_collapsed') return;
					$('.chosen-select').each(function() {
						 var $this = $(this);
						 $this.next().css({'width': $this.parent().width()});
					});
				});
				$('#chosen-multiple-style .btn').on('click', function(e){
					var target = $(this).find('input[type=radio]');
					var which = parseInt(target.val());
					if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
					 else $('#form-field-select-4').removeClass('tag-input-style');
				});
			}
		});
	</script>


</body>
</html>