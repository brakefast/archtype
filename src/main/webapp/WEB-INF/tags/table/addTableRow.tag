<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/page/include/taglib.jsp"%>
<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="tableId" type="java.lang.String" required="false"%>
<%@ attribute name="formUrl" type="java.lang.String" required="true"%>
<%@ attribute name="saveUrl" type="java.lang.String" required="false"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="type" type="java.lang.String" required="false"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>

<sys:button id="${id}" type="new" name="新增"/>
<c:choose>
	<c:when test="${type=='custom'}">

	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#${id}").bind("click",function(){
					saveTableRowDialog(
							"新增"+"${title}",
							"${tableId}",
							"${formUrl}",
							"${saveUrl}",
							"${width==null?'800px':width}",
							"${height==null?'500px':height}",
							""
					);
				});
			});
		</script>
	</c:otherwise>
</c:choose>