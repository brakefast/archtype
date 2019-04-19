<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>

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
<%@ attribute name="rows" type="java.lang.String" required="false" description="行数" %>
<%@ attribute name="cols" type="java.lang.String" required="false" description="列数" %>

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
                area: ['790px', '600px'],
                title: "${titleName}",
                ajaxData: {
                    selectIds: $("#${id}").val()
                },
                content: "${ctx}/tag/tagOrgAndRoleAndEmpSelect?parentId="+parentId+"&type=${type}"+"&mutiselect=true"+"&selectIds="+$("#${id}").val(),
                btn: ['确定', '关闭'],
                yes: function (index, layero) {
                    var contentWin = layero.find("iframe")[0].contentWindow;
                    debugger
                    var ids = [];
                    var names = [];
                    var treeNodes = [], roleTreeNodes= [], newCheckedRows = [];
                    var checkInfos = {};
                    //返回选中的部门节点信息
                    treeNodes = contentWin.getTreeCheckNodes();
                    //返回选中的角色节点信息
                    roleTreeNodes = contentWin.getRoleOrgTreeCheckNodes();
                    //返回新选中的员工档案行数组
                    checkedRows = contentWin.getCheckedRows();
                    checkInfos.treeNodes = treeNodes;
                    checkInfos.roleTreeNodes = roleTreeNodes;
                    <%--if ("${mutiselect}" == "true") {--%>
                        <%--nodes = tree.getCheckedNodes(true);--%>
                    <%--} else {--%>
                        <%--nodes = tree.getSelectedNodes();--%>
                    <%--}--%>

                    for (var i = 0; i < treeNodes.length; i++) {
                        ids.push("org_id_"+treeNodes[i].id);
                        names.push(treeNodes[i].name);
                    }
                    for (var i = 0; i < roleTreeNodes.length; i++) {
                        ids.push("role_id_"+roleTreeNodes[i].id);
                        names.push(roleTreeNodes[i].name);
                    }
                    for (var i = 0; i < checkedRows.length; i++) {
                        ids.push("emp_id_"+checkedRows[i].id);
                        names.push(checkedRows[i].employeeName);
                    }

                    //值改变事件
                    var oldId = $("#${id}").val();
                    var newId = ids.join(",").replace(/u_/ig, "");
                    if(oldId!=newId){
                        if(typeof ${id}_change === 'function'){
                            <%--if ("${mutiselect}" == "true") {--%>
                                <%--${id}_change(nodes);--%>
                            <%--} else {--%>
                                <%--${id}_change(nodes[0]);--%>
                            <%--}--%>
                            ${id}_change(checkInfos);
                        }
                    }
                    //控件赋值
                    $("#${id}").val(ids.join(",").replace(/u_/ig, ""));
                    $("#${id}Label").val(names.join(",")).attr("title", names.join(","));
                    $("#${id}Label").focus();

                    if(typeof ${id}_callback === 'function'){
                       var result = {};
                        <%--if ("${mutiselect}" == "true") {--%>
                            <%--result = ${id}_callback(nodes) || {};--%>
                        <%--} else {--%>
                            <%--result = ${id}_callback(nodes[0]) || {};--%>
                        <%--}--%>
                        result = ${id}_callback(checkInfos) || {};
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
