<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="items" type="java.util.List" required="true" description="集合" %>
<%@ attribute name="itemLabel" type="java.lang.String" required="false" description="属性名" %>
<%@ attribute name="itemValue" type="java.lang.String" required="false" description="属性值" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否禁用" %>

<c:if test="${disabled=='true'}">
    <c:forEach items="${items}" varStatus="status">
        <script type="text/javascript">
            $(document).ready(function () {
                $("#${id}"+${status.index+1}).prop("disabled", true);
            });
        </script>
    </c:forEach>
</c:if>
<c:choose>
    <c:when test="${itemLabel!=null and itemLabel!=''}">
        <c:set var="label" value="${itemLabel}"/>
    </c:when>
    <c:otherwise>
        <c:set var="label" value="label"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${itemValue!=null and itemValue!=''}">
        <c:set var="value" value="${itemValue}"/>
    </c:when>
    <c:otherwise>
        <c:set var="value" value="value"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${disabled=='true'}">
        <form:radiobuttons path="${id}" items="${items}" itemLabel="${label}" itemValue="${value}" htmlEscape="false" class="i-checks disabled"/>
    </c:when>
    <c:otherwise>
        <form:radiobuttons path="${id}" items="${items}" itemLabel="${label}" itemValue="${value}" htmlEscape="false" class="i-checks "/>
    </c:otherwise>
</c:choose>








