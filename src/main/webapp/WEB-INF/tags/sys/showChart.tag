<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="Id" %>
<%@ attribute name="moduleVO" type="java.lang.String" required="true" description="moduleVO" %>
<%@ attribute name="moduleKey" type="java.lang.String" required="true" description="模块KEY" %>
<%--<div>--%>
    <%--<button id = "researchRightSide" type="button" onclick="researchRightSide()">刷新右侧数据</button>--%>
<%--</div>--%>
            <%--关于查询参数变动   目前为所有图表全部刷新，后期可定位到对应图表，重新setoption（）进行刷新--%>
    <div class="detail-area gridster" id="gridster">
    </div>
    <div class="controlBtn-area">
        <i class="fa fa-angle-double-right"></i>
    </div>
<script>
    //模块标识
    var moduleKey = '${moduleKey}';
    //单据VO对象
    var moduleVO = JSON.parse('${moduleVO}');
    //预览标识
    var previewFlag = moduleVO.previewFlag;
    //绑定改变事件的标识
    //只添加一次gridster块
    var addGridsterFlag = true;
    var gridster;
    var tableData = [];
    var formObj = {};
    var paramArr = [];
    //弹出方法时使用的sql集合
    var sqlArr = [];
$(function () {
    gridster = $(".gridster").gridster({ //通过jquery选择DOM实现gridster
        widget_base_dimensions: [400, 250], //模块的宽高 [宽,高]
        widget_margins: [10, 10], //模块的间距 [上下,左右]
        max_cols: 1,
        max_size_x: 1
    }).data('gridster');
    gridster.disable( );//禁止拖动
    //加载单据页面完成后加载右侧栏展示信息
    showModule();
    setTimeout(function(){
        setInterval(function () {
            var formData = FormUtils.convertSimpleForm2ObjectBySelector('#inputForm');
            var changeFlag = false;
            paramArr.forEach(function (item) {
                var formDataItem = formData[item]||'';
                var moduleVOItem = moduleVO[item]||'';
                if(formDataItem!==moduleVOItem){
                    changeFlag = true;
                }
            })
            if(changeFlag){
               moduleVO = formData;
               researchRightSide();
            }
        },5000)
    },2000)
    //若不使用定时器比较，则表单发生改变事件的时候刷新
    //隐藏域的改变 目前未能触发改事件  可对部分控件的值改变事件 添加  $('#inputForm').trigger('change');//触发该事件的刷新
//    $('#inputForm').change(function () {
//
//    })
    //预览的时候需要将页面的按钮禁用
    if(previewFlag!=undefined && previewFlag =='1'){
        if($(".button-area").length!=0){
            $(".button-area :button").attr("disabled",true);
        }
    }
})
    /***
     * 1、初始化图表的个数div块。2、为每个div块赋值初始化
     */
function showModule() {
    //维护该数组 点击图表 弹出放大时使用
    sqlArr.length = 0;
    //开始初始化右侧栏信息
    $.ajax({
        type: "post",
        url: App.ctx + "/cio/moduleBusinessMst/getOption.json",//由moduleKey获取右侧栏配置信息主子表信息
        dataType: 'json',
        async:false,
        data: {
            moduleKey: moduleKey, //该表单
            previewFlag: previewFlag //是否为预览
        },
        success: function (result) {
            if (result.success) {
                //obj为模版子表的个数===》图表的个数
                var arr = result.obj;
                var length = arr.length;
                for(var i = 0;i<length;i++){
                    var objDtl = arr[i];
                    //为每一个图表新增一个渲染区域，并进行初始化
                    var divOption = JSON.parse(objDtl.divOption);
                    var id=objDtl.id;
                    if(objDtl.chartType=="tab"){
                        gridster.add_widget('<div class="table-area jqGrid-table jqGrid-child-table remove" id="'+id+'" data-id="'+id+'" chart-type="'+objDtl.chartType+'"><table id="tab'+id+'"></table></div>', divOption.dataX, divOption.dataY, divOption.col, divOption.row);
                    }else{
                        gridster.add_widget('<div class="remove" id="'+id+'" data-id="'+id+'" chart-type="'+objDtl.chartType+'"></div>', divOption.dataX, divOption.dataY, divOption.col, divOption.row);
                    }
                    //为该图表渲染数据
                    dealWithSqlAndRender(objDtl);
                }
                addGridsterFlag = false;//加载过后，该数据由 true ==>false
            }
        }
    });
}
/***
 * 为每个div块赋值初始化 (1、处理sql,添加查询参数 2、后台请求数据 3、根据数据渲染图表)
 * @todo 请求一次，将请求与返回数据做成只请求一次  性能提升（）
 */
function dealWithSqlAndRender(objDtl) {
    if(objDtl.chartType=='line'|| objDtl.chartType=='pie'||objDtl.chartType=='bar'){
        $("#"+objDtl.id).click(function(){
            top.layer.open({
                type: 2,
                area: [$(document).width()*0.85+"px", $(document).height()*0.85+"px"],
                title: "查看",
                maxmin: false,
                content: App.ctx + '/cio/moduleBusinessDtl/enlargePage?id='+objDtl.id,
                btn: ['关闭'],
                yes:function (index, layero) {
                    top.layer.close(index);
                },
                btn2: function(index, layero){

                },
                cancel: function(index) {

                }
            });
        });
    }
    //该图表的查询参数
    var queryParamStrArr = [];
    if(objDtl.queryParam!=""){
        queryParamStrArr = objDtl.queryParam.split("/");
    }
    var queryParamObjArr = new Array();
    for(var i = 0;i<queryParamStrArr.length;i++){
        queryParamObjArr.push(eval("("+queryParamStrArr[i]+")"));
    }
    //selece a from a where a.title like @title  And a.form_no = @formNo
    var sql = objDtl.sql;
    //需要处理sql，将参数内容放到sql中
    queryParamObjArr.forEach(function (item) {
        //item的字段 用@ 替换//"title"
        var filedNameVal = camelCase(item.filedNameVal);
        //值 $('#titel').val();
        var fieldNameValForm = $('#'+filedNameVal).val();
        if(fieldNameValForm == undefined){
            //若不是表单中的，则默认在VO中
            fieldNameValForm = moduleVO[filedNameVal]||"";
        }
        else{
            //维护查询参数的数组，只要添加一次
            if(addGridsterFlag){
                if(paramArr.length!=0){
                    var addFlag = true;
                    paramArr.forEach(function (item) {
                        if(item==filedNameVal){
                            addFlag = false;
                        }
                    })
                    if(addFlag){
                        paramArr.push(filedNameVal);
                    }
                }else{
                    paramArr.push(filedNameVal);
                }
            }
        }
        //selece a from a where a.title like '%@title%'  And a.form_no = @formNo
        var queryParamName = item.itemName;
        sql = sql.replace(""+queryParamName,""+fieldNameValForm);
    })
    //维护sqlArr //弹出放大时取用，刷新时先清空，再添加
    var sqlToUse = {
        id : objDtl.id,
        sql : sql,
        objDtl : objDtl
    };
    sqlArr.push(sqlToUse);
    //该图表的 属性配置
    var option = objDtl.chartOption;
    var optionObject = {};
    if(option!=undefined&&option!=null&&option!=''){
        optionObject = JSON.parse(option);
    }
    //执行该图表的sql返回 map<String , Object>集合的值
    $.ajax({
        type: "post",
        url: App.ctx + "/cio/moduleBusinessDtl/executeSql4Form.json",
        dataType: 'json',
        async:false,
        data: {
            sql: sql,
            chartType:objDtl.chartType
        },
        success: function (result) {
            if (result.success) {
                //为表格
                if(objDtl.chartType=="tab"){
                    var colModel = optionObject.colModel;
                    if(colModel!=undefined &&colModel.length>0){
                        var colModelNew = [];
                        colModel.forEach(function (itemJson) {
                            var item = JSON.parse(itemJson);
                            //若为字符串
                            if(item.headType == '0'){
                                var obj = {
                                    name:item.headTitle,
                                    label:item.headTitle
                                };
                                colModelNew.push(obj);
                            }
                            //若为日期
                            else if(item.headType == '1'){
                                var obj = {
                                    name:item.headTitle,
                                    label:item.headTitle,
                                    formatter: function(value,row,index){
                                        if(value!=undefined&&value!= null){
                                            var date = new Date(value.time);
                                            return date.getFullYear()+'-'+date.getMonth()+'-'+date.getDate();
                                        }else{
                                            return '';
                                        }
                                    }
                                };
                                colModelNew.push(obj);
                            }
                            //若为数值
                            else if(item.headType == '2'){
                                var obj = {
                                    name:item.headTitle,
                                    label:item.headTitle,
                                    align: 'right',
                                    formatoptions: {thousandsSeparator: ",", decimalPlaces: 2},
                                    formatter: 'number'
                                };
                                colModelNew.push(obj);
                            }else{
                                console.log("这里出问题了。")
                            }
                        })
                        optionObject.colModel = colModelNew;
                    }
                    if(result.obj!=undefined && result.obj!=null&& result.obj!=''){
                        tableData = JSON.parse(result.obj);
                    }
                    else{
                        tableData.length = 0;
                    }
                }
                //折线图 或者条形图
                else if(objDtl.chartType=="line"||objDtl.chartType=="bar"){
                    if(result.body!=undefined && result.body!=null){
                        if(result.body.dataJson!=undefined && result.body.dataJson!=null){
                            //加载数据
                            optionObject.series[0].data= JSON.parse(result.body.dataJson);
                        }else{
                            optionObject.series[0].data = {};
                        }
                        if(result.body.xDataJson!=undefined && result.body.xDataJson!=null){
                            //加载X轴数据 本想控制控制在只显示几个点的。。。数学不好，随意写。
                            //8个以内全部显示
                            //8至20，刻度为3（若为12条数据，则显示4条）20-30刻度为5，30以上刻度为9
                            var xDataArr = JSON.parse(result.body.xDataJson);
                            optionObject.xAxis[0].data = xDataArr ;
                            if(xDataArr.length>8&&xDataArr.length<20){
                                optionObject.xAxis[0].axisLabel.interval = 3;
                            }
                            if(xDataArr.length>20&&xDataArr.length<30){
                                optionObject.xAxis[0].axisLabel.interval = 5;
                            }
                            if(xDataArr.length>30){
                                optionObject.xAxis[0].axisLabel.interval = 9;
                            }
                        }else{
                            optionObject.xAxis[0].data = {};
                        }
                    }
                }
                //饼图
                else if(objDtl.chartType=="pie"){
                    //将数据放入option中
                    if(result.obj!=undefined && result.obj!=null&& result.obj!=''){
                        optionObject.series[0].data = JSON.parse(result.obj);
                    }else{
                        optionObject.series[0].data = {};
                    }
                }
                //表单
                else if(objDtl.chartType=="form"){
                    //返回数据的对象  一条数据,很多列。
                    if(result.obj!=undefined && result.obj!=null&& result.obj!=''){
                        formObj = JSON.parse(result.obj);
                    }else{
                        formObj = {};
                    }
                }else{
                    console.log("这里找不到图表类型了")
                }
            }//处理请求失败
            else{
                console.log("处理请求失败了");
            }
        }
    });
    // 初始化echarts实例
    var id=objDtl.id;
    //若为表格，则数据一行一行添加
    if(objDtl.chartType=="tab"){
        $("#tab"+id).jqGrid(optionObject);
        for (var i = 0; i <= tableData.length; i++) {
            $("#tab"+id).jqGrid('addRowData', i + 1, tableData[i]);
        }
        tableData=[];
    }
    //若为表单，则数据一行一行添加
    else if(objDtl.chartType=="form"){
        var ele = '<div class = "formInfo-tableArea"><div class = "formInfo-tableHeader"><h2>'+objDtl.chartTitle+'</h2></div><ul class = "formInfo-table">';
        var endEle = '</ul></div>';
        for( var attr in formObj){
            var attrValue = formObj[attr];
            if(attrValue!=null){
                //对象为Object 应该是日期 - _ -!
                if(attrValue.constructor== Object){
                    var date = new Date(attrValue.time)
                    attrValue = formatDate(date);
                }
                //如果为数值
                if(attrValue.constructor== Number){
                    attrValue = attrValue.toFixed(2).toLocaleString();
                    ele+=
                        '<li>'
                        +'<div class = "formInfo-name">'+ attr+'</div>' + '<div class = "formInfo-value">'+ attrValue+'</div>'
                        + '</li>'
                    continue;
                }
            }
            ele+=
               '<li>'
                     +'<div class = "formInfo-name">'+ attr+'</div>' + '<div class = "formInfo-value">'+ attrValue+'</div>'
                + '</li>'
        }
        ele+=endEle;
        $("#"+id).html('').append(ele);
    }else{
        var myChart = echarts.init(document.getElementById(id));
        myChart.setOption(optionObject);
    }
}

/****
 * 重新加载
 */
function researchRightSide() {
    //删除全部存在的
    gridster.remove_all_widgets();
    //删除某个块
    //gridster.remove_widget( $('.gridster li').eq(0) ); //删除第4块,0开始算起
    //重新加载
    setTimeout(function () {
        showModule();
    },800)
}
/***
 * 1、当一个参数发生改变，识别出该参数 所影响的一个或多个图表
 * 2、对这些图表进行刷新
 * @param changeOne
 */
//function changeCharts(changeOne) {
//    sqlArr.forEach(function (sqlArrItem) {
//        var item =sqlArrItem.objDtl;
//        var queryParamStrArr = [];
//        if(item.queryParam!=""){
//            queryParamStrArr = item.queryParam.split("/");
//        }
//        var queryParamObjArr = new Array();
//        for(var i = 0;i<queryParamStrArr.length;i++){
//            queryParamObjArr.push(eval("("+queryParamStrArr[i]+")"));
//        }
//        queryParamObjArr.forEach(function (item2) {
//            var filedNameVal = camelCase(item2.filedNameVal);
//            if(changeOne = filedNameVal){
//                dealWithSqlAndRender(item);
//            }
//        })
//    })
//}
</script>

<script src="${ctxStatic}/js/application/echarts-2.2.7/build/dist/echarts-all.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/home/js/jquery-gridster/css/jquery.gridster.min.css">
<script src="${ctxStatic}/home/js/jquery-gridster/js/jquery.gridster.js" type="text/javascript"></script>