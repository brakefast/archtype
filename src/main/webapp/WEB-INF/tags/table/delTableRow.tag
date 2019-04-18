<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true"%>
<%@ attribute name="tableId" type="java.lang.String" required="false"%>
<%@ attribute name="delUrl" type="java.lang.String" required="true"%>

<sys:button id="${id}" type="delete" name="删除"/>
<c:choose>
	<c:when test="${type=='custom'}">

	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#${id}").bind("click",function(){
					delTableRowFunc();
				});
			});

			function delTableRowFunc(){
				var ids=$("#${tableId}").jqGrid("getGridParam","selarrrow");
				if(ids.length==0){
					MsgUtil.warn("请至少选择一条记录!");
					return;
				}
				top.layer.confirm('确认要彻底删除数据吗?', {icon: 3, title:'系统提示'}, function(index){
					$.ajax({
						url: '${delUrl}',
						data: {
							ids : ids.join(',')
						},
						dataType : 'json',
						success: function(result) {
							if(result.success){
								MsgUtil.success(result.msg);
								$("#${tableId}").trigger("reloadGrid");
							}else{
								MsgUtil.warn(result.msg);
							}
							top.layer.close(index);
						}
					});
				});
			}
		</script>
	</c:otherwise>
</c:choose>