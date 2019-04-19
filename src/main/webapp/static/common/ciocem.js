/*!
 * Copyright &copy; 2015-2020 <a href="http://www.ciocem.com">ciocem</a> All rights reserved.
 * 
 * 通用公共方法
 * @author ciocem
 * @version 2014-4-29
 */
$(document).ready(function() {
    try {
        // 链接去掉虚框
        $("a").bind("focus", function() {
            if (this.blur) { this.blur() }
        });
        $("select").each(function(i) {
            var $this = $(this);
            if (!$this.hasClass("custom-select")) {
                $this.select2();
            }
        });

    } catch (e) {

    }
});



// 引入js和css文件
function include(id, path, file) {
    if (document.getElementById(id) == null) {
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++) {
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i == 0 ? " id=" + id : "") + attr + link + "></" + tag + ">");
        }
    }
}

// 获取URL地址参数
function getQueryString(name, url) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    if (!url || url == "") {
        url = window.location.search;
    } else {
        url = url.substring(url.indexOf("?"));
    }
    r = url.substr(1).match(reg)
    if (r != null) return unescape(r[2]);
    return null;
}

//获取字典标签
function getDictLabel(data, value, defaultValue) {
    if (value == 0 && (value + "").length == 1) {
        value = '0';
    }
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        if (row.value == value) {
            return row.text;
        }
    }
    return defaultValue;
}

//获取字典数值
function getDictValue(data, label, defaultLabel) {

    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        if (row.text == label) {
            return row.value;
        }
    }
    return defaultLabel;
}

//日期类型 yyyy-mm-dd hh:mm:ss转换为 yyyy-mm-dd
function getDateStr(dateTime) {
    if (dateTime == null) {
        return '';
    } else if (dateTime.length >= 10) {
        return dateTime.substr(0, 10);
    }
    return dateTime;
}
//日期类型 yyyy-mm-dd hh:mm:ss转换为 yyyy-mm-dd hh:mm  获取到分钟
function getDateStrToMinute(dateTime) {
    if (dateTime == null) {
        return '';
    } else if (dateTime.length >= 16) {
        return dateTime.substr(0, 16);
    }
    return dateTime;
}


// 打开一个窗体
function windowOpen(url, name, width, height) {
    var top = parseInt((window.screen.height - height) / 2, 10),
        left = parseInt((window.screen.width - width) / 2, 10),
        options = "location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes," +
        "resizable=yes,scrollbars=yes," + "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left;
    window.open(url, name, options);
}

// cookie操作
function cookie(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}

// 数值前补零
function pad(num, n) {
    var len = num.toString().length;
    while (len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

// 转换为日期
function strToDate(date) {
    return new Date(date.replace(/-/g, "/"));
}

// 日期加减
function addDate(date, dadd) {
    date = date.valueOf();
    date = date + dadd * 24 * 60 * 60 * 1000;
    return new Date(date);
}

//截取字符串，区别汉字和英文
function abbr(name, maxLength) {
    if (!maxLength) {
        maxLength = 20;
    }
    if (name == null || name.length < 1) {
        return "";
    }
    var w = 0; //字符串长度，一个汉字长度为2   
    var s = 0; //汉字个数   
    var p = false; //判断字符串当前循环的前一个字符是否为汉字   
    var b = false; //判断字符串当前循环的字符是否为汉字   
    var nameSub;
    for (var i = 0; i < name.length; i++) {
        if (i > 1 && b == false) {
            p = false;
        }
        if (i > 1 && b == true) {
            p = true;
        }
        var c = name.charCodeAt(i);
        //单字节加1   
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            w++;
            b = false;
        } else {
            w += 2;
            s++;
            b = true;
        }
        if (w > maxLength && i <= name.length - 1) {
            if (b == true && p == true) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            if (b == false && p == false) {
                nameSub = name.substring(0, i - 3) + "...";
            }
            if (b == true && p == false) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            if (p == true) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            break;
        }
    }
    if (w <= maxLength) {
        return name;
    }
    return nameSub;
}


//打开对话框(添加修改)
function openDialog(title, url, width, height, target) {

    if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) { //如果是移动端，就使用自适应大小弹窗
        width = 'auto';
        height = 'auto';
    } else { //如果是PC端，根据用户设置的width和height显示。

    }
    top.layer.open({
        type: 2,
        area: [width, height],
        title: title,
        maxmin: false, //开启最大化最小化按钮
        content: url,
        btn: ['确定', '关闭'],
        yes: function(index, layero) {
            var body = top.layer.getChildFrame('body', index);
            var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
            var inputForm = body.find('#inputForm');
            var top_iframe;
            if (target) {
                top_iframe = target; //如果指定了iframe，则在改frame中跳转
            } else {
                top_iframe = top.getActiveTab().attr("name"); //获取当前active的tab的iframe 
            }
            inputForm.attr("target", top_iframe); //表单提交成功后，从服务器返回的url在当前tab中展示

            if (iframeWin.contentWindow.doSubmit()) {
                // top.layer.close(index);//关闭对话框。
                setTimeout(function() { top.layer.close(index) }, 100); //延时0.1秒，对应360 7.1版本bug
            }

        },
        cancel: function(index) {}
    });

}


//查看工作流引擎
function viewWorkFlow(modelInfo) {
    var processDefinitionId = modelInfo.processDefinitionId;
    var processInstanceId = modelInfo.processInstanceId;
    top.layer.open({
        type: 2,
        area: ["800px", "600px"],
        title: "查看流程",
        maxmin: false,
        content: App.ctx + '/activiti/run/showProcess?processDefinitionId=' + processDefinitionId + '&processInstanceId=' + processInstanceId,
        btn: ['关闭'],
        cancel: function(index) {

        }
    });
}

//查看流程
function showWorkFlow(businessId, moduleKey) {
    $.ajax({
        url: App.ctx + "/activiti/actCioRel/getActCioModuleInfoVO.json",
        data: {
            moduleKey: moduleKey, //业务模块KEY 具体在ModuleConstant常量类
            businessId: businessId //单据ID
        },
        dataType: 'json',
        success: function(result) {
            if (result.success) {
                viewWorkFlow(result.body.modelInfo);
            } else {
                MsgUtil.error(result.msg);
            }
        }
    });
}

//送审工作流引擎
function sendWorkFlow(businessId, moduleKey, callback) {
    top.layer.open({
        type: 2,
        area: ['950px', '600px'],
        title: '流程选择',
        maxmin: false,
        resize: false,
        content: App.ctx + "/activiti/actCioRel/sendExamineForm?businessId=" + businessId + "&moduleKey=" + moduleKey,
        cancel: function(index, layero) {
            if (callback && typeof callback === 'function') {
                var iframeWin = layero.find('iframe')[0].contentWindow;
                if (iframeWin.approvalStatus) {
                    callback();
                    refreshHome(); //刷新首页
                    MsgUtil.success("单据已送审！");
                }

            }
        }
    });
}

//打开对话框(查看)
function openDialogView(title, url, width, height) {
    if (navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)) { //如果是移动端，就使用自适应大小弹窗
        width = 'auto';
        height = 'auto';
    } else { //如果是PC端，根据用户设置的width和height显示。

    }
    top.layer.open({
        type: 2,
        area: [width, height],
        title: title,
        maxmin: true, //开启最大化最小化按钮
        content: url,
        btn: ['关闭'],
        cancel: function(index) {

        }
    });
}


//下拉框赋值  setSelectValue('',2);
function setSelectValue(id, value) {
    var text = $("#" + id + " option[value='" + value + "']").text();
    if (text != null && text != '') {
        $("#" + id + "").val(value);
        $("#select2-" + id + "-container").attr("title", text);
        $("#select2-" + id + "-container").text(text);
    }
}

//清空下拉框值
function cleanSelect2(id) {
    $("#" + id + "").val('');
    $("#select2-" + id + "-container").attr("title", '');
    $("#select2-" + id + "-container").text('');
}

function search() { //查询，页码清零
    $("#pageNo").val(0);
    $("#searchForm").submit();
    return false;
}

function reset() { //重置，页码清零
    $("#pageNo").val(0);
    $("#searchForm div.form-group input").val("");
    $("#searchForm div.form-group select").val("");
    $("#searchForm").submit();
    return false;
}

function sortOrRefresh() { //刷新或者排序，页码不清零
    $("#searchForm").submit();
    return false;
}

function page(n, s) { //翻页
    $("#pageNo").val(n);
    $("#pageSize").val(s);
    $("#searchForm").submit();
    $("span.page-size").text(s);
    return false;
}

//复选框多选取值
function getMutiCheckBoxs(pro) {
    var value = "";
    var checkedLs = $("input[name='" + pro + "']:checked");
    checkedLs.each(function(ind, elm) {
        value += $(elm).val() + ","
    });
    if (value.length > 0) {
        value = value.substring(0, value.length - 1);
    }
    return value;
}

function comVar(variables) { //工作流引擎传参
    var keys = "",
        values = "",
        types = "",
        vars = {};
    if (variables) {
        $.each(variables, function() {
            if (keys != "") {
                keys += ",";
                values += ",";
                types += ",";
            }
            keys += this.key;
            values += this.value;
            types += this.type;
        });
    }
    vars = { keys: keys, values: values, types: types };
    return vars;
}

//计算元素集合的总宽度
function calSumWidth(elements) {
    var width = 0;
    $(elements).each(function() {
        width += $(this).outerWidth(true);
    });
    return width;
}
//滚动到指定选项卡
function scrollToTab(element) {
    var marginLeftVal = calSumWidth($(element).prevAll()),
        marginRightVal = calSumWidth($(element).nextAll());
    // 可视区域非tab宽度
    var tabOuterWidth = calSumWidth($(".content-tabs").children().not(".J_menuTabs"));
    //可视区域tab宽度
    var visibleWidth = $(".content-tabs").outerWidth(true) - tabOuterWidth;
    //实际滚动宽度sys
    var scrollVal = 0;
    if ($(".page-tabs-content").outerWidth() < visibleWidth) {
        scrollVal = 0;
    } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
        if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
            scrollVal = marginLeftVal;
            var tabElement = element;
            while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content").outerWidth() - visibleWidth)) {
                scrollVal -= $(tabElement).prev().outerWidth();
                tabElement = $(tabElement).prev();
            }
        }
    } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
        scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
    }
    $('.page-tabs-content').animate({
        marginLeft: 0 - scrollVal + 'px'
    }, "fast");
}





//data-no作为打开Tab页的唯一标识
function addMenuTabs(dataUrl, menuName, dataNo) {
    top.frames[0].addSubMenuTabs(dataUrl, menuName, dataNo);
}


//data-no作为打开Tab页的唯一标识
function addSubMenuTabs(dataUrl, menuName, dataNo) {
    var childNum, repeatStatus, loading, repeatName, _dataNo;
    var _status = false;
    /*获取打开tab页的数量*/
    //childNum = top.$('.page-tabs-content a').length;
    childNum = $('.page-tabs-content a').length;
    if (childNum >= 20) {
        MsgUtil.warn('请先关闭一些页面再进行后续操作！');
        return false;
    }
    // debugger;
    /*当第三个参数未定义时,表示打开tab页的类型为新增编辑页*/
    if (top !== self && dataNo === undefined) {
        //原来的方法
        // var currentNo = self.frameElement.getAttribute('data-no');
        //现在的方法 2018/12/03/17:09
        var currentNo = '';
        $('.page-tabs-content a').each(function() {
            if ($(this).eq(0).hasClass('active')) {
                currentNo = $(this).attr('data-no');
            }
        });
        _dataNo = currentNo + '_FORM';
        /*判断当前页面是否存在相同dataNo的Tab页*/
        $('.J_mainContent iframe').each(function() {
            if (_dataNo === $(this).data('no')) {
                _status = true;
                $('.page-tabs-content a').each(function() {
                    if ($(this).data('no') === _dataNo) {
                        repeatName = '是否关闭 “' + $(this).text().trim() + '” 并打开新的标签？'
                    }
                })
            }
        });
        if (_status) {
            layer.confirm(repeatName, {}, function(e) {
                //选项卡切换
                $('.J_menuTabs .page-tabs-content').children('a').each(function(item, index) {
                    if (_dataNo === $(this).data('no')) {
                        $(this).addClass('active').html(menuName + '<i class="fa fa-times"></i>').siblings().removeClass('active');
                        scrollToTab(this);
                        repeatStatus = !repeatStatus;
                    }
                });
                //内容区切换
                $('.J_mainContent iframe').each(function() {
                    if (_dataNo === $(this).data('no')) {
                        //选项卡已经存在刷新内容区
                        $(this).attr('src', dataUrl);
                        $(this).show().siblings().hide();
                    }
                });
                layer.close(e);
            }, function() {
                //取消进行的操作

                //添加选项卡对应的iframe
                var strTab = '<iframe class="J_iframe" name="' + dataNo + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-no="' + dataNo + '" seamless>您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。</iframe>';
                $('#content-main .J_iframe').hide().parents('.J_mainContent').append(strTab);
                //显示loading提示
                loading = layer.load();
                setTimeout(function() {
                    layer.close(loading);
                }, 500);
                // 添加选项卡
                var strIframe = '<a href="javascript:;" class="J_menuTab active" data-no="' + dataNo + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
                $('.J_menuTabs .page-tabs-content').children('a').each(function() {
                    if ($(this).hasClass('active')) {
                        //The addition of work navigation was modified in 2018/5/25.
                        //$(strIframe).insertAfter(this); changed to  $(this).parent('.page-tabs-content').append(strIframe);
                        $(this).parent('.page-tabs-content').append(strIframe); //将选项卡插入到最后
                        $(this).removeClass('active'); //移除当前选项卡的Class
                        scrollToTab($('.J_menuTab.active'));
                    }
                });
            });
        } else {
            dataNo = _dataNo;
        }
    }
    if (_status) {
        return false;
    }
    //选项卡切换
    $('.J_menuTabs .page-tabs-content').children('a').each(function(item, index) {
        if (dataNo === $(this).data('no')) {
            $(this).addClass('active').siblings().removeClass('active');
            scrollToTab(this);
            repeatStatus = !repeatStatus;
        }
    });
    //内容区切换
    $('.J_mainContent iframe').each(function() {
        if (dataNo === $(this).data('no')) {
            //选项卡已经存在刷新内容区
            $(this).attr('src', dataUrl);
            $(this).show().siblings().hide();
        }
    });
    if (repeatStatus) {
        return false;
    }
    //添加选项卡对应的iframe
    var strTab = '<iframe class="J_iframe" name="' + dataNo + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-no="' + dataNo + '" seamless>您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。</iframe>';
    $('#content-main .J_iframe').hide().parents('.J_mainContent').append(strTab);
    //显示loading提示
    loading = layer.load();
    setTimeout(function() {
        layer.close(loading);
    }, 500);
    // 添加选项卡
    var strIframe = '<a href="javascript:;" class="J_menuTab active" data-no="' + dataNo + '">' + menuName + ' <i class="fa fa-times"></i></a>';
    $('.J_menuTabs .page-tabs-content').children('a').each(function() {
        if ($(this).hasClass('active')) {
            $(strIframe).insertAfter(this); //插入选项卡
            $(this).removeClass('active'); //移除当前选项卡的Class
            scrollToTab($('.J_menuTab.active'));
        }
    });
}




// function addMenuTabs(dataUrl, menuName, dataNo) {
//     var childNum, repeatStatus, loading, repeatName, _dataNo;
//     var _status = false;
//     /*获取打开tab页的数量*/
//     childNum = top.$('.page-tabs-content a').length;
//     if (childNum >= 15) {
//         MsgUtil.warn('请先关闭一些页面再进行后续操作！');
//         return false;
//     }
//     /*当第三个参数未定义时,表示打开tab页的类型为新增编辑页*/
//     if (top !== self && dataNo === undefined) {
//         var currentNo = self.frameElement.getAttribute('data-no');
//         _dataNo = currentNo + '_FORM';
//         /*判断当前页面是否存在相同dataNo的Tab页*/
//         top.$('.J_mainContent iframe').each(function() {
//             if (_dataNo === $(this).data('no')) {
//                 _status = true;
//                 top.$('.page-tabs-content a').each(function() {
//                     if ($(this).data('no') === _dataNo) {
//                         repeatName = '是否关闭 “' + $(this).text().trim() + '” 并打开新的标签？'
//                     }
//                 })
//             }
//         });
//         if (_status) {
//             top.layer.confirm(repeatName, {}, function(e) {
//                 //选项卡切换
//                 top.$('.J_menuTabs .page-tabs-content').children('a').each(function(item, index) {
//                     if (_dataNo === $(this).data('no')) {
//                         $(this).addClass('active').html(menuName + '<i class="fa fa-times-circle"></i>').siblings().removeClass('active');
//                         scrollToTab(this);
//                         repeatStatus = !repeatStatus;
//                     }
//                 });
//                 //内容区切换
//                 top.$('.J_mainContent iframe').each(function() {
//                     if (_dataNo === $(this).data('no')) {
//                         //选项卡已经存在刷新内容区
//                         $(this).attr('src', dataUrl);
//                         $(this).show().siblings().hide();
//                     }
//                 });
//                 top.layer.close(e);
//             }, function() {
//                 //取消进行的操作
//                 //添加选项卡对应的iframe
//                 var strTab = '<iframe class="J_iframe" name="' + dataNo + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-no="' + dataNo + '" seamless>您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。</iframe>';
//                 top.$('#content-main .J_iframe').hide().parents('.J_mainContent').append(strTab);
//                 //显示loading提示
//                 loading = top.layer.load();
//                 setTimeout(function() {
//                     top.layer.close(loading);
//                 }, 500);
//                 // 添加选项卡
//                 var strIframe = '<a href="javascript:;" class="J_menuTab active" data-no="' + dataNo + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
//                 top.$('.J_menuTabs .page-tabs-content').children('a').each(function() {
//                     if ($(this).hasClass('active')) {
//                         //The addition of work navigation was modified in 2018/5/25.
//                         //$(strIframe).insertAfter(this); changed to  $(this).parent('.page-tabs-content').append(strIframe);
//                         $(this).parent('.page-tabs-content').append(strIframe); //将选项卡插入到最后
//                         $(this).removeClass('active'); //移除当前选项卡的Class
//                         scrollToTab($('.J_menuTab.active'));
//                     }
//                 });
//             });
//         } else {
//             dataNo = _dataNo;
//         }
//     }
//     if (_status) {
//         return false;
//     }
//     //选项卡切换
//     top.$('.J_menuTabs .page-tabs-content').children('a').each(function(item, index) {
//         if (dataNo === $(this).data('no')) {
//             $(this).addClass('active').siblings().removeClass('active');
//             scrollToTab(this);
//             repeatStatus = !repeatStatus;
//         }
//     });
//     //内容区切换
//     top.$('.J_mainContent iframe').each(function() {
//         if (dataNo === $(this).data('no')) {
//             //选项卡已经存在刷新内容区
//             $(this).attr('src', dataUrl);
//             $(this).show().siblings().hide();
//         }
//     });
//     if (repeatStatus) {
//         return false;
//     }
//     //添加选项卡对应的iframe
//     var strTab = '<iframe class="J_iframe" name="' + dataNo + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-no="' + dataNo + '" seamless>您的浏览器不支持嵌入式框架，或者当前配置为不显示嵌入式框架。</iframe>';
//     top.$('#content-main .J_iframe').hide().parents('.J_mainContent').append(strTab);
//     //显示loading提示
//     loading = top.layer.load();
//     setTimeout(function() {
//         top.layer.close(loading);
//     }, 500);
//     // 添加选项卡
//     var strIframe = '<a href="javascript:;" class="J_menuTab active" data-no="' + dataNo + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
//     top.$('.J_menuTabs .page-tabs-content').children('a').each(function() {
//         if ($(this).hasClass('active')) {
//             //The addition of work navigation was modified in 2018/5/25.
//             //$(strIframe).insertAfter(this); changed to  $(this).parent('.page-tabs-content').append(strIframe);
//             $(this).parent('.page-tabs-content').append(strIframe); //将选项卡插入到最后
//             $(this).removeClass('active'); //移除当前选项卡的Class
//             scrollToTab($('.J_menuTab.active'));
//         }
//     });
// }

//数字转化为大写人名币汉字
function convertCurrency(money) {
    //汉字的数字
    var cnNums = new Array('零', '壹', '贰', '叁', '肆', '伍', '陆', '柒', '捌', '玖');
    //基本单位
    var cnIntRadice = new Array('', '拾', '佰', '仟');
    //对应整数部分扩展单位
    var cnIntUnits = new Array('', '万', '亿', '兆');
    //对应小数部分单位
    var cnDecUnits = new Array('角', '分', '毫', '厘');
    //整数金额时后面跟的字符
    var cnInteger = '整';
    //整型完以后的单位
    var cnIntLast = '元';
    //最大处理的数字
    var maxNum = 999999999999999.9999;
    //金额整数部分
    var integerNum;
    //金额小数部分
    var decimalNum;
    //输出的中文金额字符串
    var chineseStr = '';
    //分离金额后用的数组，预定义
    var parts;
    var zeroState = false;
    if (money * 1 < 0) {
        zeroState = true;
        money = Math.abs(money);
    }
    if (money == '') {
        return '';
    }
    money = parseFloat(money);
    if (money >= maxNum) {
        //超出最大处理数字
        return '';
    }
    if (money == 0) {
        chineseStr = cnNums[0] + cnIntLast + cnInteger;
        return chineseStr;
    }
    //转换为字符串
    money = money.toString();
    if (money.indexOf('.') == -1) {
        integerNum = money;
        decimalNum = '';
    } else {
        parts = money.split('.');
        integerNum = parts[0];
        decimalNum = parts[1].substr(0, 4);
    }
    //获取整型部分转换
    if (parseInt(integerNum, 10) > 0) {
        var zeroCount = 0;
        var IntLen = integerNum.length;
        for (var i = 0; i < IntLen; i++) {
            var n = integerNum.substr(i, 1);
            var p = IntLen - i - 1;
            var q = p / 4;
            var m = p % 4;
            if (n == '0') {
                zeroCount++;
            } else {
                if (zeroCount > 0) {
                    chineseStr += cnNums[0];
                }
                //归零
                zeroCount = 0;
                chineseStr += cnNums[parseInt(n)] + cnIntRadice[m];
            }
            if (m == 0 && zeroCount < 4) {
                chineseStr += cnIntUnits[q];
            }
        }
        chineseStr += cnIntLast;
    }
    //小数部分
    if (decimalNum != '') {
        var decLen = decimalNum.length;
        for (var i = 0; i < decLen; i++) {
            var n = decimalNum.substr(i, 1);
            if (n != '0') {
                chineseStr += cnNums[Number(n)] + cnDecUnits[i];
            }
        }
    }
    if (chineseStr == '') {
        chineseStr += cnNums[0] + cnIntLast + cnInteger;
    } else if (decimalNum == '') {
        chineseStr += cnInteger;
    }
    if (zeroState) {
        return ('负' + chineseStr);
    }
    return chineseStr;
}

//信息弹出层
var MsgUtil = {
    //警告提示框
    warn: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 0 })
    },
    //成功提示框
    success: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 1 })
    },
    //错误提示框
    error: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 2 })
    },
    //问号提示框
    doubt: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 3 })
    },
    //锁提示框
    lock: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 4 })
    },
    //苦脸提示框
    unhappy: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 5 })
    },
    //笑脸提示框
    happy: function(msg) {
        return layer.msg(msg, { time: 2000, icon: 6 })
    },
    msg: function(msg, icon, endcallback) {
        return layer.msg(msg, { time: 2000, icon: icon }, endcallback);
    }
}


function clickMuch() {
    var nowTime = new Date().getTime();
    var clickTime = $(this).attr("ctime");
    if (clickTime != 'undefined' && (nowTime - clickTime < 3000)) {
        return true;
    } else {
        $(this).attr("ctime", nowTime);
        return false;
    }
}
//调用
function clickInterval(action) {
    if (clickMuch()) {
        MsgUtil.unhappy('操作过于频繁！');
    } else {
        action(); //正常点击所执行的操作
    }
}

//////查询条件部分隐藏
$(document).ready(function() {
    $('#arrow').click(function() {
        var $this = $(this);
        if ($this.hasClass("animate")) { //点击箭头旋转180度
            $this.removeClass("animate").addClass("animate-one");
            $('.otherconditions').slideUp(200);
        } else {
            $this.removeClass("animate-one").addClass("animate"); //再次点击箭头回来
            $('.otherconditions').slideDown(200);
        }
    });
});


//要求对应的页面需要实现search()方法
function refreshTable() {
    if (self !== top && self.frameElement) {
        var currentName = self.frameElement.getAttribute('name');
        if(currentName!=null&&currentName.length>=5){
            var t = currentName.slice(-currentName.length, -5);
            var homeWindow = null;
            if (parent !== top) {
                homeWindow = parent;
            } else {
                homeWindow = top.frames["j-iframe"].contentWindow;
            }
            if (homeWindow.frames[t] && typeof homeWindow.frames[t].search === 'function') {
                homeWindow.frames[t].search();
            }
        }
    }
    //刷新附件
    refreshAttachment($("#id").val());
}


//刷新附件
function refreshAttachment(id) {
    var attachArr = [];
    attachArr = $("iframe[name='attachmentName']");
    for (var i = 0; i < attachArr.length; i++) {
        var oldUrl = $("iframe[name='attachmentName']")[i].src;
        var len = oldUrl.indexOf("&businessId");
        var newUrl = oldUrl.substring(0, len) + "&businessId=" + id;
        $("iframe[name='attachmentName']")[i].src = newUrl;
    }
}

// 显示/隐藏附件流程送审
function toggleExamineArea(flag) {
    if(flag){
        $(".m-buttonArea").show();
        $(".m-processArea").show();
        $(".m-historyArea").show();
    }else {
        $(".m-buttonArea").hide();
        $(".m-processArea").hide();
        $(".m-historyArea").hide();
    }
}

// 查询送审流程信息
function getModelInfo(businessId, moduleKey) {
    // id为空，说明是新增，还没有保存，没有流程审批
    if(businessId!=null&&businessId!=''){
        $.ajax({
            url: App.ctx + "/activiti/actCioRel/getActCioModuleInfoVO.json",
            data: {
                moduleKey: moduleKey, //业务模块KEY 具体在ModuleConstant常量类
                businessId: businessId //单据ID
            },
            dataType: 'json',
            success: function(result) {
                // 如果有送审流程信息，则查询审批
                if (result.success) {
                    toggleExamineArea(true)
                    var modelInfo = result.body.modelInfo;
                    var processDefinitionId = modelInfo.processDefinitionId;
                    var processInstanceId = modelInfo.processInstanceId;
                    showModelInfo(processDefinitionId,processInstanceId);
                    getModelInfoList(processInstanceId);
                    getModelInfoHistoryList(processInstanceId);
                } else {
                    toggleExamineArea(false)
                }
            }
        });
    }else{
        toggleExamineArea(false)
    }
}

// 显示流程名称，单据编号，单据名称，以及processInstanceId
function showModelInfo(processDefinitionId,processInstanceId) {
    if(processDefinitionId!=null&&processDefinitionId!=""){
        $.ajax({
            //url: "http://localhost:8088/ciocem/a/activiti/actCioRel/getActCioModuleInfoVOByPId.json?processInstanceId="+processInstanceId,
            url: top.App.ctx+"/activiti/actCioRel/getActCioModuleInfoVOByPId.json?processInstanceId="+processInstanceId,
            type: 'POST',
            dataType: 'json',
            cache: false,
            async: false
        }).done(function(data) {
            var formNo = "";
            var formName="";
            var modelName="";
            if(data!=null&&data.obj!=null){
                formNo = data.obj.formNo;
                modelName = data.obj.modelName;
                if(data.obj!=null&&data.obj.formName!=null){
                    formName = data.obj.formName;
                }else{
                    formName = '无';
                }
                $(".actModuleName").text(modelName);
                $(".actFormNo").text(formNo);
                $(".actFormName").text(formName);
            }
        }).fail(function(jqXHR, textStatus){
            //console.error('Get diagram layout['+processDefinitionKey+'] failure: ', textStatus, jqXHR);
        });
    }
}

// 当前审批
function getModelInfoList(processInstanceId) {
    $.get(top.App.ctx+'/activiti/history/getCommentTableData.json?runFlag=1&processInstanceId='+processInstanceId,function(res) {
        var strHtml = '';
        var rowData = {
            list: []
        };
        if(res.rows!=null&&res.rows.length!=0){
            $.each(res.rows, function(i){
                rowData.list.push(res.rows[i]);
            });
            strHtml = template('modelInfoList',rowData);
        }else{
            strHtml = '<em style="display:block;padding: 2px 15px">暂无审批信息</em>';
        }
        $('#nowExamine').html(strHtml);
    });
}

// 审批历史
function getModelInfoHistoryList(processInstanceId) {
    $.get(top.App.ctx+'/activiti/history/getCommentTableData.json?processInstanceId='+processInstanceId,function(res) {
        var strHtml = '';
        var rowData = {
            list: []
        };
        if(res.rows!=null&&res.rows.length!=0){
            $.each(res.rows, function(i){
                rowData.list.push(res.rows[i]);
            });
            strHtml = template('modelInfoList',rowData);
        }else{
            strHtml = '<em style="display:block;padding: 2px 15px">暂无审批信息</em>';
        }
        $('#historyExamine').html(strHtml);
    });
}


function readOnlyAttachment(id) {
    window[id + "_readOnlyAttachment"]();
}
////////////////////////////JqGrid4/////////////////////////////////////
//获取参数
var jsonReader = {
    "id": "id",
    root: "rows",
    rows: "pageSize",
    total: "totalPage",
    page: "pageIndex",
    records: "total"
};

//请求参数
var prmNames = {
    page: "pageIndex",
    rows: "pageSize",
    sort: "sortOrder",
    order: "orderBy"
};

//前端分页专用
var rowList = [10, 100, 1000];

//设置行高
function setRowHeightFunc(tableId) {
    var grid = $(tableId);
    var ids = grid.getDataIDs();
    for (var i = 0; i < ids.length; i++) {
        grid.setRowData(ids[i], false, { height: 30 });
    }
}
//设置行高
function setRowHeightFunc(tableId, height) {
    var grid = $(tableId);
    var ids = grid.getDataIDs();
    for (var i = 0; i < ids.length; i++) {
        grid.setRowData(ids[i], false, { height: height });
    }
}
//初始化jqGrid
function initJqGrid(tableId, data) {
    $(tableId).data("raw_data", data.rows);
    setRowHeightFunc(tableId);
}

//加载Grid后事件
function gridCompleteFunc(tableId) {
    //分页栏 输入数字后失去焦点触发查询
    var lastpage = $(tableId).getGridParam('lastpage'); //获取总页数
    $('.ui-pg-input').bind('blur', function() {
        var inputPage = $('#gbox_' + tableId.substring(1) + ' .ui-pg-input').val();
        if (inputPage <= 0 && inputPage > lastpage) {
            return false;
        }
        $(tableId).jqGrid("getGridParam").page = inputPage;
        $(tableId).jqGrid("setGridParam", 'page', inputPage).trigger('reloadGrid');
    });
}

!(function($) {
    $.jgrid.extend({
        getRawData: function(rowid) {
            var ret;
            this.each(function() {
                var $t = this;
                if (!$t.grid) return;
                ret = getRowDataByRowId($($t).data("raw_data"), rowid);
            });
            return ret || {};
        },
        initJqGrid: function(data) {
            var $t = this;
            $t.data("raw_data", data.rows);
            $t.setRowHeightFunc();
            return $t;
        },
        setRowHeightFunc: function() {
            var $t = this,
                ids = this.getDataIDs();
            for (var i = 0; i < ids.length; i++) {
                $t.setRowData(ids[i], false, { height: 30 });
            }
            return $t;
        }
    });
})(jQuery);
//获取当前行原始数据
function getRowDataByRowId(currentDatas, rowId) {
    var rowData = {};
    if (currentDatas != null && currentDatas.length > 0) {
        for (var i = 0; i < currentDatas.length; i++) {
            var obj = currentDatas[i];
            if (obj.id == rowId) {
                rowData = obj;
                break;
            }
        }
    }
    return rowData;
}

//获取表格导出Excel参数
function getExportExcelUrl(tableId) {
    var colModel = $("#" + tableId).jqGrid('getGridParam', 'colModel');
    var headNameStr = '';
    var columnNameStr = '';
    if (colModel.length > 0) {
        for (var i = 0; i < colModel.length; i++) {
            if (colModel[i].hidden) {
                continue;
            }
            if (colModel[i].label == null || colModel[i].label == undefined) {
                continue;
            }
            headNameStr = headNameStr + colModel[i].label + ',';
            columnNameStr = columnNameStr + colModel[i].name + ',';
        }
    }
    var pageIndex = $("#" + tableId).getGridParam('page'); //获取当前页
    var pageSize = $("#" + tableId).getGridParam('rowNum'); //获取每页条数
    return "&headNameStr=" + headNameStr + "&columnNameStr=" + columnNameStr + "&pageIndex=" + pageIndex + "&pageSize=" + pageSize;
}

//打开Excel选择框
function openExcelDialog(url) {
    top.layer.open({
        type: 2,
        area: ["600px", "450px"],
        title: "Excel导入",
        maxmin: false,
        content: App.ctx + '/base/excelTemplate/uploadExcelForm?url=' + url,
        btn: ['关闭'],
        cancel: function(index) {

        }
    });
}


//表格保存行
function saveTableRowDialog(title, tableId, formUrl, saveUrl, width, height, checkUrl) {
    top.layer.open({
        type: 2,
        area: [width, height],
        title: title,
        maxmin: false,
        content: formUrl,
        btn: ['确定', '关闭'],
        yes: function(index, layero) {
            var body = top.layer.getChildFrame('body', index);
            var inputForm = body.find('#inputForm');
            //inputForm.attr("target",top.getActiveTab().attr("name"));
            //表单验证
            var iframeWin = layero.find('iframe')[0].contentWindow;
            var validateStatus = iframeWin.getValidate();
            if (!validateStatus) {
                return false;
            }
            //数据提交
            var formData = FormUtils.convertSimpleForm2ObjectBySelector(inputForm);
            //验证电子签单
            if (typeof checkUrl != 'undefined' && checkUrl != null && checkUrl != '') {
                $.ajax({
                    type: "post",
                    url: checkUrl,
                    dataType: 'json',
                    data: formData,
                    success: function(result) {
                        if (result.success) {
                            MsgUtil.success(result.msg);
                            $.ajax({
                                type: "post",
                                url: saveUrl,
                                dataType: 'json',
                                data: formData,
                                success: function(result) {
                                    if (result.success) {
                                        MsgUtil.success(result.msg);
                                        setTimeout(function() { top.layer.close(index) }, 100);
                                        $("#" + tableId).trigger("reloadGrid");
                                    } else {
                                        MsgUtil.warn(result.msg);
                                    }
                                }
                            });
                        } else {
                            top.layer.alert(result.msg);
                        }
                    }
                });
            } else {
                $.ajax({
                    type: "post",
                    url: saveUrl,
                    dataType: 'json',
                    data: formData,
                    success: function(result) {
                        if (result.success) {
                            MsgUtil.success(result.msg);
                            setTimeout(function() { top.layer.close(index) }, 100);
                            $("#" + tableId).trigger("reloadGrid");
                        } else {
                            MsgUtil.warn(result.msg);
                        }
                    }
                });
            }

        },
        cancel: function(index) {

        }
    });
}
///////////////////////////////////////////////

//比较对象是否相等,用于判断主表数据是否修改
var cmpObject = function(x, y) {
    if (x === y) {
        return true;
    }
    if (!(x instanceof Object) || !(y instanceof Object)) {
        return false;
    }
    if (x.constructor !== y.constructor) {
        return false;
    }
    for (var p in x) {
        if (x.hasOwnProperty(p)) {
            if (!y.hasOwnProperty(p)) {
                return false;
            }
            if (x[p] === y[p]) {
                continue;
            }
            if (typeof(x[p]) !== "object") {
                return false;
            }
            if (!Object.equals(x[p], y[p])) {
                return false;
            }
        }
    }
    for (p in y) {
        if (y.hasOwnProperty(p) && !x.hasOwnProperty(p)) {
            return false;
        }
    }
    return true;
};

//刷新正在打开的Tab页面
function refreshVisibleIframe(e) {
    var $iframeWin = top.$('#content-main iframe:visible');
    if ($iframeWin.length !== 0) {
        if (e !== undefined) {
            preDefault(e);
        }
        var dataUrl = $iframeWin.attr('src');
        /*关闭所有的弹出层*/
        top.layer.closeAll();
        $iframeWin.attr('src', dataUrl);
    }
}


$(document).ready(function() {
    //监听键盘事件，当按下enter键关闭larer弹出层并执行确定操作
    $(document).keydown(function(e) {
        e = e || window.event;
        if (e.which === 13 && $('.layui-layer-btn0', top.window.document).text() === '确定') {
            preDefault(e);
            //调用主页面点击确定按钮
            parent.keyEvent();
        } else if (e.which === 13 && $('.layui-layer-btn0').text() === '确定') {
            preDefault(e);
            //点击当前页面确定按钮
            $('.layui-layer-btn0').trigger('click');
        }
        /*点击F5刷新系统当前显示Tab页*/
        if (e.which == 116) {
            refreshVisibleIframe(e);
        }
    });
    // $(window).on('click', function(e) {
    //     top.$('.head').hide();
    // });
    $('body,html').hover(function(e) {
        e = e || window.event;
        var target = e.target || e.srcElement;
        if (target.className != "item-level-1") {
            top.$(".submenu").hide();
            top.$(".item-level-1").css({
                backgroundColor: ""
            });
            top._clickStatus = false;
        }
    })
});

function preDefault(e) {
    //阻止默认浏览器动作
    if (e && e.preventDefault) {
        e.preventDefault();
    } else {
        window.event.returnValue = false;
    }
}

//已废弃.grid-area,先试用没问题可删除 2017/11/20调整
// $(document).ready(function() {
//     //当页面宽度调整时，自动调整表格宽度
//     $(window).resize(function() {
//         $(window).unbind("onresize");
//         var $container = $('.table-area').not(".hide");
//         if ($container.length > 0) {
//             $(".grid-area").each(function() {
//                 var $this = $(this);
//                 if ($this.parents('.hide').length > 0) return;
//                 var parentWidth = $this.parents('.table-area').width() - 3,
//                     totalLength = $this.parents(".jqGrid-total-table").length;
//                 if (totalLength > 0) {
//                     if ($this.width() < parentWidth)
//                         $this.setGridWidth(parentWidth, false);
//                 } else {
//                     $this.setGridWidth(parentWidth, false);
//                 }
//             });
//         } else {
//             $container = $(".jq_table_container");
//             if ($container.length > 0) {
//                 $(".jq_grid_content").each(function() {
//                     var $this = $(this);
//                     var parentWidth = $this.parents(".jq_table_container").width() - 3,
//                         totalLength = $this.parents(".jqGrid-total-table").length;
//                     if (totalLength > 0) {
//                         if ($this.width() < parentWidth)
//                             $this.setGridWidth(parentWidth, false);
//                     } else {
//                         $this.setGridWidth(parentWidth, false);
//                     }
//                 });
//             }
//         }
//         $(window).bind("onresize", this);
//     });
// });

/*为jquery-validate添加身份证验证规则*/
var isIdCardNo;
(function() {
    var vcity = {
        11: "北京",
        12: "天津",
        13: "河北",
        14: "山西",
        15: "内蒙古",
        21: "辽宁",
        22: "吉林",
        23: "黑龙江",
        31: "上海",
        32: "江苏",
        33: "浙江",
        34: "安徽",
        35: "福建",
        36: "江西",
        37: "山东",
        41: "河南",
        42: "湖北",
        43: "湖南",
        44: "广东",
        45: "广西",
        46: "海南",
        50: "重庆",
        51: "四川",
        52: "贵州",
        53: "云南",
        54: "西藏",
        61: "陕西",
        62: "甘肃",
        63: "青海",
        64: "宁夏",
        65: "新疆",
        71: "台湾",
        81: "香港",
        82: "澳门",
        91: "国外"
    };
    isIdCardNo = function(card) {
        //是否为空
        if (card === '') {
            return false;
        }
        //校验长度，类型
        if (isCardNo(card) === false) {
            return false;
        }
        //检查省份
        if (checkProvince(card) === false) {
            return false;
        }
        //校验生日
        if (checkBirthday(card) === false) {
            return false;
        }
        //检验位的检测
        if (checkParity(card) === false) {
            return false;
        }
        return true;
    };
    //检查号码是否符合规范，包括长度，类型
    isCardNo = function(card) {
        //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
        var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
        if (reg.test(card) === false) {
            return false;
        }
        return true;
    };
    //取身份证前两位,校验省份
    checkProvince = function(card) {
        var province = card.substr(0, 2);
        if (vcity[province] == undefined) {
            return false;
        }
        return true;
    };
    //检查生日是否正确
    checkBirthday = function(card) {
        var len = card.length;
        //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
        if (len == '15') {
            var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
            var arr_data = card.match(re_fifteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date('19' + year + '/' + month + '/' + day);
            return verifyBirthday('19' + year, month, day, birthday);
        }
        //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
        if (len == '18') {
            var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
            var arr_data = card.match(re_eighteen);
            var year = arr_data[2];
            var month = arr_data[3];
            var day = arr_data[4];
            var birthday = new Date(year + '/' + month + '/' + day);
            return verifyBirthday(year, month, day, birthday);
        }
        return false;
    };
    //校验日期
    verifyBirthday = function(year, month, day, birthday) {
        var now = new Date();
        var now_year = now.getFullYear();
        //年月日是否合理
        if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day) {
            //判断年份的范围（3岁到100岁之间)
            var time = now_year - year;
            if (time >= 3 && time <= 100) {
                return true;
            }
            return false;
        }
        return false;
    };
    //校验位的检测
    checkParity = function(card) {
        //15位转18位
        card = changeFivteenToEighteen(card);
        var len = card.length;
        if (len == '18') {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0,
                i, valnum;
            for (i = 0; i < 17; i++) {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            valnum = arrCh[cardTemp % 11];
            if (valnum == card.substr(17, 1)) {
                return true;
            }
            return false;
        }
        return false;
    };
    //15位转18位身份证号
    changeFivteenToEighteen = function(card) {
        if (card.length == '15') {
            var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
            var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
            var cardTemp = 0,
                i;
            card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
            for (i = 0; i < 17; i++) {
                cardTemp += card.substr(i, 1) * arrInt[i];
            }
            card += arrCh[cardTemp % 11];
            return card;
        }
        return card;
    };
})();
$.validator.addMethod("isIdCardNo", function(value, element) {
    return this.optional(element) || isIdCardNo(value);
}, "请正确输入身份证号码");
// 手机号码验证
$.validator.addMethod("isMobile", function(value, element) {
    var length = value.length;
    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
    var status = true;
    return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写手机号码");


$(function() {
    var timoutHandler = null;
    /*查询区控制*/
    weatherAppend();
    $(window).on('resize', function() {
        if (timoutHandler)
            window.clearTimeout(timoutHandler);
        timoutHandler = window.setTimeout(function() {
            // console.log(new Date().getTime());
            $('.search-area').each(function() {
                weatherAppend();
            });
        }, 500);

    });
    /*附件区*/
    $('.attachment').on('click', function() {
        $(this).parents('.button-area').siblings('.attachment-area').fadeToggle(1000);
    });
    /*Tab切换*/
    $("#content > div").hide().eq(0).show();
    $("#tabs li:first a").addClass('current');
    $("#tabs").on("click", 'a', function(e) {
        var $this = $(this);
        if (e && e.preventDefault) {
            e.preventDefault();
        } else {
            window.event.returnValue = false;
        }
        if ($this.hasClass('current')) {
            return false;
        } else {
            if (!$this.hasClass('nocheck')) {
                var current_id = $("#id").val();
                if (current_id === '' && !$('#tabs').hasClass('tabs-able')) {
                    MsgUtil.warn('请先保存基本信息!');
                    return false;
                }
            }
            $this.addClass('current').parents('li').siblings('li').find('a').removeClass('current');
            $("#content > div").hide();
            $($this.attr('name')).fadeIn();

        }
    });

    function weatherAppend(initText) {
        var moreStr = '<div class="arrow-retract"><i class="fa fa-caret-square-o-down"></i><a href="javascript:;">更多</a></div>';
        $('.search-area').each(function() {
            var $searchArea = $(this);
            var div_length = $searchArea.find('form>div').length;
            var form_w = $searchArea.outerWidth() - 12;
            if ($searchArea.length === 0) {
                return false;
            }
            if ($searchArea.hasClass('search_area')) {
                return false;
            }
            var $ctl = $searchArea.find('.arrow-retract');
            if (form_w <= div_length * 326) {
                if ($ctl.length < 1) {
                    $searchArea.append(moreStr);
                    $ctl = $searchArea.find('.arrow-retract');
                    $ctl.data("slideStatus", 1);
                }
            } else {
                $ctl.remove();
            }
            if ($ctl.length > 0) {
                $ctl.unbind("click").on('click', function() {
                    var $this = $(this);
                    var $form = $this.siblings('form');
                    var $a = $this.find('a');
                    /*控制图标旋转*/
                    var _slideStatus = $ctl.data("slideStatus");
                    if (_slideStatus == 1) {
                        $form.css({
                            height: 'auto',
                            paddingBottom: '5px'
                        })
                        $(this).find('i').css({ 'transform': 'rotate(180deg)' });
                    } else {
                        $form.animate({
                            height: '38px'
                        }, 300, function() {
                            $this.find('i').css({ 'transform': 'rotate(0deg)' });
                        });
                    }
                    $a.text() === '更多' ? $a.text('收起') : $a.text('更多');
                    $ctl.data("slideStatus", (_slideStatus == 1 ? 0 : 1));
                });
            }

        });

    }
    /*grid编辑时，若数值为0且带有多位小数，默认清空输入框的值*/
    $('.table-area').on('focus', 'input', function() {
        if (this.value * 1 == 0) {
            this.value = "";
        }
    });
    $(".inp").on("change blur", function() {
        this.title = this.value;
    })
});

/*调用home页刷新方法*/
function refreshHome() {
    //if (typeof top.frames['_HOME'] != 'undefined') {
    //    top.frames['_HOME'].reRender();
    //}
        //新闻模块
    //top.getNewsList(currentType);
        //流程管理
    top.getProcessManage();
    //    //我的消息
    //top.getMsgList();
    //    //未读消息的数目
    //top.getUnreadMsg();
    //    //任务管理
    //top.getMissionSize();
    //    //预警管理
    //top.getWarnMsgList(10);

    var topDate = top.$('#test-n1 .layui-this').attr('lay-ymd');
    var getDatea = topDate.split("-");
    var yeara = getDatea[0];
    var mona = getDatea[1] < 10 ? "0" + getDatea[1] : getDatea[1];
    var daya = getDatea[2] < 10 ? "0" + getDatea[2] : getDatea[2];
    getDatea = yeara + "-" + mona + "-" + daya;
    top.getNoticeList(getDatea); //重新加载首页外出公告
}

/////////// 流程审批-BEGIN //////////////

function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]);
    return null;
}

/** 审批控制单据显示
 * auditFlag 0新增  1编辑  2查看
 */
function formControlForAudit() {
    //表单若存在projectInfoId 新增的时候 默认显示当前项目名称、id
    var span = parent.document.getElementById("info_projectname");
    if (span != null && span != "") {
        if ((showType == "" || showType == "0") && ($("#id").val() == null || $("#id").val() == "")) {
            //不同表单项目Id命名可能不一样
            var projectInfoId = $("#projectInfoId").val();
            var projectId = $("#projectId").val();
            var projectInfoName = span.innerHTML; //项目：CT测试项目 要去除项目：
            projectInfoName = projectInfoName.substring(3, projectInfoName.length);
            var id = parent.document.getElementById("info_projectid").value;
            if (projectInfoId != undefined) {
                //有些地方项目名称 是projectName
                if ($("#projectInfoNameId").val() != undefined) {
                    $("#projectInfoNameId").val(projectInfoName);
                } else {
                    $("#projectNameId").val(projectInfoName);
                }
                $("#projectInfoId").val(id);
            } else if (projectId != undefined) {
                $("#projectNameId").val(projectInfoName);
                $("#projectId").val(id);
            }
        }
    }

    //permission是控制审批页面全部放开可编辑用的 如果等于0全部放开 1的话按照正常控制
    var permission = GetQueryString("permission");
    if (permission != null && permission == '0') {
        return;
    }

    var auditFlag = GetQueryString("auditFlag");
    var auditProStr = GetQueryString("auditProStr");

    if (auditFlag == '0') {
        FormUtils.disableForm("inputForm", false); //所有都允许操作
    } else if (auditFlag == '1') {
        FormUtils.disableFormOnly("inputForm"); //只禁用表单部分（不包含按钮）
        $(".spinner-btn-group").hide(); //数字控件隐藏控制键

        if (auditProStr != null && auditProStr != "") {
            var proArr = auditProStr.split(",");
            for (var i = 0; i < proArr.length; i++) {
                $("#" + proArr[i]).attr("disabled", false);
                $("#" + proArr[i]).siblings(":text").attr("disabled", false);

                //如果是单选按钮则特殊处理
                if ($("input[name='" + proArr[i] + "']").attr("type") == 'radio') {
                    $("input[name='" + proArr[i] + "']").attr("disabled", false)
                }
                //如果是数字控件
                $("input[name='" + proArr[i] + "']").siblings(".spinner-btn-group").show();
            }
        }
    } else if (auditFlag == '2') {
        FormUtils.disableForm("inputForm", true); //所有都禁止
        $(".spinner-btn-group").hide();
    }
}

/////////// 流程审批-END //////////////

//时间提示title
$(function() {
    $('#beginTime').attr('title', $('#beginTime').val());
    $('#endTime').attr('title', $('#endTime').val());
})


//图片未找到
function nofindPic() {
    var img = event.srcElement;
    img.src = top.App.static + '/images/notFind.png';
    img.onerror = null; //控制不要一直跳动
}

//图片预览
function initViewerPlugin() {
    var tableId, minUrl1, maxUrl1, minUrl2, maxUrl2, minUrl, maxUrl,
        ids = [],
        imglist = [],
        loadCompleteNum = 0,
        imgListLen = 0,
        args = Array.prototype.slice.call(arguments),
        nowTime = (new Date()).valueOf(),
        _showType = showType;
    tableId = args[0];
    ids = $("#" + tableId).jqGrid("getGridParam", "selarrrow");
    if (args.length > 4) {
        minUrl1 = args[1];
        maxUrl1 = args[2];
        minUrl2 = args[3];
        maxUrl2 = args[4]
    } else {
        minUrl = args[1];
        maxUrl = args[2]
    }
    $(".img-area").length > 0 ? $(".img-area").html("") : $('<ul class="img-area"></ul>').insertAfter($(".table-area"));
    ids.forEach(function(item) {
        var rowData = $("#" + tableId).jqGrid("getRowData", item),
            splitArr = [],
            imgArr = [];
        if (!!rowData.imageIds) {
            splitArr = rowData.imageIds.split(",");
            imgArr = splitArr.map(function(_item) {
                var _minUrl,
                    _maxUrl,
                    minSrc,
                    maxSrc,
                    removeEle = '<span class="remove-icon" title="删除">';
                if (args.length > 4) {
                    if (_item.indexOf("#0") > 0) {
                        _item = _item.replace("#0", "");
                        _minUrl = minUrl1;
                        _maxUrl = maxUrl1;
                        removeEle = "";
                    } else if (_item.indexOf("#1") > 0) {
                        _item = _item.replace("#1", "");
                        _minUrl = minUrl2;
                        _maxUrl = maxUrl2;
                    }
                } else {
                    _minUrl = minUrl;
                    _maxUrl = maxUrl;
                }
                if (_showType === '2') {
                    removeEle = '';
                }
                minSrc = App.ctx + _minUrl + _item + "&time=" + nowTime;
                maxSrc = App.ctx + _maxUrl + _item + "&time=" + nowTime;
                return '<li class="img-wrapper">' +
                    '<img data-original="' + maxSrc + '" src="' + minSrc + '">' + removeEle +
                    '</li>';
            });
            imglist = imglist.concat(imgArr);
        }
    });
    imgListLen = imglist.length;
    $(".img-area").html(imglist.join(""));
    /*初始化图片预览插件*/
    $('.img-area img').load(function() {
        loadCompleteNum += 1;
        if (loadCompleteNum === imgListLen) {
            $('.img-area').viewer({
                url: "data-original"
            });
            $('.img-area').viewer('update');
        }
    });
    $('.img-area img').error(function() {
        $(this).parent().remove();
        imgListLen = imgListLen - 1;
        if (imgListLen === loadCompleteNum) {
            $('.img-area').viewer({
                url: "data-original"
            });
            $('.img-area').viewer('update');
        }
    });
    /*绑定图片删除事件*/
    if (typeof args[args.length - 1] === 'function') {
        args[args.length - 1]();
    }
}

//ztree 根据当前节点查找对应叶子节点(目前支持4级)
function getZtreeLeafNodeIds(treeNode) {
    if (treeNode == null || treeNode.level == 0) { //第一级由于太多，直接返回空
        return "";
    }
    var ids = "";
    if (treeNode.isParent) {
        var childrenNodes = treeNode.children;
        if (childrenNodes) {
            for (var i = 0; i < childrenNodes.length; i++) {
                if (childrenNodes[i].isParent) {
                    var subChildrenNodes = childrenNodes[i].children;
                    if (subChildrenNodes) {
                        for (var j = 0; j < subChildrenNodes.length; j++) {
                            if (subChildrenNodes[j].isParent) {
                                var sub2ChildrenNodes = subChildrenNodes[j].children;
                                if (sub2ChildrenNodes) {
                                    for (var m = 0; m < sub2ChildrenNodes.length; m++) {
                                        if (sub2ChildrenNodes[m].isParent) {
                                            //todo:
                                        } else {
                                            ids = ids + "," + sub2ChildrenNodes[m].id;
                                        }
                                    }
                                }
                            } else {
                                ids = ids + "," + subChildrenNodes[j].id;
                            }
                        }
                    }
                } else {
                    ids = ids + "," + childrenNodes[i].id;
                }
            }
        }
    } else {
        ids = ids + "," + treeNode.id;
    }
    return ids;
}

//右侧栏详细信息面板控制
$(function() {
    var $_ctbArea = $('.controlBtn-area');
    var $_ctbArea0 = $_ctbArea.eq(0);
    var $_detail = $('.detail-area').eq(0);
    $_ctbArea0.on('click', function() {
        if ($_ctbArea0.children('.fa').hasClass('fa-angle-double-right')) {
            $_ctbArea0.children('.fa').attr('class', 'fa fa-angle-double-left');
            $_detail.hide();
        } else {
            $_ctbArea0.children('.fa').attr('class', 'fa fa-angle-double-right');
            $_detail.show();
        }
    })
});
//驼峰转换
function camelCase(str) {
    var re = /_(\w)/g;
    return str.replace(re, function($0, $1) {
        return $1.toUpperCase();
    });
}

//控制附件在新建与查看状态下的高
function controlHeight() {
    var _iframe = document.getElementById("iframe");
    if (typeof(_iframe.contentDocument.body.children[1]) == 'object' && typeof(_iframe.contentDocument.body.children[1].children[0]) == 'object') {
        if (_iframe.contentDocument.body.children[1].children.length == 1) {
            _iframe.style.height = 236 + 'px';
            _iframe.contentDocument.body.children[1].children[0].style.height = 234 + 'px';
        }
    }
}
window.onload = function() {
    var _attachment = document.querySelector('.attachment');
    if (!_attachment) {
        return;
    }
    _attachment.onclick = function() {
        controlHeight();
    }
};

//实现左右两侧等高效果(令左侧永远等于右侧)
window.onload = function() {
    var search1 = document.querySelector('.search-page1');
    var search2 = document.querySelector('.search-page2');
    if (!search1 && !search2) { return; }
    if (search1) {
        var left1 = document.querySelector('.function-area');
        var right1 = document.querySelector('.show-area');
        if (!left1 || !right1) { return; }
        var oldRight1 = right1.offsetHeight;
        resizeb1();
        changeHeight1();

        function changeHeight1() {
            var newRight1 = right1.offsetHeight;
            if (newRight1 != oldRight1) {
                oldRight1 = newRight1;
                resizeb1();
            }
            setTimeout(changeHeight1, 100);
        }

        function resizeb1() {
            var tree1 = left1.querySelector('.ztree');
            var table1 = left1.querySelector('.ui-jqgrid-bdiv');
            var pager = right1.querySelector('.ui-jqgrid-pager');
            var edit = right1.querySelector('.edit-area');
            var body = document.documentElement.clientHeight || document.body.clientHeight;
            var who1 = (tree1 == null) ? 0 : 1;
            var who2 = (table1 == null) ? 0 : 1;
            var who3 = (pager == null) ? 0 : 1;
            var who5 = right1.offsetHeight <= (body - 36) ? 1 : 0;
            //right.style.height可用来获取或者设置相应对象的高度。值是带有px单位的字符串类型。
            //left.offsetHeight可以获得对象的占用高度，等于padding+border+height属性值之和，返回值是数值类型。
            left1.style.height = right1.offsetHeight + 'px';
            if (who1 == 1) { //左侧是树
                if (left1.children.length == 1) { //左侧只有.ztree
                    if (who5 == 1) { //右侧高度在可视区域范围内
                        tree1.style.minHeight = right1.offsetHeight - 24 + 'px';
                        tree1.style.maxHeight = right1.offsetHeight - 24 + 'px';
                    } else {
                        tree1.style.minHeight = body - 36 + 'px';
                        tree1.style.maxHeight = body - 36 + 'px';
                    }
                } else { //左侧不止有.ztree
                    tree1.style.height = right1.offsetHeight - 64 + 'px';
                }
            } else if (who2 == 1) { //左侧是表格
                if (who3 == 1) { //有页脚
                    table1.style.minHeight = right1.offsetHeight - 120 + 'px';
                    table1.style.maxHeight = right1.offsetHeight - 120 + 'px';
                } else { //没有页脚
                    table1.style.minHeight = right1.offsetHeight - 95 + 'px';
                    table1.style.maxHeight = right1.offsetHeight - 95 + 'px';
                }
            }
        }
    }
    if (search2) {
        var left2 = document.querySelector('.function-area2');
        var right2 = document.querySelector('.show-area2');
        if (!left2 || !right2) { return; }
        var oldLeft2 = left2.offsetHeight;
        resizeb2();
        changeHeight2();

        function changeHeight2() {
            var newLeft2 = left2.offsetHeight;
            if (newLeft2 != oldLeft2) {
                oldLeft2 = newLeft2;
                resizeb2();
            }
            setTimeout(changeHeight2, 100);
        }

        function resizeb2() {
            var table2 = right2.querySelectorAll('.ui-jqgrid-bdiv');
            var pager = right2.querySelector('.ui-jqgrid-pager');
            var tree2 = left2.querySelector('.ztree');
            var menu = left2.querySelector('.menu-area');
            var body = document.documentElement.clientHeight || document.body.clientHeight;
            var edit2 = right2.querySelector('.edit-area');
            var btn2 = right2.querySelector('.button-area');
            var tree3 = right2.querySelector('.ztree');
            var pagerLen = (pager == null) ? 0 : 1;
            var who3 = (table2.length == (NodeList.length)) ? 0 : 1;
            var who4 = (tree2 == null) ? 0 : 1;
            var tab2 = (menu == null) ? 0 : 1;
            var who5 = (edit2 == null) ? 0 : 1;
            var who6 = (btn2 == null) ? 0 : 1;
            var who7 = (tree3 == null) ? 0 : 1;
            right2.style.height = left2.offsetHeight + 'px';
            if (tab2 == 1) { //左侧有切换TAB
                if (who3 == 1) {
                    table2[0].style.minHeight = left2.offsetHeight - 118 + 'px';
                    table2[0].style.maxHeight = left2.offsetHeight - 118 + 'px';
                }
            } else { //左侧没有切换TAB
                if (right2.children.length == 1) { //右侧show-area只有1个子元素
                    if (who3 == 1 && who5 == 0) { //是表格不是编辑区域
                        table2[0].style.minHeight = left2.offsetHeight - 80 + 'px';
                        table2[0].style.maxHeight = left2.offsetHeight - 80 + 'px';
                    } else { //是编辑区域不是表格
                        tree2.style.minHeight = 250 + 'px';
                        tree2.style.maxHeight = body - 36 + 'px';
                    }
                } else { ////右侧show-area不只有1个子元素
                    if (who3 == 1) { //.ui-jqgrid-bdiv 存在
                        if (table2.length == 1) { //右侧有1个表格
                            table2[0].style.minHeight = left2.offsetHeight - 120 + 'px';
                            table2[0].style.maxHeight = left2.offsetHeight - 120 + 'px';
                        } else if (table2.length == 2) { //右侧有2个表格
                            if (pagerLen == 1) { //有页脚
                                table2[0].style.minHeight = left2.offsetHeight - 80 + 'px';
                                table2[0].style.maxHeight = left2.offsetHeight - 80 + 'px';
                                table2[1].style.minHeight = left2.offsetHeight - 80 + 'px';
                                table2[1].style.maxHeight = left2.offsetHeight - 80 + 'px';
                            } else { //没有页脚
                                tree2.style.minHeight = 395 + 'px';
                                tree2.style.maxHeight = body - 36 + 'px';
                                table2[0].style.minHeight = left2.offsetHeight - 95 + 'px';
                                table2[0].style.maxHeight = left2.offsetHeight - 95 + 'px';
                                table2[1].style.minHeight = left2.offsetHeight - 95 + 'px';
                                table2[1].style.maxHeight = left2.offsetHeight - 95 + 'px';
                            }
                        }
                    } else if (who4 == 1) { //左侧有树存在
                        if (who5 == 1 && who6 == 1) { //右侧有编辑区域存在并且编辑区域里有按钮存在
                            tree2.style.minHeight = edit2.offsetHeight + 28 + 'px';
                            tree2.style.maxHeight = body - 36 + 'px';
                        } else {
                            tree2.style.minHeight = left2.offsetHeight - 64 + 'px';
                            tree2.style.maxHeight = left2.offsetHeight - 64 + 'px';
                        }
                    } else if (who7 == 1) {
                        tree3.style.minHeight = left2.offsetHeight - 64 + 'px';
                        tree3.style.maxHeight = left2.offsetHeight - 64 + 'px';
                    }
                }
            }
        }
    }
};

function yearSelect(yearSelector) {
    var nowYear = new Date().getFullYear();
    var options = '';
    for (i = nowYear - 20; i < nowYear + 20; i++) {
        options += "<option value='" + i + "'>" + i + "年</option>";
    }
    $(yearSelector).append(options);
    $(yearSelector + " option[value='" + nowYear + "']").attr('selected', true);
}

function monthSelect(monthSelector) {
    var nowMonth = new Date().getMonth() + 1;
    var options = '';
    for (i = 1; i < 13; i++) {
        options += "<option value='" + i + "'>" + i + "月</option>";
    }
    $(monthSelector).append(options);
    $(monthSelector + " option[value='" + nowMonth + "']").attr('selected', true);
}

function parseParams(data) {
    try {
        var tempArr = [];
        for (var i in data) {
            var key = encodeURIComponent(i);
            var value = encodeURIComponent(data[i]);
            tempArr.push(key + '=' + value);
        }
        var urlParamsStr = tempArr.join('&');
        return urlParamsStr;
    } catch (err) {
        return '';
    }
}

//印章使用申请统一调用的方法
function signetUserApply(data,moduleKey){
    var businessid = data.id;
    var status = data.status;
    var title= data.title;
    var formNo = data.formNo;

    addMenuTabs(App.ctx+"/oa/signetUseMst/form?showType=0&businessId=" + businessid + "&moduleKey=" + moduleKey + "&extTitle=" + title +"&extNo=" + formNo,"印章使用新增");
}