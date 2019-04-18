<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ attribute name="src" type="java.lang.String" required="true" description="图片链接"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="图片高度"%>
<%@ attribute name="width" type="java.lang.String" required="false" description="图片宽度"%>
<%@ attribute name="id" type="java.lang.String" required="false" description="ID"%>

<c:choose>
    <c:when test="${height!=null and height!=''}">
        <c:set var="tagHeight" value="${height}"/>
    </c:when>
    <c:otherwise>
        <%--<c:set var="tagHeight" value="100px"/>--%>
    </c:otherwise>
</c:choose>
<c:choose>
    <c:when test="${width!=null and width!=''}">
        <c:set var="tagWidth" value="${width}"/>
    </c:when>
    <c:otherwise>
        <%--<c:set var="tagWidth" value="100px"/>--%>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${id!=null}">
        <img src="${src}"  id="${id}" onerror="javascript:this.src='${ctxStatic}/images/userinfo.jpg';"  width="${tagWidth}" height="${tagHeight}">
    </c:when>
    <c:otherwise>
        <img src="${src}"  id="${id}" onerror="javascript:this.src='${ctxStatic}/images/userinfo.jpg';"  width="${tagWidth}" height="${tagHeight}">
    </c:otherwise>
</c:choose>









