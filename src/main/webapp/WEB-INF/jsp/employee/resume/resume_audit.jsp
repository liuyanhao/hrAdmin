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
	<!-- 上传图片插件 -->
	<link href="plugins/uploadify/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<!-- 上传图片插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	<!-- 民族信息 -->
	<script type="text/javascript" src="static/js/nationUtils.js"/>
	<script  type="text/javascript">

	</script>
	<!-- 民族信息 -->
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
					
					<form action="resume/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="RESUME_ID" id="RESUME_ID" value="${pd.RESUME_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="STAFF_NAME" id="STAFF_NAME"  readonly="readonly" value="${pd.STAFF_NAME}" maxlength="20" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">性别:</td>
								<td><select name="SEX" title="性别"  disabled="disabled" style="width:98%;">
										<option value="1" <c:if test="${pd.SEX == '1' }">selected</c:if> >男</option>
										<option value="2" <c:if test="${pd.SEX == '2' }">selected</c:if> >女</option>
									</select>
								</td>
								<td align="center">
									<c:if test="${pd.STATUS == 0}" >
									<a class="btn btn-mini btn-primary" id="agree" onclick="audit(9);">通过</a>
									</c:if>
								</td>
								<td rowspan="5" colspan="1">
									<div ><img src="<%=basePath%>uploadFiles/uploadImgs/${pd.PIC}" onerror="this.src='<%=basePath%>uploadFiles/uploadImgs/defaultImage.jpg';this.onerror=null" width="200" height="240"></div>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">出生年月:</td>
								<td><input type="text" class="span10 date-picker" name="BIRTH" id="BIRTH"  readonly="readonly" value="${pd.BIRTH}" maxlength="20" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="这里输入出生年月" title="出生年月" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">年龄:</td>
								<td ><input type="number" name="AGE" id="AGE" value="${pd.AGE}"  readonly="readonly" maxlength="32" placeholder="这里输入年龄" title="年龄" style="width:98%;"/></td>
								<td align="center" >
								<c:if test="${pd.STATUS == 0}" >
									<a class="btn btn-mini btn-primary" id="decline" onclick="audit(7);">拒绝</a>
								</c:if>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">民族:</td>
								<td><select id="NATION"  disabled="disabled" name ="NATION" title="民族" style="width:98%;"></select></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">学历:</td>
								<td>
									<select name="LEARING" id="LEARING" maxlength="10"  disabled="disabled" placeholder="这里输入学历" title="学历" style="width:98%;">
										<option value="大学" <c:if test="${pd.LEARING == '大学' }">selected</c:if> >大学</option>
										<option value="本科" <c:if test="${pd.LEARING == '本科' }">selected</c:if> >本科</option>
										<option value="研究生" <c:if test="${pd.LEARING == '研究生' }">selected</c:if> >研究生</option>
										<option value="硕士" <c:if test="${pd.LEARING == '硕士' }">selected</c:if> >硕士</option>
										<option value="博士" <c:if test="${pd.LEARING == '博士' }">selected</c:if> >博士</option>
										<option value="大专" <c:if test="${pd.LEARING == '大专' }">selected</c:if> >大专</option>
										<option value="中专" <c:if test="${pd.LEARING == '中专' }">selected</c:if> >中专</option>
										<option value="高中" <c:if test="${pd.LEARING == '高中' }">selected</c:if> >高中</option>
										<option value="初中" <c:if test="${pd.LEARING == '初中' }">selected</c:if> >初中</option>
										<option value="小学" <c:if test="${pd.LEARING == '小学' }">selected</c:if> >小学</option>
										<option value="其他" <c:if test="${pd.LEARING == '其他' }">selected</c:if> >其他</option>
									</select>
								</td>
							<td align="center"><a class="btn btn-mini btn-primary hidden" id="written" onclick="audit(1);">推荐笔试</a></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">国籍:</td>
								<td><select  name="NATIONALITY" id="NATIONALITY"   disabled="disabled" title="国籍" style="width:98%;"></select>	</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">宗教信仰:</td>
								<td><input type="text" name="FAITH" id="FAITH"  readonly="readonly" value="${pd.FAITH}" maxlength="30" placeholder="这里输入宗教信仰" title="宗教信仰" style="width:98%;"/></td>
								<td><a class="btn btn-mini btn-primary hidden" id="interview" onclick="audit(4);">推荐面试</a></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">政治面貌:</td>
								<td><input type="text" name="GOVEMMET" id="GOVEMMET"  readonly="readonly" value="${pd.GOVEMMET}" maxlength="15" placeholder="这里输入政治面貌" title="政治面貌" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td colspan="2"><input type="text" name="CARD_ID" id="CARD_ID"  readonly="readonly" value="${pd.CARD_ID}" maxlength="20" placeholder="这里输入身份证号码" title="身份证号码" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">E-mail:</td>
								<td><input type="text" name="EMAIL" id="EMAIL"  readonly="readonly" value="${pd.EMAIL}" maxlength="30" placeholder="这里输入E-mail" title="E-mail" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">QQ:</td>
								<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}"  readonly="readonly" maxlength="15" placeholder="这里输入QQ" title="QQ" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">照片地址:</td>
								<td ><input type="file" name="PIC"  id="uploadify1"   readonly="readonly" keepDefaultStyle = "true" value="${pd.PIC}" placeholder="这里输入照片地址" title="照片地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">微信:</td>
								<td><input type="text" name="WECHAT" id="WECHAT"  readonly="readonly" value="${pd.WECHAT}" maxlength="30" placeholder="这里输入微信" title="微信" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">英语等级:</td>
								<td><input type="text" name="DEGREE" id="DEGREE"  readonly="readonly" value="${pd.DEGREE}" maxlength="10" placeholder="这里输入等级" title="等级" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">面试成绩:</td>
								<td><input type="number" name="RESULT" id="RESULT"  readonly="readonly"  value="${pd.RESULT == null ? 0 :pd.RESULT}" maxlength="32" placeholder="这里输入面试成绩" title="面试成绩" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="PHONE" id="PHONE"  readonly="readonly" value="${pd.PHONE}" maxlength="20" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">爱好:</td>
								<td><input type="text" name="HOBBY" id="HOBBY"  readonly="readonly" value="${pd.HOBBY}" maxlength="50" placeholder="这里输入爱好" title="爱好" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">特长:</td>
								<td><input type="text" name="SUIT" id="SUIT"   readonly="readonly"  value="${pd.SUIT}" maxlength="50" placeholder="这里输入特长" title="特长" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">邮编号码:</td>
								<td><input type="text" name="POST_CODE" id="POST_CODE"  readonly="readonly" value="${pd.POST_CODE}" maxlength="255" placeholder="这里输入邮编号码" title="邮编号码" style="width:98%;"/></td>
								<td style="width:75px;text-align: right;padding-top: 13px;">地址:</td>
								<td colspan="1" >
									<input type="text" name="ADDRESS" id="ADDRESS"  readonly="readonly" value="${pd.ADDRESS}" maxlength="50" placeholder="这里输入地址" title="地址" style="width:98%;"/>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">专业:</td>
								<td><input type="text" name="SPEIALITY" id="SPEIALITY"  readonly="readonly" value="${pd.SPEIALITY}" maxlength="20" placeholder="这里输入专业" title="专业" style="width:98%;"/></td>

							</tr>
							<c:if test="${msg == 'audit'}">
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">职位类别:</td>
								<td>
									<select  name="JOB_TYPE_ID" id="JOB_TYPE_ID"  disabled="disabled" placeholder="这里选择工作职位类别" onchange="jobType()"  title="职位类别" style="width:98%;" >
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
								<td style="width:75px;text-align: right;padding-top: 13px;">工作职位:</td>
								<td>
									<select name="JOB_MESSAGE_ID" id="JOB_MESSAGE_ID"  disabled="disabled"  style="width:98%;">
										<option value=""></option>
									</select>
								</td>
								<td style="width:75px;text-align: right;padding-top: 13px;">审核状态:</td>
								<td>
									<select id="STATUS" name="STATUS" style="width:98%;color: red; " >
										<option value="0" <c:if test="${pd.STATUS == 0}">selected</c:if> >未审核</option>
										<option value="1" <c:if test="${pd.STATUS == 1}">selected</c:if>>待笔试</option>
										<option value="2" <c:if test="${pd.STATUS == 2}">selected</c:if>>笔试通过</option>
										<option value="3" <c:if test="${pd.STATUS == 3}">selected</c:if>>笔试待审核</option>
										<option value="4" <c:if test="${pd.STATUS == 4}">selected</c:if>>待面试</option>
										<option value="5" <c:if test="${pd.STATUS == 5}">selected</c:if>>通过面试</option>
										<option value="6" <c:if test="${pd.STATUS == 6}">selected</c:if>>待录用</option>
										<option value="7" <c:if test="${pd.STATUS == 7}">selected</c:if>>未通过录用</option>
										<option value="8" <c:if test="${pd.STATUS == 8}">selected</c:if>>通过录用</option>
									</select>
								</td>
								<%--<td style="width:75px;text-align: right;padding-top: 13px;">审核人:</td>
								<td><input type="text" name="USER_NAME" id="USER_NAME" value="${pd.USER_NAME}" maxlength="20" placeholder="这里输入审核人姓名" title="审核人姓名" style="width:98%;"/></td>--%>
							</tr>
							</c:if>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="5">
									<textarea rows="5" name="REMARK" id="REMARK"  readonly="readonly"  maxlength="255"  placeholder="这里输入备注" title="备注" style="width:98%;">${pd.REMARK}</textarea>
								</td>

							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">个人描述:</td>
								<td colspan="5">
									<textarea rows="10" name="DESCRIBES" id="DESCRIBES" readonly="readonly" placeholder="这里输入个人描述" title="个人描述" style="width:98%;"/>${pd.DESCRIBES}</textarea>
								</td>
							</tr>
							<tr>
								<td style="width:75px;text-align: right;padding-top: 13px;">推荐理由:</td>
								<td colspan="5" >
									<textarea rows="5" name="REASON" id="REASON"  maxlength="255" placeholder="这里输入推荐理由" title="推荐理由" style="width:98%;"/>${pd.REASON}</textarea>
								</td>
							<c:if test="${pd.STATUS > 4}">
							</tr>
							<td style="width:75px;text-align: right;padding-top: 13px;">面试评价:</td>
							<td colspan="5" >
								<textarea rows="5" name="SCORE" id="SCORE"  maxlength="255" placeholder="这里输入面试评价" title="面试评价" style="width:98%;"/>${pd.SCORE}</textarea>
							</td>
							</tr>
							</c:if>
							<tr>
								<%--<td style="text-align: center;" colspan="10">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
									<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
								</td>--%>
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
        //编辑 民族 赋值
        var nationValue = ${pd.NATION == null ? 0 : pd.NATION};
        var JobMessageId = '${pd.JOB_MESSAGE_ID}'; //工作职位分类
        window.onload = function (){
            var nat = document.getElementById ("NATION");
            for ( var i = 0; i < national.length; i++){
                var option = document.createElement ('option');
                option.value = i;
                if(nationValue == i) option.selected = true;
                var txt = document.createTextNode (national[i]);
                option.appendChild (txt);
                nat.appendChild (option);
            }
            //国籍
            var nationality_id = document.getElementById ("NATIONALITY");
            var  nationalityValue = '${pd.NATIONALITY}' == '' ? 'CN' : '${pd.NATIONALITY}';
            for ( var i = 0; i < country.length; i++){
                var option = document.createElement ('option');
                option.value = country[i][0];
                if(nationalityValue == country[i][0]) option.selected = true;
                var txt = document.createTextNode (country[i][1]);
                option.appendChild (txt);
                nationality_id.appendChild (option);
            }
            jobType();
        }
        $(top.hangge());

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
                        var select ="";
                        for(var i=0; i<data.length; i++){
                            if(JobMessageId == data[i].JOB_MESSAGE_ID){ select = "selected";}else {select = "";}
                            html+="<option value='"+data[i].JOB_MESSAGE_ID+"'" + select + " >"+data[i].JOB_NAME+"</option>";
                        }
                    }
                    $("#JOB_MESSAGE_ID").html(html);
                    $("#JOB_MESSAGE_ID").trigger("create");
                }
            })
        }

        //审核
        function  audit(status) { debugger;
            if(status == 1){ //推荐笔试
                if($("#REASON").val()==""){
                    $("#REASON").tips({
                        side:3,
                        msg:'请输入推荐理由',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#REASON").focus();
                    return false;
                }
                $("#STATUS").val(1);
                $("#Form").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
            }
            if(status == 4){ //面试
                if($("#REASON").val()==""){
                    $("#REASON").tips({
                        side:3,
                        msg:'请输入推荐理由',
                        bg:'#AE81FF',
                        time:2
                    });
                    $("#REASON").focus();
                    return false;
                }
                $("#STATUS").val(4);
                $("#Form").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
            }
            if(status == 7){ //拒绝
                $("#STATUS").val(7);
                $("#Form").submit();
                $("#zhongxin").hide();
                $("#zhongxin2").show();
            }
			if(status == 9){ //通过
				$("#agree").hide();
                $("#decline").hide();
                $("#written").removeClass("hidden");
                $("#interview").removeClass("hidden");
			}
        }

		//保存
		function save(){
			if($("#STATUS").val()==""){
				$("#STATUS").tips({
					side:3,
		            msg:'请选择审核状态',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STATUS").focus();
			return false;
			}
			if($("#REASON").val()==""){
				$("#REASON").tips({
					side:3,
		            msg:'请输入推荐理由',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#REASON").focus();
			return false;
			}
			if($("#RESULT").val()==""){
				$("#RESULT").tips({
					side:3,
		            msg:'请输入面试成绩',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESULT").focus();
			return false;
			}
			if($("#SCORE").val()==""){
				$("#SCORE").tips({
					side:3,
		            msg:'请输入面试评价',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SCORE").focus();
			return false;
			}
			if($("#JOB_MESSAGE_ID").val()==""){
				$("#JOB_MESSAGE_ID").tips({
					side:3,
		            msg:'请输入工作职位',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB_MESSAGE_ID").focus();
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