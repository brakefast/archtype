<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="false" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" required="false" description="输入框值（Name）"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="数据地址"%>
<%@ attribute name="type" type="java.lang.String" required="false" description="custom自定义 "%>
<%@ attribute name="width" type="java.lang.String" required="false" description="控件宽度"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled"%>


<c:choose>
	<c:when test="${type=='custom'}">
	</c:when>

	<c:otherwise>
		<script type="text/javascript">
			function edit${id}(){
                $("#${labelName}Id").attr("disabled",false);//点击后手填外部人员
                $("#${labelName}Id").attr("readonly",false);//去除input元素的readonly属性
                $("#${id}").val($("#${labelName}Id").val());//清空id
                $("#${labelName}Id").focus();//设置光标
			};
            function searchGrid${id}(){
                $("#${labelName}Id").attr("readonly",true);//将input元素设置为readonly
                var param = {};
                param.dataUrl = "${url}";

                if(typeof ${id}_initParams === 'function'){
                    var result = ${id}_initParams(param);
                    if (!result){
                        return;
                    }
                }
                if(typeof ${id}_onclick === 'function'){
                    var status = ${id}_onclick();
                    if(!status){
                        return ;
                    }
                }

                top.layer.open({
                    type: 2,
                    area: param.area || ['800px', '580px'],
                    title:param.title || "${title}",
                    name:'friend',
                    content: App.ctx+param.dataUrl ,
                    btn: ['确定', '关闭'],
                    yes: function(index, layero){
                        var iframeWin = layero.find('iframe')[0].contentWindow; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
                        if (typeof iframeWin.checkJqGrid_Data === "function"){
                            if(!iframeWin.checkJqGrid_Data()){
                                return;
                            }
                        }

                        //值改变事件
                        var oldId = $("#${id}").val();
                        var oldLabel = $("#${labelName}Id").val();
                        if (typeof iframeWin.getSelectedId === "function"){
                            //控件赋值
                            var itemId = iframeWin.getSelectedId();
                            var itemName = iframeWin.getSelectedName();
                            $("#${id}").val(itemId);
                            $("#${labelName}Id").val(itemName).attr("title",itemName);
                            var newId = iframeWin.getSelectedId();
                            var newLabel = iframeWin.getSelectedName();
                            if(oldId!=newId){
                                if(typeof ${id}_change === 'function'){
                                    var changeErg = {};
                                    changeErg.oldId = oldId;
                                    changeErg.newId = newId;
                                    changeErg.oldLabel = oldLabel;
                                    changeErg.newLabel = newLabel;
                                    ${id}_change(iframeWin,changeErg);
                                }
                            }
                        }
                        if(typeof ${id}_callback === 'function'){
                            ${id}_callback(iframeWin);
                        }
                        top.layer.close(index);
                    },
                    cancel: function(index){

                    }
                });
            };
		</script>
	</c:otherwise>
</c:choose>

<script type="text/javascript">
	$(document).ready(function () {
		<c:if test="${disabled=='true'}">
			$("#${id}").attr("disabled","disabled");
			$("#${labelName}Id").attr("disabled","disabled");
		</c:if>
		var labelEle = document.getElementById("${labelName}Id");
		if(!!labelEle){
            labelEle.title = labelEle.value;
        }
        $("#${labelName}Id").bind('input porpertychange',function(){
            var changeValue = $("#${labelName}Id").val();
            $("#${labelName}Id").attr("title",changeValue);
            $("#${id}").val(changeValue);
        });
	});
</script>


<div class="input-group">
	<input id="${labelName}Id" title="${labelValue}" readonly="readonly" type="text" class="<c:if test="${disabled=='true'}"> disabled</c:if>" name="${labelName}" value="${labelValue}" <c:if test="${width!=null}"> style="width:${width}" </c:if>/>
	<div class="input-group-addon">
		<button type="button" id="${id}Button1" onclick="edit${id}();" class="btn btn-primary <c:if test="${disabled=='true'}"> disabled</c:if>"><i class="fa fa-pencil"></i></button>
		<button type="button" id="${id}Button" onclick="searchGrid${id}();"  class="btn btn-primary <c:if test="${disabled=='true'}"> disabled</c:if>"><i class="fa fa-search"></i></button>
	</div>
</div>
<input id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose> type="hidden" value="${value}"/>
<label id="${id}Name-error" class="error" for="${id}Name" style="display:none"></label>