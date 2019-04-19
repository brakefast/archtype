<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>

<%@ attribute name="checked" type="java.lang.String" required="false" description="是否显示复选框，如果不需要返回父节点，请设置notAllowSelectParent为true" %>
<%@ attribute name="extId" type="java.lang.String" required="false" description="排除掉的编号（不能选择的编号）" %>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="是否列出全部数据，设置true则不进行数据权限过滤（目前仅对Office有效）" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled" %>

<%@ attribute name="id" type="java.lang.String" required="true" description="编号" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="隐藏域名称 " %>
<%@ attribute name="value" type="java.lang.String" required="false" description="隐藏域值（ID）" %>
<%@ attribute name="labelName" type="java.lang.String" required="false" description="" %>
<%@ attribute name="labelValue" type="java.lang.String" required="false" description="输入框值（Name）" %>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题" %>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址" %>
<%@ attribute name="parentId" type="java.lang.String" required="false" description="是否按照父节点进行过滤" %>
<%@ attribute name="type" type="java.lang.String" required="false" description="树节点类型 " %>

<%@ attribute name="onlyLeaf" type="java.lang.String" required="false" description="只允许选择末级节点"%>
<%@ attribute name="refuseFirstNode" type="java.lang.String" required="false" description="不允许选择第一级节点"%>
<%@ attribute name="width" type="java.lang.String" required="false" description="宽度"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="高度"%>

<%@ attribute name="customParam" type="java.lang.String" required="false" description="自定义参数" %>


<c:choose>
    <c:when test="${width!=null and width!=''}">
        <c:set var="setWidth" value="${width}"/>
    </c:when>
    <c:otherwise>
        <c:set var="setWidth" value="300"/>
    </c:otherwise>
</c:choose>

<c:choose>
    <c:when test="${height!=null and height!=''}">
        <c:set var="setHeight" value="${height}"/>
    </c:when>
    <c:otherwise>
        <c:set var="setHeight" value="420"/>
    </c:otherwise>
</c:choose>


<c:if test="${disabled=='true'}">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#${id}").attr("disabled", "disabled");
            var ${id}Label_value = $($("#${id}Label")).val();
            $("#${id}Label").attr("disabled", "disabled").attr('title',${id}Label_value).on('change',function(){
                $(this).attr('title',$(this).val());
            });
            $("#${id}Button").attr("disabled", "disabled");
        });
    </script>
</c:if>

<div class="input-group">
    <input type="text" id="${id}Label" name="${labelName}" readonly="readonly" value="${labelValue}" title="${labelValue}"/>
    <div class="input-group-addon">
        <button type="button" id="${id}Button" class="btn <c:if test="${disabled=='true'}"> disabled</c:if> btn-primary"><i class="fa fa-search"></i></button>
    </div>
</div>
<input id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose>  type="hidden" value="${value}"/>
<label id="${id}Name-error" class="error" for="${id}Name" style="display:none"></label>

<script type="text/javascript">
    var _isChecked = false;
    $(function () {
        $("#${id}Button,#${id}Label").bind("click", function () {

            var customParam = '${customParam}';

            //因为是动态赋值，所以要触发再去获取
            var parentId = "${parentId}";
            if ("${checked}" == "true") {
                _isChecked = true;
            }
            if($("#${id}").attr("parentId")!=null){
                parentId=$("#${id}").attr("parentId");
            }

            var param = {};
            param.dataUrl = "${url}";
            if(typeof ${id}_initParams === 'function'){
                var result = ${id}_initParams(param);
                if (!result){
                    return;
                }
            }

            //如果函数返回false则直接不再弹出
            if(typeof ${id}_onclick === 'function'){
                var status = ${id}_onclick();
                if(!status){
                    return ;
                }
            }

            top.layer.open({
                type: 2,
                area: ['${setWidth}px', '${setHeight}px'],
                title: "选择${title}",
                ajaxData: {selectIds: $("#${id}").val()},
                content: "${ctx}/tag/treeselect?url=" + encodeURIComponent(param.dataUrl) + "&customParam="+customParam+"&checked=${checked}&extId=${extId}&isAll=${isAll}&parentId="+parentId+"&type=${type}"+"&selectIds="+$("#${id}").val(),
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var contentWin = layero.find("iframe")[0].contentWindow,
                        tree = contentWin.tree,
                        ids = [], names = [], nodes = [];
                    <c:if test="${onlyLeaf!=null and onlyLeaf=='true'}">
                        if(contentWin.isParentChecked()){
                            contentWin.MsgUtil.warn("请选择末级节点!");
                            return false;
                        }
                    </c:if>

                    if ("${checked}" == "true") {
                        nodes = tree.getCheckedNodes(true);
                    } else {
                        nodes = tree.getSelectedNodes();
                    }
                    <c:if test="${refuseFirstNode!=null and refuseFirstNode=='true'}">
                        if(nodes[0].level == 0){
                            contentWin.MsgUtil.warn("不可选择一级节点!");
                            return false;
                        }
                    </c:if>
                    for (var i = 0; i < nodes.length; i++) {
                        ids.push(nodes[i].id);
                        names.push(nodes[i].name);
                    }

                    //值改变事件
                    var oldId = $("#${id}").val();
                    var newId = ids.join(",").replace(/u_/ig, "");
                    if(oldId!=newId){
                        if(typeof ${id}_change === 'function'){
                            if ("${checked}" == "true") {
                                ${id}_change(nodes);
                            } else {
                                ${id}_change(nodes[0]);
                            }
                        }
                    }

                    $("#${id}").val(ids.join(",").replace(/u_/ig, ""));
                    $("#${id}Label").val(names.join(",")).attr('title',names.join(","));
                    $("#${id}Label").focus();
                    if(typeof ${id}_callback === 'function'){
                        var result = {};
                        if ("${checked}" == "true") {
                            result = ${id}_callback(nodes) || {};
                        } else {
                            result = ${id}_callback(nodes[0]) || {};
                        }
                       if (result.canclose != null && result.canclose != undefined && result.canclose === false){
                            contentWin.MsgUtil.warn(result.msg);
                            return;
                       }
                    }
                    top.layer.close(index);
                },
                cancel: function (index) {

                }
            });
        });
    });
</script>
