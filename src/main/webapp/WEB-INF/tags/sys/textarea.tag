<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="rows" type="java.lang.String" required="false" description="行数" %>
<%@ attribute name="cols" type="java.lang.String" required="false" description="列数" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="名称" %>
<%@ attribute name="value" type="java.lang.String" required="false" description="属性值" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="不可编辑" %>

<textarea id="${id}" <c:if test="${disabled == true}">disabled="disabled"</c:if> <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}"</c:otherwise></c:choose><c:if test="${rows!=null}">rows="${rows}" </c:if><c:if test="${cols!=null}">cols="${cols}"</c:if> class="inp" style="width: 100%;height: 100%;">${value}</textarea>
