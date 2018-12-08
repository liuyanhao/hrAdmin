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
	<script type="text/javascript" src="static/ace/js/jquery.js"></script>
	<!-- 上传头像图片插件 -->
	<link href="plugins/uploadify/uploadify.touxiang.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="plugins/uploadify/swfobject.js"></script>
	<script type="text/javascript" src="plugins/uploadify/jquery.uploadify.v2.1.4.min.js"></script>
	<!-- 上传头像图片插件 -->
	<script type="text/javascript">
		var jsessionid = "<%=session.getId()%>";  //勿删，uploadify兼容火狐用到
	</script>
	<!-- 民族信息 -->
	<script type="text/javascript" src="static/js/nationUtils.js"/>
	<script  type="text/javascript">

	</script>
	<!-- 民族信息 -->
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
					<form action="staffemployee/${msg }.do" name="Form" id="Form" method="post">
						<input type="hidden" name="STAFFEMPLOYEE_ID" id="STAFFEMPLOYEE_ID" value="${pd.STAFFEMPLOYEE_ID}"/>
						<div id="zhongxin" style="padding-top: 13px;">
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">员工编号:</td>
								<td><input type="number" name="STAFF_ID" readonly="readonly" id="STAFF_ID" value="${pd.STAFF_ID}" maxlength="32" placeholder="这里输入员工编号" title="员工编号" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">姓名:</td>
								<td><input type="text" name="STAFF_NAME" id="STAFF_NAME" value="${pd.STAFF_NAME}" maxlength="20" placeholder="这里输入姓名" title="姓名" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">员工照片:</td>
								<td rowspan="5" colspan="1">
									<div >
										<img id="picImage" src="<c:if test='${pd.PIC != null}'><%=basePath%>uploadFiles/touXiang/${pd.PIC}</c:if>" onerror="this.src='<%=basePath%>uploadFiles/uploadImgs/defaultImage.jpg';this.onerror=null"
											 width="180" height="200" style="margin-left: 15px;  margin-bottom: 5px" >
									</div >
									<div id="tipsTwo">
									<input type="hidden" name="PIC" id="PIC" value="${pd.PIC}">
									<input type="file"  id="uploadify1"  keepDefaultStyle = "true"   title="照片地址" style="width:98%;"/>
									</div>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">电话:</td>
								<td><input type="text" name="PHONE" id="PHONE" value="${pd.PHONE}" maxlength="20" placeholder="这里输入电话" title="电话" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">性别:</td>
								<td>
									<select name="SEX" title="性别" style="width:98%;">
										<option value="1" <c:if test="${pd.SEX == '1' }">selected</c:if> >男</option>
										<option value="2" <c:if test="${pd.SEX == '2' }">selected</c:if> >女</option>
									</select>
								</td>
								<td style="width:79px;text-align: right;padding-top: 13px;"> </td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">出生年月:</td>
								<td><input type="text" name="BIRTH" id="BIRTH" class="span10 date-picker"  data-date-format="yyyy-mm-dd" readonly="readonly"  value="${pd.BIRTH}" maxlength="20" placeholder="这里输入出生年月" title="出生年月" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">年龄:</td>
								<td><input type="number"  min="1" name="AGE" id="AGE" value="${pd.AGE}" maxlength="32" placeholder="这里输入年龄" title="年龄" style="width:98%;"/></td>
								<td></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">QQ:</td>
								<td><input type="text" name="QQ" id="QQ" value="${pd.QQ}" maxlength="10" placeholder="这里输入QQ" title="QQ" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">微信:</td>
								<td><input type="text" name="WECHAT" id="WECHAT" value="${pd.WECHAT}" maxlength="30" placeholder="这里输入微信" title="微信" /></td>
								<td></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">国籍:</td>
								<td>
									<select  name="NATIONALITY" id="NATIONALITY"  title="国籍" style="width:98%;"></select>
								</td>
								<td style="width:79px;text-align: right;padding-top: 13px;">民族:</td>
								<td><select id="NATION"  class="chosen-select form-control"  name ="NATION" title="民族" style="width:98%;"></select></td>
								<td style="width:79px;text-align: right;padding-top: 13px;"><a class="btn btn-mini btn-success" onclick="uploadTouXiang()" >上传</a></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">学历:</td>
								<td><select name="LEARING" id="LEARING" maxlength="10" placeholder="这里输入学历" title="学历" style="width:98%;">
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
								<td style="width:79px;text-align: right;padding-top: 13px;">邮编号码:</td>
								<td><input type="text" name="POST_CODE" id="POST_CODE" value="${pd.POST_CODE}" maxlength="255" placeholder="这里输入邮编号码" title="邮编号码" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">政治面貌:</td>
								<td>
									<select name="GOVEMMET" id="GOVEMMET"  maxlength="15" placeholder="这里选择政治面貌" title="政治面貌" style="width:98%;">
										<option value="">请选择</option>
										<option value="中共党员" <c:if test="${pd.GOVEMMET =='中共党员'}" >selected</c:if> >中共党员</option>
										<option value="中共预备党员" <c:if test="${pd.GOVEMMET =='中共预备党员'}" >selected</c:if>>中共预备党员</option>
										<option value="共青团员" <c:if test="${pd.GOVEMMET =='共青团员'}" >selected</c:if>>共青团员</option>
										<option value="无党派人士" <c:if test="${pd.GOVEMMET =='无党派人士'}" >selected</c:if>>无党派人士</option>
										<option value="群众" <c:if test="${pd.GOVEMMET =='群众'}" >selected</c:if>>群众</option>
										<option value="其他" <c:if test="${pd.GOVEMMET !=''}" >selected</c:if>>其他</option>
									</select>
								</td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">身份证号:</td>
								<td><input type="text" name="CARD_ID" id="CARD_ID" value="${pd.CARD_ID}" maxlength="20" placeholder="这里输入身份证号码" title="身份证号码" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">E-mail:</td>
								<td><input type="text" name="EMAIL" id="EMAIL" value="${pd.EMAIL}" maxlength="30" placeholder="这里输入E-mail" title="E-mail" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">宗教信仰:</td>
								<td><input type="text" name="FAITH" id="FAITH" value="${pd.FAITH}" maxlength="30" placeholder="这里输入宗教信仰" title="宗教信仰" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">专业:</td>
								<td><input type="text" name="SPEIALITY" id="SPEIALITY" value="${pd.SPEIALITY}" maxlength="20" placeholder="这里输入专业" title="专业" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">爱好:</td>
								<td><input type="text" name="HOBBY" id="HOBBY" value="${pd.HOBBY}" maxlength="50" placeholder="这里输入爱好" title="爱好" style="width:98%;"/></td>
								<td style="width:79px;text-align: right;padding-top: 13px;">特长:</td>
								<td><input type="text" name="SUIT" id="SUIT" value="${pd.SUIT}" maxlength="50" placeholder="这里输入特长" title="特长" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">职位分类:</td>
								<td><select name="JOB_TYPE_ID" id="JOB_TYPE_ID"  placeholder="这里选择职位分类" onchange="jobType()" title="职位分类" style="width:98%;">
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
								<td style="width:79px;text-align: right;padding-top: 13px;">职位名称:</td>
								<td><select name="JOB_ID" id="JOB_ID" value="${pd.JOB_ID}" maxlength="32" placeholder="这里输入职位名称" title="职位名称" style="width:98%;">
									<option value="">请选择</option>
								</select>
								</td>
								<td style="width:79px;text-align: right;padding-top: 13px;">登记时间:</td>
								<td><input class="span10 date-picker" name="ADD_TIME" id="ADD_TIME" value="${pd.ADD_TIME}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" placeholder="登记时间" title="登记时间" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;" >地址:</td>
								<td colspan="6" ><input type="text" name="ADDRESS" id="ADDRESS" value="${pd.ADDRESS}" maxlength="50" placeholder="这里输入地址" title="地址" style="width:98%;"/></td>
							</tr>
							<tr>
								<td style="width:79px;text-align: right;padding-top: 13px;">备注:</td>
								<td colspan="6">
									<textarea rows="5" name="REMARK" id="REMARK"  maxlength="255" placeholder="这里输入备注" title="备注" style="width:98%;">${pd.REMARK}</textarea>
								</td>
							</tr>
							<tr height="50px">
								<td style="width:79px;text-align: right;padding-top: 13px;">个人简历:</td>
								<td colspan="6" >
									<textarea rows="10" name="RESUME" id="RESUME"  maxlength="255" placeholder="这里输入个人简历" title="个人简历" style="width:98%;"/>${pd.RESUME}</textarea>
								</td>
							</tr>

							<tr height="50px">
								<td style="width:79px;text-align: right;padding-top: 13px;">个人描述:</td>
								<td colspan="6">
									<textarea rows="10" name="DESCRIBES" id="DESCRIBES" maxlength="255" placeholder="这里输入个人描述" title="个人描述" style="width:98%;"/>${pd.DESCRIBES}</textarea>
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
						<div class="step-content row-fluid position-relative">
							<input type="hidden" value="no" id="hasTp1" />
						</div>
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
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
        //编辑 民族 赋值
        var nationValue = ${pd.NATION == null ? 0 : pd.NATION};
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
        }
        $(top.hangge());

        //选择职位类别 级联查询
        function jobType(){
            var JOB_TYPE_ID = $("#JOB_TYPE_ID").val();
            var JobMessageId = '${pd.JOB_ID}';
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
                            if(JobMessageId == data[i].JOB_MESSAGE_ID){ selectd = "selected";}else {selectd="";}
                            html+="<option value='"+data[i].JOB_MESSAGE_ID+"'" +selectd + " >"+data[i].JOB_NAME+"</option>";
                        }
                    }
                    $("#JOB_ID").html(html);
                    $("#JOB_ID").trigger("create");
                }
            })
        }

        //保存
		function save(){
			if($("#SEX").val()==""){
				$("#SEX").tips({
					side:3,
		            msg:'请选择性别',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SEX").focus();
			return false;
			}
			if($("#ADDRESS").val()==""){
				$("#ADDRESS").tips({
					side:3,
		            msg:'请输入地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADDRESS").focus();
			return false;
			}
			if($("#PHONE").val()==""){
				$("#PHONE").tips({
					side:3,
		            msg:'请输入电话',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#PHONE").focus();
			return false;
			}
			if($("#PIC").val()==""){
				$("#PIC").tips({
					side:3,
		            msg:'请上传照片地址',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#uploadify1").focus();
			return false;
			}
			if($("#CARD_ID").val()==""){
				$("#CARD_ID").tips({
					side:3,
		            msg:'请输入身份证号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#CARD_ID").focus();
			return false;
			}
			if($("#EMAIL").val()==""){
				$("#EMAIL").tips({
					side:3,
		            msg:'请输入E-mail',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#EMAIL").focus();
			return false;
			}
			if($("#QQ").val()==""){
				$("#QQ").tips({
					side:3,
		            msg:'请输入QQ',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#QQ").focus();
			return false;
			}
			if($("#WECHAT").val()==""){
				$("#WECHAT").tips({
					side:3,
		            msg:'请输入微信',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#WECHAT").focus();
			return false;
			}
			if($("#POST_CODE").val()==""){
				$("#POST_CODE").tips({
					side:3,
		            msg:'请输入邮编号码',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#POST_CODE").focus();
			return false;
			}
			if($("#GOVEMMET").val()==""){
				$("#GOVEMMET").tips({
					side:3,
		            msg:'请输入政治面貌',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#GOVEMMET").focus();
			return false;
			}
			if($("#NATION").val()==""){
				$("#NATION").tips({
					side:3,
		            msg:'请选择民族',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NATION").focus();
			return false;
			}
			if($("#LEARING").val()==""){
				$("#LEARING").tips({
					side:3,
		            msg:'请选择学历',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#LEARING").focus();
			return false;
			}
			if($("#HOBBY").val()==""){
				$("#HOBBY").tips({
					side:3,
		            msg:'请输入爱好',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#HOBBY").focus();
			return false;
			}
			if($("#SUIT").val()==""){
				$("#SUIT").tips({
					side:3,
		            msg:'请输入特长',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SUIT").focus();
			return false;
			}
			if($("#NATIONALITY").val()==""){
				$("#NATIONALITY").tips({
					side:3,
		            msg:'请选择国籍',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NATIONALITY").focus();
			return false;
			}
			if($("#BIRTH").val()==""){
				$("#BIRTH").tips({
					side:3,
		            msg:'请输入出生年月',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#BIRTH").focus();
			return false;
			}
			if($("#FAITH").val()==""){
				$("#FAITH").tips({
					side:3,
		            msg:'请输入宗教信仰',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#FAITH").focus();
			return false;
			}
			if($("#SPEIALITY").val()==""){
				$("#SPEIALITY").tips({
					side:3,
		            msg:'请输入专业',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#SPEIALITY").focus();
			return false;
			}
			if($("#RESUME").val()==""){
				$("#RESUME").tips({
					side:3,
		            msg:'请输入个人简历',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#RESUME").focus();
			return false;
			}
			if($("#DESCRIBES").val()==""){
				$("#DESCRIBES").tips({
					side:3,
		            msg:'请输入个人描述',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#DESCRIBES").focus();
			return false;
			}
			if($("#ISROMVE").val()==""){
				$("#ISROMVE").tips({
					side:3,
		            msg:'请输入目前状况',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ISROMVE").focus();
			return false;
			}
			if($("#JOB_ID").val()==""){
				$("#JOB_ID").tips({
					side:3,
		            msg:'请输入职位名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB_ID").focus();
			return false;
			}
			if($("#JOB_TYPE_ID").val()==""){
				$("#JOB_TYPE_ID").tips({
					side:3,
		            msg:'请输入职位分类',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#JOB_TYPE_ID").focus();
			return false;
			}
			if($("#AGE").val()==""){
				$("#AGE").tips({
					side:3,
		            msg:'请输入年龄',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#AGE").focus();
			return false;
			}
			if($("#ADD_TIME").val()==""){
				$("#ADD_TIME").tips({
					side:3,
		            msg:'请输入登记时间',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#ADD_TIME").focus();
			return false;
			}
			if($("#STAFF_NAME").val()==""){
				$("#STAFF_NAME").tips({
					side:3,
		            msg:'请输入姓名',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#STAFF_NAME").focus();
			return false;
			}
			$("#Form").submit();
			$("#zhongxin").hide();
			$("#zhongxin2").show();
		}

		//上传头像
		var locat = (window.location+'').split('/');
        $(function(){if('staffemployee'== locat[3]){locat =  locat[0]+'//'+locat[2];}else{locat =  locat[0]+'//'+locat[2]+'/'+locat[3];};});

		$(function() {
			//日期框
			$('.date-picker').datepicker({autoclose: true,todayHighlight: true});
            var JOB_TYPE_ID = $("#JOB_TYPE_ID").val();
            if(JOB_TYPE_ID != null){
				jobType(); //第一次加载职位类型
            }
		});

        //====================上传头像照片=================
        $(document).ready(function(){
            var str='';
            $("#uploadify1").uploadify({
                'buttonImg'	: 	locat+"/static/images/touxiang.png",
                'uploader'	:	locat+"/plugins/uploadify/uploadify.swf",
                'script'    :	locat+"/plugins/uploadify/uploadFile.jsp;jsessionid="+jsessionid,
                'cancelImg' :	locat+"/plugins/uploadify/cancel.png",
                'folder'	:	locat+"/uploadFiles/touXiang",//上传文件存放的路径,请保持与uploadFile.jsp中PATH的值相同
                'queueId'	:	"fileQueue",
                'queueSizeLimit':1,//限制上传文件的数量
                //'fileExt'	:	"*.rar,*.zip",
                //'fileDesc'	:	"RAR *.rar",//限制文件类型
                'fileExt'     : '*.jpg;*.gif;*.png',
                'fileDesc'    : 'Please choose(.JPG, .GIF, .PNG)',
                'auto'		:	false,
                'multi'		:	true,//是否允许多文件上传
                'simUploadLimit':	2,//同时运行上传的进程数量
                'buttonText':	"files",
                'scriptData':	{'uploadPath':'/uploadFiles/touXiang/'},//这个参数用于传递用户自己的参数，此时'method' 必须设置为GET, 后台可以用request.getParameter('name')获取名字的值
                'method'	:	"GET",
                'onComplete':function(event,queueId,fileObj,response,data){
                    str = response.trim();//单个上传完毕执行
                },
                'onAllComplete' : function(event,data) {
                  //  alert(str);	//全部上传完毕执行
                    $("#picImage").attr("src","<%=basePath%>uploadFiles/touXiang/" + str);
                    $("#PIC").val(str);
                },
                'onSelect' : function(event, queueId, fileObj){
                    $("#hasTp1").val("ok");
                }
            });

        });
        //====================上传头像照片=================

        function uploadTouXiang(){
            if($("#hasTp1").val()=="no"){
                $("#tipsTwo").tips({
                    side:3,
                    msg:'请选择头像照片',
                    bg:'#AE81FF',
                    time:2
                });
                return false;
            }
            $('#uploadify1').uploadifyUpload();
        }
	</script>
</body>
</html>