/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-11 21:11:51
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-29 20:22:16
 */
/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;
layui.extend({
    setter: "config",
    admin: "lib/admin",
    view: "lib/view"
}).define(["setter", "admin"], function (a) {
    var setter = layui.setter,
        element = layui.element,
        admin = layui.admin,
        view = layui.view,
        s = "#LAY_app_body",
        o = "layadmin-layout-tabs";
    // 导航菜单的间隔像素
    var menuCell = 5;

    layui.use('element', function () {
        var element = layui.element;
        var $ = layui.jquery;
        $.get('/admin/index/getMenAjax', function (data) {
            // data = JSON.parse(data);
            var liStr = "";
            // 遍历生成主菜单
            for (var i = 0; i < data.length; i++) {
                //console.log("--> "+JSON.stringify(data[i]));
                // 判断是否存在子菜单
                if (data[i].children != null && data[i].children.length > 0) {
                    liStr += "<li class=\"layui-nav-item\"><a class=\"\" lay-tips=\"" + data[i].title + "\" lay-direction=\"2\"><i class='layui-icon layui-icon-" + data[i].icon + "' ></i> <cite>" + data[i].title + "</cite></a>\n" +
                        "<dl class=\"layui-nav-child\">\n";
                    // 遍历获取子菜单
                    for (var k = 0; k < data[i].children.length; k++) {
                        liStr += getChildMenu(data[i].children[k], 0);
                    }
                    liStr += "</dl></li>";
                } else {
                    liStr += "<li class=\"layui-nav-item\"><a class=\"\" lay-href=\"" + data[i].name + "\" lay-tips=\"" + data[i].title + "\" lay-direction=\"2\"><i class='layui-icon layui-icon-" + data[i].icon + "' ></i> <cite>" + data[i].title + "</cite></a></li>";
                }
            };
            $("#LAY-system-side-menu").html("<ul class=\"layui-nav layui-nav-tree\"  lay-filter=\"test\">\n" + liStr + "</ul>");
            element.init();
        })
        $.post('/admin/index/postBreadcrumb', {
            'url': location.pathname + location.search
        }, function (data) {
            $('#breadcrumb').html(data.str)
        })

        $(document).on('pjax:complete', function () {
            $.post('/admin/index/postBreadcrumb', {
                'url': location.pathname + location.search
            }, function (data) {
                $('#breadcrumb').html(data.str)

            })
        })


    });

    // 递归生成子菜单
    function getChildMenu(subMenu, num) {
        num++;
        var subStr = "";
        if (subMenu.children != null && subMenu.children.length > 0) {
            subStr += "<dd><ul><li class=\"layui-nav-item\" ><a style=\"margin-Left:" + num * menuCell + "px\" class=\"\"  ><i class='layui-icon layui-icon-" + subMenu.icon + "' ></i> <cite>" + subMenu.title + "</cite></a>" +
                "<dl class=\"layui-nav-child\">\n";
            for (var j = 0; j < subMenu.children.length; j++) {
                subStr += getChildMenu(subMenu.children[j], num);
            }
            subStr += "</dl></li></ul></dd>";
        } else {
            subStr += "<dd><a style=\"margin-Left:" + num * menuCell + "px\" lay-href=\"" + subMenu.name + "\" ><i class='layui-icon layui-icon-" + subMenu.icon + "' ></i> <cite>" + subMenu.title + "</cite></a></dd>";
        }
        return subStr;
    }
    admin.screen() < 2 && admin.sideFlexible(),
        layui.config({
            base: setter.base + "modules/"
        }),
        view().autoRender(),
        layui.use("common"),
        a("index", {})
});