<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="name" %>
<%@ attribute name="value" type="java.lang.String" required="false" description="value" %>

<c:choose>
    <c:when test="${name!=null}">
        <form:hidden id="${id}" path="${name}"  class="ordinary-input" value="${value}"   htmlEscape="false" />
    </c:when>
    <c:otherwise>
        <form:hidden id="${id}" path="${id}"  class="ordinary-input" value="${value}"   htmlEscape="false" />
    </c:otherwise>
</c:choose>


