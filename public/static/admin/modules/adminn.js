/*
 * @Descripttion: 
 * @version: 
 * @Author: wzs
 * @Date: 2020-03-12 16:10:23
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-22 16:25:11
 */
layui.define(function (e) {
	$.ajaxSetup({
		type: "post",
		dataType: "json"
	});
	window.reloadajax = function (url) {
		// console.log(1)
		container = 'body .layadmin-iframe'
		fragment = 'body .layadmin-iframe'
		// alert(url)
		$.pjax({
			url,
			container,
			fragment,
			timeout: 8000,
			scrollTo: false
		})
	}
	layui.use(['layer', 'laydate', 'form', 'upload'], function () {
		var layer = layui.layer,
			laydate = layui.laydate,
			form = layui.form,
			upload = layui.upload;
		/**
		 * 通用单图上传
		 */
		upload.render({
			url: "/admin/upload/upload",
			type: 'image',
			ext: 'jpg|png|gif|bmp',
			success: function (data, control) {
				if (data.error === 0) {
					console.log(control);
					if (control) {
						$(control).parent().parent().prev().val(data.url);
					}
				} else {
					layer.msg(data.message);
				}
			}
		});
		/**
		 * 复制文章链接
		 */
		$('.copy-url').on('click', function () {
			var url = this.children[0];
			url.select();
			document.execCommand("Copy");
			layer.msg('复制成功');
		});

		/**
		 * 通用日期时间选择
		 */
		$('.datetime').on('click', function () {
			laydate({
				elem: this,
				istime: true,
				format: 'YYYY-MM-DD hh:mm:ss'
			})
		});

		/**
		 * 通用表单提交(AJAX方式)
		 */
		form.on('submit(*)', function (data) {
			$.ajax({
				url: data.form.action,
				type: data.form.method,
				data: $(data.form).serialize(),
				success: function (info) {
					if (info.code === 1) {
						setTimeout(function () {
							parent.layer.close(parent.layer.getFrameIndex(window.name));
							// alert(location.href)
							// parent.window.location.reload();
							console.log(parent);
							parent.window.reloadajax(parent.location.href);

						}, 1000);
					}
					layer.msg(info.msg);
				}
			});

			return false;
		});

		/**
		 * 通用批量处理（审核、取消审核、删除）
		 */
		$('.ajax-action').on('click', function () {
			var _action = $(this).data('action');
			layer.open({
				shade: false,
				content: '确定执行此操作？',
				btn: ['确定', '取消'],
				yes: function (index) {
					$.ajax({
						url: _action,
						data: $('.ajax-form').serialize(),
						success: function (info) {
							if (info.code === 1) {
								setTimeout(function () {
									window.location.reload();
								}, 1000);
							}
							layer.msg(info.msg);
						}
					});
					layer.close(index);
				}
			});

			return false;
		});

		/**
		 * 通用全选
		 */
		$('.check-all').on('click', function () {
			$(this).parents('table').find('input[type="checkbox"]').prop('checked', $(this).prop('checked'));
		});

		/**
		 * 通用删除
		 */
		$('.ajax-delete').on('click', function () {
			var _href = $(this).attr('href');
			layer.open({
				shade: false,
				content: '确定删除？',
				btn: ['确定', '取消'],
				yes: function (index) {
					$.ajax({
						url: _href,
						type: "get",
						success: function (info) {
							if (info.code === 1) {
								setTimeout(function () {
									window.location.reload();
								}, 1000);
							}
							layer.msg(info.msg);
						}
					});
					layer.close(index);
				}
			});
			return false;
		});

		/**
		 * 清除缓存
		 */
		$('#clear-cache').on('click', function () {
			var _url = $(this).data('url');
			if (_url !== 'undefined') {
				$.ajax({
					url: _url,
					success: function (data) {
						if (data.code === 1) {
							setTimeout(function () {
								location.href = location.pathname;
							}, 1000);
						}
						layer.msg(data.msg);
					}
				});
			}
			return false;
		});

		$('body').off('click', '.form').on('click', '.form', function () {
			var view = $(this).data('url');
			layer.open({
				title: ['表单'],
				type: 2,
				anim: 2,
				maxWidth: 350,
				scrollbar: false,
				skin: 'layui-layer', //加上边框
				shadeClose: true,
				maxmin: true,
				// fixed: false,
				area: ['90%', '90%'], //宽高
				content: view //调到新增页面
			});
		});
	})
	e('adminn', {})
})