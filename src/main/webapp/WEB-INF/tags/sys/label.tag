<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="value" type="java.lang.String" required="false" description="value" %>

<label id="${id}">${value}</label>



