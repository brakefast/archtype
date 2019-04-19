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
<script src="${ctxStatic}/js/application/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jquery-ui/jquery-ui.min.js"></script>
<script src="${ctxStatic}/js/application/jquery-validation/1.14.0/jquery.validate.js" type="text/javascript"></script>

<!-- 引入bootstrap插件 -->
<link href="${ctxStatic}/js/application/bootstrap/3.3.4/css_default/bootstrap.css" type="text/css" rel="stylesheet" />
<script src="${ctxStatic}/js/application/bootstrap/3.3.4/js/bootstrap.js"  type="text/javascript"></script>

<!-- 引入awesome插件 -->
<link href="${ctxStatic}/js/application/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />

<!-- 引入animate插件 -->
<link href="${ctxStatic}/common/animate/animate.css" rel="stylesheet" type="text/css" />

<!-- 引入hover插件 -->
<link href="${ctxStatic}/home/css/hover.css" rel="stylesheet" type="text/css" />

<!-- 引入jquery-notice插件 -->
<link href="${ctxStatic}/js/application/jquery-notice/style.css" rel="stylesheet" />

<!-- 引入layer插件 -->
<script src="${ctxStatic}/js/application/layer/3.0.1/layer/layer.js"></script>
<script src="${ctxStatic}/common/laydate/laydate.js"></script>

<!-- 引入dateUtilsr插件 -->
<script src="${ctxStatic}/common/dateUtils.js" type="text/javascript"></script>

<link href="${ctxStatic}/js/application/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
<script src="${ctxStatic}/js/application/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.js" type="text/javascript"></script>

<!-- 引入jqGrid插件 -->
<link href="${ctxStatic}/js/application/jqGrid/4.6/plugins/ui.multiselect.css" rel="stylesheet"/>
<script src="${ctxStatic}/js/application/jqGrid/4.6/plugins/ui.multiselect.js" type="text/javascript"></script>
<link href="${ctxStatic}/js/application/jqGrid/4.6/css/ui.jqgrid.css" rel="stylesheet" />
<link href="${ctxStatic}/js/application/jqGrid/4.6/css/default/jquery-ui-1.8.2.custom.css" rel="stylesheet"/>
<script src="${ctxStatic}/js/application/jqGrid/4.6/i18n/grid.locale-cn.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jqGrid/4.6/js/jquery.jqGrid.js" type="text/javascript"></script>
<script src="${ctxStatic}/js/application/jqGrid/4.6/plugins/grid.complexHeaders.js" type="text/javascript"></script>

<!-- 引入template插件 -->
<script type="text/javascript" src="${ctxStatic}/js/application/template/template.min.js"></script>

<!--引入bluebird.js让ie浏览器支持ES6属性-->
<script type="text/javascript" src="${ctxStatic}/home/js/bluebird.min.js"></script>

<%--ciocem--%>
<%--<link href="${ctxStatic}/common/ciocem.css" type="text/css" rel="stylesheet"/>--%>
<script src="${ctxStatic}/common/ciocem.js" type="text/javascript"></script>

<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
<script type="text/javascript">
    var App = {
        "ctx":"${pageContext.request.contextPath}${fns:getAdminPath()}",
        "static":"${pageContext.request.contextPath}"+"/static",
        "showType":{"add":"0","edit":"1","view":"2","copy":"3"}
    };
</script>