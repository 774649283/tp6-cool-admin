/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-11 21:11:51
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-17 16:53:47
 */
/** layuiAdmin.std-v1.0.0 LPPL License By http://www.layui.com/admin/ */
;layui.extend({
    setter: "config",
    admin: "lib/admin",
    view: "lib/view"
}).define(["setter", "admin"], function(a) {
    var e = layui.setter
      , i = layui.element
      , n = layui.admin
      , t = n.tabsPage
      , d = layui.view
      , l = function(a, d) {
        var l, b = r("#LAY_app_tabsheader>li"), y = a.replace(/(^http(s*):)|(\?[\s\S]*$)/g, "");
        if (b.each(function(e) {
            var i = r(this)
              , n = i.attr("lay-id");
            n === a && (l = !0,
            t.index = e)
        }),
        d = d || "新标签页",
        e.pageTabs)
            l || (
                // r(s).append(['<div class="layadmin-tabsbody-item layui-show">', '<iframe src="' + a + '" frameborder="0" class="layadmin-iframe"></iframe>', "</div>"].join("")),
            t.index = b.length,            
            i.tabAdd(o, {
                title: "<a lay-href=\"" + a + "\"><span>" + d + "</span></a>",
                id: a,
                attr: y
            }),str = a=="/admin/index/index.html"?'':'<span lay-separator="">/</span><a><cite>' + d + '</cite></a>',$('#breadcrumb').html('<a lay-href="/admin/index/index.html">主页</a>' + str));
        else {
            var u = n.tabsBody(n.tabsPage.index).find(".layadmin-iframe");
            u[0].contentWindow.location.href = a

        }
        i.tabChange(o, a),
        n.tabsBodyChange(t.index, {
            url: a,
            text: d
        })
    }
      , s = "#LAY_app_body"
      , o = "layadmin-layout-tabs"
      , r = layui.$;
    r(window);
    n.screen() < 2 && n.sideFlexible(),
    layui.config({
        base: e.base + "modules/"
    }),
    // layui.each(e.extend, function(a, i) {
    //     var n = {};
    //     n[i] = "{/}" + e.base + "lib/extend/" + i,
    //     layui.extend(n)
    // }),
    str = $('#LAY-system-side-menu').find('.layui-this a').text(),
    url = $('#LAY-system-side-menu').find('.layui-this a').attr('lay-href'),
    str2 = url=='/admin/index/index.html'?'<a lay-href="/admin/index/index.html">主页</a>':'<a lay-href="/admin/index/index.html">主页</a><span lay-separator="">/</span><a><cite>' + str + '</cite></a>'
    $('#breadcrumb').html(str2),
    // alert(1);  
    d().autoRender(),
    layui.use("common"),
    a("index", {
        openTabsPage: l
    })
});
