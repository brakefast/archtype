<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="Id" %>
<%@ attribute name="value" type="java.lang.String" required="false" description="Id" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否只读" %>


<script type="text/javascript">
    $(document).ready(function () {
        <c:if test="${disabled=='true'}">
        $("#${id}").attr("disabled","disabled").addClass("intro");
        </c:if>
        $("#${id}").css({whiteSpace:'nowrap',textOverflow:'ellipsis'});
        var ${id}_value = $("#${id}").val();
        $("#${id}").attr('title',${id}_value);
    });
</script>


<c:choose>
    <c:when test="${name!=null}">
        <form:password id="${id}" path="${name}" class="inp input-md" value="${value}"   htmlEscape="false" />
    </c:when>
    <c:otherwise>
        <form:password path="${id}" class="inp input-md" value="${value}"   htmlEscape="false" />
    </c:otherwise>
</c:choose>






