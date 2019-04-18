<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>

<%@ attribute name="id" type="java.lang.String" required="true" description="编号" %>
<%@ attribute name="name" type="java.lang.String" required="false" description="隐藏域名称 " %>
<%@ attribute name="value" type="java.lang.String" required="false" description="隐藏域值（ID）" %>
<%@ attribute name="labelName" type="java.lang.String" required="false" description="" %>
<%@ attribute name="labelValue" type="java.lang.String" required="false" description="输入框值（Name）" %>
<%@ attribute name="parentId" type="java.lang.String" required="false" description="是否按照父节点进行过滤" %>
<%@ attribute name="isOrg" type="java.lang.String" required="false" description="是否法人组织  " %>
<%@ attribute name="onlyDepartment" type="java.lang.String" required="false" description="只允许选择非法人组织" %>
<%@ attribute name="mutiselect" type="java.lang.String" required="false" description="是否允许多选" %>
<%@ attribute name="title" type="java.lang.String" required="false" description="选择框标题"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否限制选择，如果限制，设置为disabled" %>

<c:if test="${isOrg!=null and isOrg=='true'}">
    <c:set var="type" value="1"/>
</c:if>
<c:choose>
    <c:when test="${title!=null and title!=''}">
        <c:set var="titleName" value="${title}"/>
    </c:when>
    <c:otherwise>
        <c:set var="titleName" value="组织选择"/>
    </c:otherwise>
</c:choose>

<c:if test="${disabled=='true'}">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#${id}").attr("disabled", "disabled");
            $("#${id}Label").attr("disabled", "disabled");
            $("#${id}Button").attr("disabled", "disabled");
        });
    </script>
</c:if>

<div class="input-group">
    <input type="text" id="${id}Label" <c:choose><c:when test="${labelName!=null}">name="${labelName}"</c:when> <c:otherwise>name="${id}LabelName" </c:otherwise></c:choose> readonly="readonly" value="${labelValue}" title="${labelValue}"/>
    <div class="input-group-addon">
        <button type="button" id="${id}Button" class="btn <c:if test="${disabled=='true'}"> disabled</c:if> btn-primary"><i class="fa fa-search"></i></button>
    </div>
</div>
<input id="${id}" <c:choose><c:when test="${name!=null}">name="${name}"</c:when> <c:otherwise>name="${id}" </c:otherwise></c:choose>  type="hidden" value="${value}"/>
<label id="${id}Name-error" class="error" for="${id}Name" style="display:none"></label>

<script type="text/javascript">
    $(function () {
        $("#${id}Button,#${id}Label").bind("click", function () {
            //优先取parentId静态值，如果是动态赋值，则从#${id}去获取
            var parentId = "${parentId}";
            if($("#${id}").attr("parentId")!=null){
                parentId=$("#${id}").attr("parentId");
            }
            var onlyDepartment = "${onlyDepartment}";

            //如果页面实现了该行数则进行回调判断,如果函数返回false则直接不再弹出
            if(typeof ${id}_onclick === 'function'){
                var status = ${id}_onclick();
                if(!status){
                    return false;
                }
            }
            top.layer.open({
                type: 2,
                area: ['400px', '520px'],
                title: "${titleName}",
                ajaxData: {
                    selectIds: $("#${id}").val()
                },
                content: "${ctx}/tag/tagOrgSelectComplex?parentId="+parentId+"&type=${type}"+"&mutiselect=${mutiselect}",
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var contentWin = layero.find("iframe")[0].contentWindow;
                    debugger
                    var flagTree = contentWin.getFlagTree();
                    var tree = contentWin.flagTree;
                    var ids = [];
                    var names = [];
                    var nodes = [];

                    if ("${mutiselect}" == "true") {
                        nodes = tree.getCheckedNodes(true);
                    } else {
                        nodes = tree.getSelectedNodes();
                    }

                    for (var i = 0; i < nodes.length; i++) {
                        ids.push(nodes[i].id);
                        names.push(nodes[i].name);
                        if(onlyDepartment!=null&&onlyDepartment=='true'){
                            if(nodes[i].corporationFlag == '1'){
                                contentWin.showWarnMsg("请选择部门！")
                                return;
                            }
                        }
                    }

                    //值改变事件
                    var oldId = $("#${id}").val();
                    var newId = ids.join(",").replace(/u_/ig, "");
                    if(oldId!=newId){
                        if(typeof ${id}_change === 'function'){
                            if ("${mutiselect}" == "true") {
                                ${id}_change(nodes);
                            } else {
                                ${id}_change(nodes[0]);
                            }
                        }
                    }
                    //控件赋值
                    $("#${id}").val(ids.join(",").replace(/u_/ig, ""));
                    $("#${id}Label").val(names.join(","));
                    $("#${id}Label").focus();

                    if(typeof ${id}_callback === 'function'){
                       var result = {};
                        if ("${mutiselect}" == "true") {
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
