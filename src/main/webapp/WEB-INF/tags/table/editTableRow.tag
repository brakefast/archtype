<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/page/include/taglib.jsp"%>
<%@ attribute name="title" type="java.lang.String" required="true"%>
<%@ attribute name="tableId" type="java.lang.String" required="false"%>
<%@ attribute name="formUrl" type="java.lang.String" required="true"%>
<%@ attribute name="saveUrl" type="java.lang.String" required="false"%>
<%@ attribute name="checkUrl" type="java.lang.String" required="false"%>
<%@ attribute name="width" type="java.lang.String" required="false"%>
<%@ attribute name="height" type="java.lang.String" required="false"%>
<%@ attribute name="type" type="java.lang.String" required="false"%>
<%@ attribute name="id" type="java.lang.String" required="false"%>

<sys:button id="${id}" type="edit" name="编辑"/>
<c:choose>
	<c:when test="${type=='custom'}">

	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#${id}").bind("click",function(){
					editTableRowFunc();
				});
			});

			function editTableRowFunc(){
				var ids=$("#${tableId}").jqGrid("getGridParam","selarrrow");
				if(ids.length==0){
					MsgUtil.warn("请选择一条记录!");
					return;
				}
                if (ids.length > 1) {
                    MsgUtil.warn("只能选择一条记录!");
                    return;
                }
                saveTableRowDialog(
                    "修改" + "${title}",
                    "${tableId}",
                    "${formUrl}?id=" + ids[0],
                    "${saveUrl}",
                    "${width==null?'800px':width}",
                    "${height==null?'500px':height}",
                    "${checkUrl}"
                );

			}
		</script>
	</c:otherwise>
</c:choose>