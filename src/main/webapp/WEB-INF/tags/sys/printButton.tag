<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="name"	type="java.lang.String" required="false"  description="按钮名称"%>
<%@ attribute name="tableId" type="java.lang.String" required="false" description="表Id" %>
<%@ attribute name="moduleKey" type="java.lang.String" required="true" description="模块KEY" %>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="是否禁用" %>

<script type="text/javascript">
    // tableId 绑定list页面的表格id。没有绑定说明是form页面
    $(document).ready(function () {
        var moduleKey = '${moduleKey}';
        var table = '#${tableId}';
        $("#customPrintBtn").bind("click", function () {
            if(table=="#"){
                // tableId为#说明是form页面
                var id=$("#id").val();
                if(id == ""){
                    MsgUtil.warn("请先保存记录!");
                    return;
                }
                if(id == undefined){
                    MsgUtil.warn("打印按钮没有绑定tableId!");
                    return;
                }
                printFunc(id,moduleKey);
            }else{
                var id;
                var ids=$(table).jqGrid("getGridParam","selarrrow");
                if(ids==undefined){
                    var rows = $(table).bootstrapTable('getSelections');
                    if(rows.length == 0){
                        MsgUtil.warn("请选择一条记录!");
                        return;
                    }
                    id=rows[0].id;
                }else if(ids.length!=1){
                    MsgUtil.warn("请选择一条记录!");
                    return;
                }else{
                    id = ids[0];
                }
                printFunc(id,moduleKey);
            }
        });
    });

    function printFunc(id,moduleKey) {
        $.ajax({
            url: App.ctx + "/cio/printTemplate/selectPrintTempByModuleKey.json",
            data: {
                moduleKey: moduleKey
            },
            dataType: 'json',
            success: function (result) {
                if (result.success) {
                    var printTemplateId = result.body.printTemplateId;
                    if(printTemplateId!=undefined&&printTemplateId!=null){
                        // 只有1个模板时不用选择
                        window.open(App.ctx+'/common/ireport/formReportNew?businessId='+id+'&printTemplateId='+printTemplateId+'&moduleKey='+moduleKey,'_blank');
                    }else{
                        // 多个模板时，选模板进行打印
                        var moduleId = result.body.moduleId;
                        top.layer.open({
                            type: 2,
                            area: ['800px', '550px'],
                            title: '选择模板',
                            maxmin: false,
                            content: App.ctx + '/cio/printTemplate/printTemplateSelect?moduleId=' + moduleId,
                            btn: ['确定', '关闭'],
                            yes: function (index, layero) {
                                var iframeWin = layero.find('iframe')[0].contentWindow;
                                printTemplateId = iframeWin.getSelectedId();

                                if (printTemplateId == null || printTemplateId == '') {
                                    iframeWin.MsgUtil.warn("请选择模板！");
                                    return;
                                }
                                top.layer.close(index);
                                window.open(App.ctx+'/common/ireport/formReportNew?businessId='+id+'&printTemplateId='+printTemplateId+'&moduleKey='+moduleKey,'_blank');
                            },
                            cancel: function (index) {
                            }
                        });
                    }
                } else {
                    MsgUtil.error(result.msg);
                }
            }
        });

    }
</script>

<c:choose>
    <c:when test="${disabled!=null and disabled=='true'}">
        <c:set var="class_disabled" value=" disabled"/>
    </c:when>
    <c:otherwise>
        <c:set var="class_disabled" value=""/>
    </c:otherwise>
</c:choose>

<button id="customPrintBtn" type="button" class="btn btn-info ${class_disabled}" data-toggle="tooltip" data-placement="right"   <c:choose><c:when test="${name!=null}">title="${name}"</c:when> <c:otherwise>title="打印" </c:otherwise></c:choose>">
<c:choose><c:when test="${name!=null}">${name}</c:when> <c:otherwise>打印</c:otherwise></c:choose>
</button >









