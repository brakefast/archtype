<%@ page contentType="text/html;charset=UTF-8" %>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="author" content="http://www.ciocem.com" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<meta name="renderer" content="webkit" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Cache-Control" content="no-store" />
<%--<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" />--%>
<link rel="shortcut icon" type="image/x-icon" href="${ctxStatic}/images/favicon.ico" />

<!-- 引入jquery插件 -->
<%--<script src="${ctxStatic}/js/application/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>--%>
<script src="${ctxStatic}/js/application/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jquery/jquery-migrate-1.1.1.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jquery/jquery.tablednd.js"></script>
<script src="${ctxStatic}/js/application/jquery/jquery.slimscroll.min.js"></script>
<script src="${ctxStatic}/js/application/jquery-validation/1.14.0/jquery.validate.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>

<link href="${ctxStatic}/js/application/jquery-select2/4.0.3/css/select2-bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="${ctxStatic}/js/application/jquery-select2/4.0.3/css/select2.css" rel="stylesheet" type="text/css"/>
<script src="${ctxStatic}/js/application/jquery-select2/4.0.3/js/select2.full.js"></script>
<script src="${ctxStatic}/js/application/jquery-select2/4.0.3/js/i18n/zh-CN.js"></script>

<script src="${ctxStatic}/js/application/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/pace/pace.min.js"></script>
<script src="${ctxStatic}/js/application/metisMenu/jquery.metisMenu.js"></script>

<link href="${ctxStatic}/js/application/iCheck/custom.css" rel="stylesheet" />
<script src="${ctxStatic}/js/application/iCheck/icheck.min.js"></script>
<script src="${ctxStatic}/js/application/iCheck/icheck-init.js"></script>

<link href="${ctxStatic}/js/application/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
<script src="${ctxStatic}/js/application/dataTables/jquery.dataTables.js"></script>
<script src="${ctxStatic}/js/application/dataTables/dataTables.bootstrap.js"></script>

<script src="${ctxStatic}/js/application/jquery-ui/jquery-ui.min.js"></script>
<!-- jqGrid列拖拽 -->
<script src="${ctxStatic}/js/application/jquery-ui/jquery.ui.widget.js"></script>
<script src="${ctxStatic}/js/application/jquery-ui/jquery.ui.sortable.js"></script>

<!-- 引入buttons插件 -->
<%--<link href="${ctxStatic}/common/css/buttons.css" type="text/css" rel="stylesheet" />--%>
<!-- 引入viewer插件 -->
<link href="${ctxStatic}/js/application/viewerjs/viewer.css" rel="stylesheet" />
<script src="${ctxStatic}/js/application/viewerjs/viewer.js"></script>
<!-- 引入bootstrap插件 -->
<link href="${ctxStatic}/js/application/bootstrap/3.3.4/css_default/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/js/application/bootstrap/3.3.4/js/bootstrap.js"  type="text/javascript"></script>
<link href="${ctxStatic}/js/application/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
<!-- 引入自定义图标 -->
<link href="${ctxStatic}/common/css/customized-icon/style.css" rel="stylesheet">

<!--引入jQuery-spinner插件-->
<link rel="stylesheet" href="${ctxStatic}/js/application/jquery-spinner/bootstrap-spinner.css">
<script src="${ctxStatic}/js/application/jquery-spinner/jquery.spinner.js"></script>
<script src="${ctxStatic}/js/application/jquery-spinner/jquery-spinner.js"></script>

<!--引入jQuery-数字格式插件-->
<script type="text/javascript" src="${ctxStatic}/js/application/jquery-formatCurrency/jquery.numberFormat.js"></script>

<!-- 引入layer插件 -->
<script src="${ctxStatic}/js/application/layer/3.0.1/layer/layer.js"></script>
<script src="${ctxStatic}/js/application/layer/3.0.1/layer/laydate/laydate.js"></script>
<%--<script src="${ctxStatic}/js/application/layer-v3.1.0/layer/layer.js"></script>--%>
<%--<script src="${ctxStatic}/js/application/layDate-v5.0.7/laydate/laydate.js"></script>--%>


<!--引入webuploader-->
<link rel="stylesheet" type="text/css" href="${ctxStatic}/js/application/webuploader/0.1.5/webuploader.css">
<script type="text/javascript" src="${ctxStatic}/js/application/webuploader-0.1.5/webuploader.js"></script>

<!-- 引入自定义文件 -->
<script src="${ctxStatic}/common/mustache.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/content.js" type="text/javascript"></script>
<%--login.css先注销还不确定对现在样式的影响，待确定后看是否删除 2017/11/30--%>
<%--<link href="${ctxStatic}/common/css/login.css" type="text/css" rel="stylesheet" />--%>
<script src="${ctxStatic}/common/formUtils.js" type="text/javascript"></script>
<script src="${ctxStatic}/common/dateUtils.js" type="text/javascript"></script>

<!-- 引入bootstrapTable -->
<link href="${ctxStatic}/js/application/bootstrap-table/src/bootstrap-table.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/js/application/bootstrap-table/src/bootstrap-table-extend.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/js/application/bootstrap-table/src/bootstrap-table.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/bootstrap-table/src/locale/bootstrap-table-zh-CN.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/bootstrap-table/src/extensions/resizable/bootstrap-table-resizable.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/bootstrap-table/src/extensions/resizable/colResizable-1.5.js" type="text/javascript"></script>


<script src="${ctxStatic}/js/application/bootstrap-table/src/extensions/editable/bootstrap-table-editable.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/bootstrap3-editable/js/bootstrap-editable.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/bootstrap3-editable/js/moment.js" type="text/javascript"></script>
<link href="${ctxStatic}/js/application/bootstrap3-editable/css/bootstrap-editable.css" rel="stylesheet" type="text/css" />

<!-- 引入bootstrap dualistbox -->
<link href="${ctxStatic}/js/application/bootstrap-duallistbox/dist/bootstrap-duallistbox.css" rel="stylesheet" type="text/css" />
<script src="${ctxStatic}/js/application/bootstrap-duallistbox/dist/jquery.bootstrap-duallistbox.js" type="text/javascript"></script>

<!--引入bootstrap-fileinput插件-->
<link rel="stylesheet" media="all" href="${ctxStatic}/js/application/bootstrap-fileinput/css/fileinput.css">
<script src="${ctxStatic}/js/application/bootstrap-fileinput/js/fileinput.js"></script>


<link href="${ctxStatic}/js/application/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
<script src="${ctxStatic}/js/application/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>


<link href="${ctxStatic}/js/application/jqGrid/4.6/plugins/ui.multiselect.css" rel="stylesheet"/>
<script src="${ctxStatic}/js/application/jqGrid/4.6/plugins/ui.multiselect.js" type="text/javascript"></script>

<link href="${ctxStatic}/js/application/jqGrid/4.6/css/ui.jqgrid.css" rel="stylesheet" />
<link href="${ctxStatic}/js/application/jqGrid/4.6/css/default/jquery-ui-1.8.2.custom.css" rel="stylesheet"/>
<script src="${ctxStatic}/js/application/jqGrid/4.6/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jqGrid/4.6/js/jquery.jqGrid.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jqGrid/4.6/plugins/grid.complexHeaders.js" type="text/javascript"></script>

<script type="text/javascript" src="${ctxStatic}/js/application/template/template.min.js"></script>

<!--引入bluebird.js让ie浏览器支持ES6属性-->
<script type="text/javascript" src="${ctxStatic}/home/js/bluebird.min.js"></script>

<!-- ciocem -->
<link href="${ctxStatic}/common/normalize.6.0.reset.css" type="text/css" rel="stylesheet" />

<script src="${ctxStatic}/common/ciocem.js" type="text/javascript"></script>
<link href="${ctxStatic}/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />
<link href="${ctxStatic}/common/ciocem.css" type="text/css" rel="stylesheet" />

<link href="${ctxStatic}/common/css/style-new.css" type="text/css" rel="stylesheet" />


<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
<script type="text/javascript">
    var App = {
        "ctx":"${pageContext.request.contextPath}${fns:getAdminPath()}",
        "static":"${pageContext.request.contextPath}"+"/static",
        "showType":{"add":"0","edit":"1","view":"2","copy":"3"}
    };
</script>
