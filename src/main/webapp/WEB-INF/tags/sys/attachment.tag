<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/page/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="moduleKey" type="java.lang.String" required="true" description="模块KEY" %>
<%@ attribute name="bindFormId" type="java.lang.String" required="true" description="单据ID" %>

<link href="${ctxStatic}/common/css/newHome.css" rel="stylesheet" type="text/css" />
<link href="${ctxStatic}/common/css/innerStyle.css" rel="stylesheet" type="text/css" />
<style>
    iframe[name="attachmentName"] {
        width: 100%;
        height: 276px;
    }
</style>
<script type="text/javascript">
    var ${id}_refreshAttachment;
    var ${id}_readOnlyAttachment;
    $(document).ready(function () {
        //1、初始化加载
        ${id}_initAttachment();

        function ${id}_initAttachment(type) {
            var businessId = $('#${bindFormId}').val();
            var moduleKey = '${moduleKey}';
            var appendStr = '';
            if (typeof showType !== 'undefined') {
                appendStr = "&showType=" + showType;
            }

            if (type != null && type == '2') {
                appendStr = "&showType=" + showType;
            }

            $.ajax({
                type: "post",
                url: App.ctx + "/base/fileAttachM/isShowAttach.json",
                dataType: 'json',
                data: {
                    businessId: businessId,
                    moduleKey: moduleKey
                },
                success: function (result) {
                    ${id}.src = App.ctx + "/base/fileAttachM/common?moduleKey=${moduleKey}&businessId=" + businessId + appendStr;
                    if (result.success) {
                        $(".attachment").click();
                    }
                }
            });
            // 加载流程审批
            getModelInfo(businessId,moduleKey);
        }

        //2、动态刷新
        ${id}_refreshAttachment = function (type) {
            var businessId = $('#${bindFormId}').val();
            var moduleKey = '${moduleKey}';
            var appendStr = '';
            if (typeof showType !== 'undefined') {
                appendStr = "&showType=" + showType;
            }

            if (typeof type !== 'undefined') {
                appendStr = "&showType=" + type;
            }
            ${id}.src = App.ctx + "/base/fileAttachM/common?moduleKey=${moduleKey}&businessId=" + businessId + appendStr;

            getModelInfo(businessId,moduleKey);
        }

        //3、只读模式
        ${id}_readOnlyAttachment = function () {
            var businessId = $('#${bindFormId}').val();
            var moduleKey = '${moduleKey}';
            ${id}.src = App.ctx + "/base/fileAttachM/common?moduleKey=${moduleKey}&businessId=" + businessId + "&showType=2";
            getModelInfo(businessId,moduleKey);
        }

        $("#showBtn1").bind("click", function () { 
	        var businessId = $('#${bindFormId}').val();
            showWorkFlow(businessId,  '${moduleKey}');
        });
    });

</script>

<script id="modelInfoList" type="text/html">
    {{each list as value i}}
    <li class="m-event">
        <div class="m-eImg"></div>
        <dl class="m-eTime">
            <dd>{{value.createTime}}</dd>
        </dl>
        <div class="m-ePanel">
            <span class="u-ePTitle">{{value.actType}}</span>
            <div class="m-ePContent">
                <div class="m-ePCHead">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <span class="m-ePCHName">{{value.userName}}</span>
                            -
                            <span class="m-ePCHTask">{{value.actName}}</span>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <span class="m-ePCHTime">
                            停留时间：{{value.costTime}}
                            </span>
                        </div>
                    </div>
                </div>
                <div class="m-ePCBody">
                    <p class="m-ePCBInfo">
                        {{if value.resourceId != null&&value.resourceId != ''}}
                        <img src="${pageContext.request.contextPath}${fns:getAdminPath()}/base/fileResource/viewResource?id={{value.resourceId}}" alt="签章">
                        {{/if}}
                        {{value.remark}}
                    </p>
                </div>
            </div>
        </div>
    </li>
    {{/each}}
</script>

<div class="button-area">
    <div class="pull-left">
        <sys:button id="${id}Btn" type="attachment" name="附件"/>
    </div>
</div>
<div class="attachment-area">
    <iframe id="${id}" name="attachmentName" frameborder="no" border="0" marginwidth="0" marginheight="0" allowtransparency="yes"></iframe>
</div>

<div class="m-buttonArea" style="display: none">
    <div class="row">
        <div class="m-bABtn">
            <sys:button id="showBtn1" type="see1" name="查看流程"/>
        </div>
    </div>
</div>

<div class="m-processArea" style="display: none">
    <a data-toggle="collapse" href="#collapseSix" style="display: block;margin: 0;text-align: center;color: #428bca;font-weight: bold;padding-top: 11px;border-bottom: 1px solid rgb(222, 222, 222);padding-bottom: 10px;">当前审批</a>
    <div class="m-processContent collapse in" id="collapseSix">
        <div class="m-pCHead">
            <ul class="m-pCHUl">
                <li>
                    <dl>
                        <dt>流程名称：</dt>
                        <dd class="actModuleName"></dd>
                    </dl>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>单据编号：</dt>
                        <dd class="actFormNo"></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>单据名称：</dt>
                        <dd class="actFormName"></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <div class="m-pCBody">
            <ul id="nowExamine" class="m-timeLine">

            </ul>
        </div>
    </div>
    <div class="m-showAndHide">
        <a data-toggle="collapse" href="#collapseSix"></a>
    </div>
</div>

<div class="m-historyArea" style="display: none">
    <a data-toggle="collapse" href="#collapseSeven" style="display: block;margin: 0;text-align: center;color: #428bca;font-weight: bold;padding-top: 11px;border-bottom: 1px solid rgb(222, 222, 222);padding-bottom: 10px;">审批历史</a>
    <div class="m-historyContent collapse in" id="collapseSeven">
        <div class="m-pCHead">
            <ul class="m-pCHUl">
                <li>
                    <dl>
                        <dt>流程名称：</dt>
                        <dd class="actModuleName"></dd>
                    </dl>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>单据编号：</dt>
                        <dd class="actFormNo"></dd>
                    </dl>
                </li>
                <li>
                    <dl>
                        <dt>单据名称：</dt>
                        <dd class="actFormName"></dd>
                    </dl>
                </li>
            </ul>
        </div>
        <div class="m-pCBody">
            <ul id="historyExamine" class="m-timeLine">

            </ul>
        </div>
    </div>
    <div class="m-showAndHide">
        <a data-toggle="collapse" href="#collapseSeven"></a>
    </div>
</div>