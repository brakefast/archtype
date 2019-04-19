<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/page/include/taglib.jsp"%>
<%@ attribute name="id" 	type="java.lang.String" required="true"  description="Id"%>
<%@ attribute name="type" 	type="java.lang.String" required="true"  description="按钮类型"%>
<%@ attribute name="name"	type="java.lang.String" required="true"  description="按钮名称"%>
<%@ attribute name="title" 	type="java.lang.String" required="false" description="标题"%>
<%@ attribute name="disabled" 	type="java.lang.String" required="false" description="禁用"%>

<c:choose>
 <c:when test="${disabled!=null and disabled=='true'}">
  <c:set var="class_disabled" value=" disabled"/>
 </c:when>
 <c:otherwise>
  <c:set var="class_disabled" value=""/>
 </c:otherwise>
</c:choose>

<%--<c:choose>--%>
<%--<c:when test="${disabled!=null and disabled=='true'}">--%>
<%--<c:set var="btn_disabled" value=" disabled='true'"/>--%>
<%--</c:when>--%>
<%--<c:otherwise>--%>
<%--<c:set var="btn_disabled" value=""/>--%>
<%--</c:otherwise>--%>
<%--</c:choose>--%>

<c:if test="${type=='confim'}">
 <button type="button"  class="btn btn-info ${class_disabled}"  data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='copy'}">
 <button type="button"  class="btn btn-warning ${class_disabled}"   data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='save'}">
 <button type="button"  class="btn btn-warning ${class_disabled}"   data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='refresh'}">
 <button type="button"  class="btn btn-info ${class_disabled}"  data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='attachment'}">
 <button type="button"  class="btn btn-info attachment ${class_disabled}"  data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='new'}">
 <button type="button" class="btn btn-info ${class_disabled}"  data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='edit'}">
 <button type="button"  class="btn btn-warning ${class_disabled}" data-toggle="tooltip" id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='delete'}">
 <button type="button" class="btn btn-danger ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='cancel'}">
 <button type="button"   class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='turnOut'}">
 <button type="button"   class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='see'}">
 <button type="button" class="btn btn-search ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='forReview'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='return'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='record'}">
 <button type="button"   class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='borrow'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='seal'}">
 <button type="button"  class="btn btn-warning ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='destroy'}">
 <button type="button"  class="btn btn-danger ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='stop'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='start'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='use'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='exchange'}">
 <button type="button"  class="btn btn-warning ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='sealConfirm'}">
 <button type="button"  class="btn btn-warning ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='payConfirm'}">
 <button type="button"  class="btn btn-danger ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='print'}">
 <button type="button" class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='search'}">
 <button type="button"  class="btn btn-search ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='resetting'}">
 <button type="button"  class="btn btn-warning ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='cleanUp'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='delay'}">
 <button type="button"  class="btn btn-info ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='approve'}">
 <button type="button"  class="btn btn-danger ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>

<c:if test="${type=='save1'}">
 <button type="button"  class="btn btn-green ${class_disabled}"   data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='forReview1'}">
 <button type="button"  class="btn btn-blue ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='print1'}">
 <button type="button" class="btn btn-purple ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='approve1'}">
 <button type="button"  class="btn btn-gray ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="right"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='new1'}">
 <button type="button" class="btn btn-grassGreen ${class_disabled}"  data-toggle="tooltip"  id="${id}"   data-placement="left"  <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='see1'}">
 <button type="button" class="btn btn-cyanine ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button>
</c:if>
<c:if test="${type=='view'}">
 <button type="button"  class="btn btn-greyBlue ${class_disabled}" data-toggle="tooltip" id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name} <i class="fa fa-caret-up"></i></button>
</c:if>
<c:if test="${type=='processApprove'}">
 <button type="button"  class="btn btn-darkBlue ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>
<c:if test="${type=='mail'}">
 <button type="button"  class="btn btn-cyanine ${class_disabled}" data-toggle="tooltip"  id="${id}"   data-placement="left"   <c:choose><c:when test="${title!=null}">title="${title}"</c:when> <c:otherwise>title="${name}" </c:otherwise></c:choose>">${name}</button >
</c:if>