<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="名称" %>
<%@ attribute name="label" type="java.lang.String" required="true" description="标签名" %>
<%@ attribute name="value" type="java.lang.String" required="true" description="值" %>
<%@ attribute name="currentValue" type="java.lang.String" description="当前值，如果匹配上去则选中" %>


<c:choose>
    <c:when test="${currentValue==value}">
        <c:set var="checked" value="checked"/>
    </c:when>
    <c:otherwise>
        <c:set var="checked" value=""/>
    </c:otherwise>
</c:choose>

<span>
    <input id="${name}${value}" name="${name}" class="i-checks " type="radio" value="${value}" style="position: absolute; opacity: 0;"  ${checked}>
    <label for="${name}${value}" class="">${label}</label>
</span>