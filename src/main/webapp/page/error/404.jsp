<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/page/include/taglib.jsp"%>
<%@page import="com.ciocem.common.web.Servlets"%>
<%
response.setStatus(404);

// 如果是异步请求或是手机端，则直接返回信息
if (Servlets.isAjaxRequest(request)) {
	out.print("页面不存在.");
}

//输出异常信息页面
else {
%>
<!DOCTYPE html>
<html>

<head>
  <title>404 页面</title>
  <%--<link href="${ctxStatic}/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="${ctxStatic}/common/css/404/notfound.css"/>
</head>

<body class="gray-bg">

    <%--<div class="middle-box text-center animated fadeInDown">--%>
        <%--<h1>404</h1>--%>
        <%--<h3 class="font-bold">页面未找到！</h3>--%>

        <%--<div class="error-desc">--%>
            <%--抱歉，页面好像去火星了~--%>
        <%--</div>--%>
    <%--</div>--%>

    <div class="notFound">
        <div>前方在施工，<span id="time">10</span>秒后将回到<a id="addr" hidfocus="true" href="#">首页</a></div>
    </div>

    <script type="text/javascript">
        var el = document.getElementById("time");
        var request = '/dfdfdf';
        if(request.length > 0){
            var reg = /^\/(\w+)\//;
            var arr = request.match(reg);
            if(arr){
                switch(arr[1]){
                    case "musicLibrary":
                        request = "#";
                        break;
                    case "mv":
                        request = "#";
                        break;
                    case "fm":
                        request = "#";
                        break;
                    case "musicrank2":
                        request = "#";
                        break;
                    case "musicrank3":
                        request = "#";
                        break;
                    case "musicrankk7":
                        request = "#";
                        break;
                    case "musicranks":
                        break;
                    case "appstore":
                        break;
                    default:
                        request = "#";
                }
            } else {
                request = "#";
            }
        } else {
            request = "#";
        }
        //alert(request)
        document.getElementById("addr").href = request;

        setInterval(function(){
            var val = Number(el.innerHTML);
            if(val <= 1){
                location.replace(request);
            }else{
                el.innerHTML = val - 1;
            }
        },1000)
    </script>

</body>

</html>

<%}%>