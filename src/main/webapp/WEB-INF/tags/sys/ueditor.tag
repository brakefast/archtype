<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="ID"%>
<%@ attribute name="strHtml" type="java.lang.String" required="false" description="内容"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否禁用"%>
<%@ attribute name="type" type="java.lang.String" required="false" description="控件类型 custom"%>


<script id="${id}" type="text/plain"></script>

<c:choose>
    <c:when test="${type=='custom'}">

    </c:when>
    <c:otherwise>
        <script type="text/javascript">
            var ueditor = UE.getEditor('${id}');
            $(function(){
                ueditor.addListener( 'ready', function( editor ) {
                <c:if test="${strHtml!=null}">
                    ueditor.execCommand('insertHtml','${strHtml}');
                </c:if>

                <c:choose>
                    <c:when test="${disabled==true}">
                         ueditor.setDisabled();
                    </c:when>

                    <c:otherwise>

                    </c:otherwise>
                </c:choose>
                });
            })
        </script>
    </c:otherwise>
</c:choose>









