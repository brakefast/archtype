<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="名称" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="导出Url" %>
<%@ attribute name="tableId" type="java.lang.String" required="true" description="表格ID" %>
<%@ attribute name="fileName" type="java.lang.String" required="false" description="文件名称" %>
<%@ attribute name="title" type="java.lang.String" required="false" description="Excel标题" %>
<%@ attribute name="isTemplate" type="java.lang.String" required="false" description="是否根据模板导出" %>
<%@ attribute name="isAll" type="java.lang.String" required="false" description="是否是导出所有" %>
<%@ attribute name="otherParam" type="java.lang.String" required="false" description="其他参数" %>
<%@ attribute name="disabled" 	type="java.lang.String" required="false" description="禁用"%>
<c:choose>
	<c:when test="${isAll!=null and isAll=='true'}">
		<c:set var="setIsAll" value="1"/>
	</c:when>
	<c:otherwise>
		<c:set var="setIsAll" value="0"/>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${isTemplate!=null and isTemplate=='true'}">
		<c:set var="setIsTemplate" value="1"/>
	</c:when>
	<c:otherwise>
		<c:set var="setIsTemplate" value="0"/>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
	$(document).ready(function(){
		$("#${id}").bind("click",function(){
			var searchParams = "";
			<%--<c:if test="${isAll==null or isAll!='true'}">--%>
				searchParams = $('#searchForm').serialize();
			<%--</c:if>--%>
			location.href=App.ctx +"${url}?fileTitle=${title}&fileName=${fileName}&isAll=${setIsAll}&isTemplate=${setIsTemplate}&"+searchParams+getExportExcelUrl('${tableId}')+"${otherParam}";
		});
	});
</script>
<sys:button id="${id}" type="cleanUp" name="${name}" disabled="${disabled}"/>



