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
                                    <label class="col-sm-3 control-label no-padding-right" for="jobType">职位类型：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="jobType" id="jobType" value="${pd.jobType}" placeholder="请输入职位类型" class="col-xs-10 col-sm-5">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="cardId">身份证号：</label>
                                    <div class="col-sm-9">
                                        <input type="text" name="cardId" id="cardId"  placeholder="身份证号码" class="col-xs-10 col-sm-5">
                                    </div>
                                </div>
                         </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" ></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-mini btn-primary" type="submit" onclick="">提交</button>
                                   <%-- <button class="btn btn-mini btn-danger" type="reset" onclick="">重置</button>--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="jobName">职位名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" name="jobName" id="jobName" value="${pd.jobName}" placeholder="请输入职位名称" readonly="readonly" class="col-xs-10 col-sm-5">
                                    <input type="hidden" name="jobId" value="${pd.id}" />
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
		$(function() {
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