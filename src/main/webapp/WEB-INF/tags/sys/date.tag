<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="名称" %>
<%@ attribute name="type" type="java.lang.String" required="false" description="控件类型 custom" %>
<%@ attribute name="value" type="java.util.Date" required="false" description="日期格式的属性值" %>
<%@ attribute name="isTime" type="java.lang.String" required="false" description="显示时间格式" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否只读" %>
<%@ attribute name="startDateId" type="java.lang.String" required="false" description="起始时间ID" %>
<%@ attribute name="endDateId" type="java.lang.String" required="false" description="结束时间ID" %>
<%@ attribute name="minDate" type="java.lang.String" required="false" description="起始时间值" %>



<c:choose>
	<c:when test="${type=='custom'}">
	
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		    $(document).ready(function(){
                $("#${id}").click(function(){
                    laydate({
                        <c:if test="${minDate != null}">
                        min:"${minDate}",
                        </c:if>
                        <c:if test="${startDateId != null}">
                        min: $("#${startDateId}").val(),
                        </c:if>
                        <c:if test="${endDateId != null}">
                        max: $("#${endDateId}").val(),
                        </c:if>
                        <c:choose>
                        <c:when test="${isTime!=null and isTime=='true'}">
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm',
                        </c:when>
                        <c:when test="${isTime!=null and isTime=='all'}">
                        istime: true,
                        format: 'YYYY-MM-DD hh:mm:ss',
                        </c:when>
                        <c:otherwise>
                        </c:otherwise>
                        </c:choose>
                        elem: '#${id}',
                        event: 'focus',
						choose:function (date) {
							if(typeof ${id}_choose === 'function'){
								${id}_choose(date);
                            }
                        }
                    });
                    $("#${id}").attr("title",$("#${id}").val());
				})

		    });
		</script>
	</c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${isTime!=null and isTime=='true'}">
		<c:set var="pattern" value="yyyy-MM-dd HH:mm"/>
	</c:when>
	<c:when test="${isTime!=null and isTime=='all'}">
		<c:set var="pattern" value="yyyy-MM-dd HH:mm:ss"/>
	</c:when>
	<c:otherwise>
		<c:set var="pattern" value="yyyy-MM-dd"/>
	</c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${value!=null}">
        <input id="${id}"  <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose> class="laydate-icon layer-date date-input<c:if test="${disabled=='true'}"> readonly</c:if>" value="<fmt:formatDate value='${value}' type="date" pattern='${pattern}'/>" <c:if test="${disabled=='true'}">disabled="disabled" </c:if> />
    </c:when>
    <c:otherwise>
        <input id="${id}"   <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose>  class="laydate-icon layer-date date-input<c:if test="${disabled=='true'}"> readonly</c:if>" pattern="${pattern}" <c:if test="${disabled=='true'}">disabled="disabled" </c:if>/>
    </c:otherwise>
</c:choose>


