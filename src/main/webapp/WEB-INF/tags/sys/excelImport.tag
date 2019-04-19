<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="名称" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="导入方法" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否只读" %>
<script type="text/javascript">
	$(document).ready(function(){
		//导入操作
		$("#${id}").bind("click",function(){
			openExcelDialog("${url}");
		});
	});
</script>
<sys:button id="${id}" type="cleanUp" name="${name}"/>



