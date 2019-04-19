<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/page/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="ID"%>
<%@ attribute name="rule" type="java.lang.String" required="false" description="规则"%>
<%@ attribute name="name" type="java.lang.String" required="false" description="名称"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="值"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否禁用"%>
<%@ attribute name="thousands" type="java.lang.String" required="false" description="是否显示千分位"%>
<%@ attribute name="percent" type="java.lang.String" required="false" description="是否加入百分号"%>


<c:choose>
	<c:when test="${rule!=null and rule!=''}">
		<c:set var="ruleLa" value="${rule}"/>
	</c:when>
	<c:otherwise>
		<c:set var="ruleLa" value="defaults"/>
	</c:otherwise>
</c:choose>
<style>
	.input-group[data-trigger="hundreds"] {
		padding: 0;
	}
</style>
<script type="text/javascript">
	$(document).ready(function () {
		<c:if test="${disabled=='true'}">
			$("#${id}").parents('.spinner').attr('data-disabled','true').find('input').attr("disabled","disabled");
		</c:if>

		$("#${id}Up,#${id}Down").bind("click", function () {
			if(typeof ${id}_change === 'function'){
				setTimeout(function(){
					${id}_change("#${id}");
				},50)
			}
		});
        if($("#${id}").val() === undefined || $("#${id}").val() === null ||$("#${id}").val()===''){
            <%--$("#${id}").val(0);--%>
            <%--$("#${id}_show").val("0.00");--%>
        }
	});
</script>

<c:choose>
	<c:when test="${thousands=='true'}">
		<div class="input-group spinner" data-trigger="spin">
			<input type="text" data-type="show" id="${id}_show" class="spinner-class form-control text-center<c:if test="${disabled=='true'}"> disabled</c:if>" />
			<div class="input-group-addon spinner-btn-group">
			<a href="javascript:void(0)" id="${id}Up" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
			<a href="javascript:void(0)" id="${id}Down" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
		</div>
			<input type="hidden" data-type="hide" class="spinner-class" id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose> value="${value}">
		</div>
	</c:when>
	<c:when test="${percent=='true'}">
		<div class="input-group spinner" data-trigger="hundreds">
			<input type="text" id="${id}_show" data-type="show" class="spinner-class form-control text-center<c:if test="${disabled=='true'}"> disabled</c:if>" />
			<input type="hidden" data-type="hide" class="spinner-class" id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose> value="${value}">
		</div>
	</c:when>
	<c:otherwise>
		<div class="input-group spinner" data-trigger="spinner">
			<input type="text"  id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose>  class="spinner-class form-control text-center<c:if test="${disabled=='true'}"> disabled</c:if>" value="${value}"  data-rule="${ruleLa}"/>
			<div class="input-group-addon">
				<a href="javascript:void(0)" id="${id}Up" class="spin-up" data-spin="up"><i class="fa fa-caret-up"></i></a>
				<a href="javascript:void(0)" id="${id}Down" class="spin-down" data-spin="down"><i class="fa fa-caret-down"></i></a>
			</div>
		</div>
		<label id="${id}Name-error" class="error" for="${id}Name" style="display:none"></label>
	</c:otherwise>
</c:choose>



