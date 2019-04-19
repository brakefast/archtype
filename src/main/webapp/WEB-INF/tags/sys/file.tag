<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="type" type="java.lang.String" required="true" description="文件类型" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="请求地址" %>

<c:if test="${type=='base'}">
    <script type="text/javascript">
        $(document).ready(function(){
            $("#${id}").fileinput({
                showPreview: false,
                allowedFileExtensions: ["png", "jpg", "doc", "xml"],
                elErrorContainer: "#${id}fileError",
                browseClass: "btn btn-success",
                browseLabel: "查找文件",
                browseIcon: '<i class="glyphicon glyphicon-search"></i>',
                removeClass: "btn btn-danger",
                removeLabel: "删除",
                removeIcon: '<i class="glyphicon glyphicon-trash"></i>',
                uploadClass: "btn btn-info",
                uploadLabel: "上传",
                uploadIcon: '<i class="glyphicon glyphicon-upload"></i>',
            });

            $("#${id}uploadForm").submit(function (event) {
                var formData = new FormData(this); //这里用的是this，如果是Form的话需要Form[0]
                event.preventDefault(); //阻止当前提交事件，自行实现，否则会跳转
                $.ajax({
                    url: App.ctx + "${url}",
                    type: 'POST',
                    data: formData,
                    contentType: false, //这两个参数需要被定义，否则报错
                    processData: false,
                    success: function (data) {
                        if (data.success) {
                            MsgUtil.success("上传成功");
                            $("#${id}uploadFileDiv").slideToggle("slow");
                        } else {
                            MsgUtil.error("上传失败！")
                        }
                    }
                });
            });
        });
    </script>
</c:if>
<form enctype="multipart/form-data" id="${id}uploadForm">
    <div id="${id}uploadFileDiv">
        <input id="${id}" name="file" type="file">
        <div id="${id}fileError" class="help-block"></div>
        <br/>
    </div>
</form>


