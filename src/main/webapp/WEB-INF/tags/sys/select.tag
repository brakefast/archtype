<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="名称" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否禁用" %>
<%@ attribute name="type" type="java.lang.String" required="false" description="类型" %>
<%@ attribute name="defaultName" type="java.lang.String" required="false" description="默认名称" %>
<%@ attribute name="defaultValue" type="java.lang.String" required="false" description="默认值" %>
<%@ attribute name="items" type="java.util.List" required="false" description="集合" %>
<%@ attribute name="multi" type="java.lang.String" required="false" description="多选" %>
<%@ attribute name="value" type="java.lang.String" required="false" description="下拉框的属性值" %>
<%@ attribute name="width" type="java.lang.String" required="false" description="宽度" %>
<%@ attribute name="dontempty" type="java.lang.String" required="false" description="是否不需要空选项" %>

<c:if test="${disabled=='true'}">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#${id}").prop("disabled", true);
            $(".${id}-multi").prop("disabled", true);
        });
    </script>
</c:if>
<c:choose>
    <c:when test="${width == null or width == ''}">
        <c:set var="cwidth" value="200px"/>
    </c:when>
    <c:otherwise>
        <c:set var="cwidth" value="${width}"/>
    </c:otherwise>
</c:choose>

   <c:choose>
    <c:when test="${type!=null and type=='dict'}">
        <c:choose>
            <c:when test="${disabled=='true'}">
                <form:select path="${id}" class="select-input disabled" disabled="true" style="width:${cwidth}">
                    <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                    <form:options items="${items}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
            </c:when>
            <c:when test="${multi == 'true'}">
                <form:select path="${id}" class="select-input " style="width:${cwidth}" multiple="multiple">                    
                    <form:options items="${items}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
                <input type="hidden" id="${id}_select" name="${id}" value="${defaultValue}"/>
                <script type="text/javascript">
                    $(function(){
                        var $select = $("#${id}"), $value = $("#${id}_select");                                          
                        $select.val($value.val().split(";")).select2();
                        $select.on("change",function(){
                            var $this = $(this);
                            var values = $this.select2("val");
                            if (values) $value.val(values.join(";"));                            
                        });
                    });
                </script>
            </c:when> 
            <c:otherwise>
                <form:select path="${id}" class="select-input " style="width:${cwidth}">
                    <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                    <form:options items="${items}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${type!=null and type=='year'}">
        <c:choose>
            <c:when test="${disabled=='true'}">
                <form:select path="${id}" class="select-input disabled" disabled="true" style="width:${cwidth}">
                    <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            var date = new Date();
                            var year = date.getFullYear();
                            for (var i = 0; i < 10; i++) {
                                var obj = document.createElement("option");
                                var objText = document.createTextNode(year);
                                obj.appendChild(objText);
                                obj.setAttribute("value", year);
                                var value = '${value}';
                                if(value != null && value == year){
                                    obj.setAttribute("selected","selected");
                                }
                                document.getElementById('${id}').appendChild(obj);
                                year = year - 1;

                            }
                        });
                    </script>
                </form:select>
            </c:when>
            <c:otherwise>
                <form:select path="${id}" class="select-input " style="width:${cwidth}">
                    <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            var date = new Date();
                            var year = date.getFullYear();
                            for (var i = 0; i < 10; i++) {
                                var obj = document.createElement("option");
                                var objText = document.createTextNode(year);
                                obj.appendChild(objText);
                                obj.setAttribute("value", year);
                                var value = '${value}';
                                if(value != null && value == year){
                                    obj.setAttribute("selected","selected");
                                }
                                document.getElementById('${id}').appendChild(obj);
                                year = year - 1;

                            };
                        });
                    </script>
                </form:select>
            </c:otherwise>
        </c:choose>
    </c:when>
    <c:when test="${type!=null and type=='month'}">
         <c:choose>
             <c:when test="${disabled=='true'}">
                 <form:select path="${id}" class="select-input disabled" disabled="true" style="width:${cwidth}">
                     <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                     <script type="text/javascript">
                         $(document).ready(function () {
                             var date = new Date();
                             var currentMonth = date.getMonth() + 1;;
                             for (var i = 1; i < 13; i++) {
                                 var month = document.createElement("option");
                                 var monthText = document.createTextNode(i);
                                 month.appendChild(monthText);
                                 month.setAttribute("value", i);
                                 var value = '${value}';
                                 if(value != null && value == i){
                                     month.setAttribute("selected","selected");
                                 }
                                 document.getElementById('${id}').appendChild(month);
                             };
                         });
                     </script>
                 </form:select>
             </c:when>
             <c:otherwise>
                 <form:select path="${id}" class="select-input " style="width:${cwidth}">
                     <c:if test="${dontempty == null or dontempty == ''}">
                        <form:option value="" label=""/>
                    </c:if>
                     <script type="text/javascript">
                         $(document).ready(function () {
                             var date = new Date();
                             var currentMonth = date.getMonth() + 1;;
                             for (var i = 1; i < 13; i++) {
                                 var month = document.createElement("option");
                                 var monthText = document.createTextNode(i);
                                 month.appendChild(monthText);
                                 month.setAttribute("value", i);
                                 var value = '${value}';
                                 if(value != null && value == i){
                                     month.setAttribute("selected","selected");
                                 }
                                 document.getElementById('${id}').appendChild(month);
                             };
                         });
                     </script>
                 </form:select>
             </c:otherwise>
         </c:choose>
    </c:when>
    <c:when test="${type!=null and type=='week'}">
        <form:select path="${id}" class="select-input " style="width:${cwidth}">
             <c:if test="${dontempty == null or dontempty == ''}">
                <form:option value="" label=""/>
            </c:if>
             <script type="text/javascript">
                 $(document).ready(function () { 
                     var weeks = [], optHtml = "<option value='{value}' {select}>{name}</option>";                    
                     for (var i = 0; i < 7; i++) {
                         var weekDay='',week = '';
                         switch(i){
                            case 0:
                                weekDay = '周日';
                            break;
                            case 1:
                                weekDay = '周一';
                            break;
                            case 2:
                                weekDay = '周二';
                            break;
                            case 3:
                                weekDay = '周三';
                            break;
                            case 4:
                                weekDay = '周四';
                            break;
                            case 5:
                                weekDay = '周五';
                            break;
                            case 6:
                                weekDay = '周六';
                            break;
                         }
                         week = optHtml.replace("{name}",weekDay).replace("{value}",i);
                         var value = '${value}';
                         if(value != null && value == i){                             
                             week = week.replace("{select}","selected='selected'");
                         }else{
                            week = week.replace("{select}","");
                         }
                         weeks.push(week);
                     }
                    $("#${id}").append(weeks.join(''));
                 });
             </script>
         </form:select>
    </c:when>
    <c:when test="${type!=null and type=='day'}">
         <form:select path="${id}" class="select-input " style="width:${cwidth}">
             <c:if test="${dontempty == null or dontempty == ''}">
                <form:option value="" label=""/>
            </c:if>
             <script type="text/javascript">
                 $(document).ready(function () {                     
                     var appendHtmls = [], optHtml = "<option value='{value}' {select}>{name}</option>";                    
                     for (var i = 1; i < 32; i++) {
                         var desc='',opt = '';
                         switch(i){
                            case 29:
                                desc = '月末前两天';
                            break;
                            case 30:
                                desc = '月末前一天';
                            break;
                            case 31:
                                desc = '月末';
                            break;
                            default:
                                desc = i+'日';
                            break;
                         }
                         opt = optHtml.replace("{name}",desc).replace("{value}",i);
                         var value = '${value}';
                         if(value != null && value == i){                             
                             opt = opt.replace("{select}","selected='selected'");
                         }else{
                            opt = opt.replace("{select}","");
                         }
                         appendHtmls.push(opt);
                     }
                    $("#${id}").append(appendHtmls.join(''));
                 });
             </script>
         </form:select>
    </c:when>
    <c:when test="${type!=null and type=='hour'}">
        <form:select path="${id}" class="select-input " style="width:${cwidth}">
             <c:if test="${dontempty == null or dontempty == ''}">
                <form:option value="" label=""/>
            </c:if>
             <script type="text/javascript">
                 $(document).ready(function () {
                     var appendHtmls = [], optHtml = "<option value='{value}' {select}>{name}</option>";                    
                     for (var i = 0; i < 24; i++) {
                         var desc=i + "时",opt = '';
                         
                         opt = optHtml.replace("{name}",desc).replace("{value}",i);
                         var value = '${value}';
                         if(value != null && value == i){                             
                             opt = opt.replace("{select}","selected='selected'");
                         }else{
                            opt = opt.replace("{select}","");
                         }
                         appendHtmls.push(opt);
                     }
                    $("#${id}").append(appendHtmls.join(''));
                 });
             </script>
         </form:select>
    </c:when>
    <c:when test="${type!=null and type=='minute'}">
        <form:select path="${id}" class="select-input " style="width:${cwidth}">
             <c:if test="${dontempty == null or dontempty == ''}">
                <form:option value="" label=""/>
            </c:if>
             <script type="text/javascript">
                 $(document).ready(function () {
                      var appendHtmls = [], optHtml = "<option value='{value}' {select}>{name}</option>";                    
                     for (var i = 0; i < 60; i++) {
                         var desc= i+'分',opt = '';                         
                         opt = optHtml.replace("{name}",desc).replace("{value}",i);
                         var value = '${value}';
                         if(value != null && value == i){                             
                             opt = opt.replace("{select}","selected='selected'");
                         }else{
                            opt = opt.replace("{select}","");
                         }
                         appendHtmls.push(opt);
                     }
                    $("#${id}").append(appendHtmls.join(''));
                 });
             </script>
         </form:select>
    </c:when>
    <c:when test="${type!=null and type=='minutes'}">
        <form:select path="${id}" class="select-input " style="width:${cwidth}">
             <c:if test="${dontempty == null or dontempty == ''}">
                <form:option value="" label=""/>
            </c:if>
             <script type="text/javascript">
                 $(document).ready(function () {
                      var appendHtmls = [], optHtml = "<option value='{value}' {select}>{name}</option>";                    
                     for (var i = 5; i < 60; i+=5) {
                         var desc= i+'分',opt = '';                         
                         opt = optHtml.replace("{name}",desc).replace("{value}",i);
                         var value = '${value}';
                         if(value != null && value == i){                             
                             opt = opt.replace("{select}","selected='selected'");
                         }else{
                            opt = opt.replace("{select}","");
                         }
                         appendHtmls.push(opt);
                     }
                    $("#${id}").append(appendHtmls.join(''));
                 });
             </script>
         </form:select>
    </c:when>
    <c:otherwise>
        <select id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}"</c:otherwise></c:choose> class="select-input <c:if test="${disabled=='true'}"> disabled</c:if>" <c:if test="${disabled=='true'}"> disabled="disabled"</c:if> style="width: 201.83px;"></select>
    	<script type="text/javascript">
//            $(document).ready(function () {
                $("#${id}").append("<option value='${defaultValue}'>${defaultName}</option>");
//            });
        </script>
    </c:otherwise>
</c:choose>



