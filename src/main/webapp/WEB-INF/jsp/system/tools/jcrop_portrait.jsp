<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String imgSrc = request.getSession().getAttribute("imgSrc") != null ? request.getSession().getAttribute("imgSrc").toString(): "" ;
    String imgCut = request.getSession().getAttribute("imgCut") != null ? request.getSession().getAttribute("imgCut").toString() : "" ;
%>
<!DOCTYPE html>
<html lang="en">
<link>
    <base href="<%=basePath%>">
    <!-- jsp文件头和头部 -->
    <%--<%@ include file="../index/top.jsp"%>--%>
    <%--<script type="text/javascript" src="static/ace/js/jquery.js"></script>--%>
    <link rel="stylesheet" href="plugins/jcrop/css/jquery.Jcrop.css"></link>
    <!-- jcrop 截取头像工具 -->
    <script type="text/javascript" src="plugins/jcrop/js/jquery.min.js"></script>
    <script type="text/javascript" src="plugins/jcrop/js/jquery.Jcrop.js"></script>
</head>
<body class="no-skin">
<form name="form" action="<%=basePath%>/tool/uploadHeadImage" class="form-horizontal" method="post" enctype="multipart/form-data">
        <!-- /section:basics/sidebar -->
        <div class="row">
            <div class="modal-footer text-right" >
                <button id="submit" onclick="">上传</button>
            </div>
            <div class="col-xs-5">
                <div class="zxx_main_con">
                    <div class="zxx_test_list">
                        <input class="photo-file" type="file" name="imgFile" id="fcupload" onchange="readURL(this);" />
                        <img alt=""  src="<%=basePath%>/${imgCut}" id="cutimg" />
                        <input type="hidden" id="x" name="x" />
                        <input type="hidden" id="y" name="y" />
                        <input type="hidden" id="w" name="w" />
                        <input type="hidden" id="h" name="h" />
                    </div>
                </div>
            </div>
            <div id="preview-pane">
                <div class="preview-container" >
                    <img src="<%=basePath%>/${imgSrc}" class="jcrop-preview" alt="预览">
                </div>
            </div>
        </div>
</form>


<script type="text/javascript">
    //定义一个全局api，这样操作起来比较灵活
    var api = null,
        boundx,
        boundy,

        $preview = $('#preview-pane'),
        $pcnt = $('#preview-pane .preview-container'),
        $pimg = $('#preview-pane .preview-container img'),

        xsize = $pcnt.width(),
        ysize = $pcnt.height();

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.readAsDataURL(input.files[0]);
            reader.onload = function(e) {
                $('#cutimg').removeAttr('src');
                $('#cutimg').attr('src', e.target.result);
                $pimg.removeAttr('src');
                $pimg.attr('src', e.target.result);

                api = $.Jcrop('#cutimg', {
                    allowSelect: true,
                    setSelect: [ 20, 20, 200, 200 ],
                    aspectRatio: 1,
                    onSelect: updateCoords,
                    onChange:updateCoords
                });
                var bounds = api.getBounds;
                boundx = bounds[0];
                boundy = bounds[1];
               // $preview.appendTo(api.ui.holder);
            };
            if (api != undefined) {
                api.destroy();
            }
        }
        function updateCoords(obj) {
            $("#x").val(obj.x);
            $("#y").val(obj.y);
            $("#w").val(obj.w);
            $("#h").val(obj.h);
            if (parseInt(obj.w) > 0) {
                var rx = xsize / obj.w;
                var ry = ysize / obj.h;
                $pimg.css({
                    width : Math.round(rx * boundx) + 'px',
                    height : Math.round(ry * boundy) + 'px',
                    marginRight :  Math.round(rx * obj.x) + 'px',
                    marginTop :  Math.round(ry * obj.y) + 'px'
                });
            }
        }
        ;
    }
</script>
<!-- basic scripts -->

<!-- 页面底部js¨ -->
<%--<%@ include file="../index/foot.jsp"%>--%>
<!-- ace scripts -->
<%--<script src="static/ace/js/ace/ace.js"></script>--%>
<!--提示框-->
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<!--引入属于此页面的js -->
<script type="text/javascript">
    $(top.hangge());
</script>
</body>
</html>
