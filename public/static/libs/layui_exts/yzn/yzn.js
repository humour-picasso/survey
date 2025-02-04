//封装基本操作 部分参考EasyAdmin和fastadmin
layui.define(['layer','table', 'notice', 'addons'], function(exports) {
    var layer = layui.layer,
        $ = layui.$,
        table = layui.table,
        notice = layui.notice;

    var MOD_NAME = 'yzn';

    yzn = {
        config: {
            shade: [0.02, '#000'],
        },
        checkAuth: function (node,ele) {
            /*if (CONFIG.IS_SUPER_ADMIN) {
                return true;
            }*/
            var attr = $(ele).data("auth-" + node);
            if (typeof attr === 'undefined' || attr) {
                return true;
            }
            if(node.indexOf('?')>=0) node = node.replace(/([?#])[^'"]*/, '');           //去除参数
            if ($(ele).attr('data-auth-' + node.toLowerCase()) === '1') {
                return true;
            } else {
                return false;
            }  
        },
        open: function(title, url, width, height, options, isResize) {
            isResize = isResize === undefined ? true : isResize;
            var area = yzn.config.openArea != undefined ? yzn.config.openArea : [$(window).width() > width ? width + 'px' : '95%', $(window).height() > height ? height + 'px' : '95%'];
            options = $.extend({
                title: title,
                type: 2,
                area: area,
                content: url + (url.indexOf("?") > -1 ? "&" : "?") + "dialog=1",
                maxmin: true,
                moveOut: true,
                success: function(layero, index) {
                    var that = this;
                    $(layero).data("callback", that.callback);
                    layer.setTop(layero);
                    try {
                        var frame = layer.getChildFrame('body', index);
                        var layerfooter = frame.find(".layer-footer");
                        yzn.layerfooter(layero, index, that);
                        //绑定事件
                        if (layerfooter.size() > 0) {
                            // 监听窗口内的元素及属性变化
                            // Firefox和Chrome早期版本中带有前缀
                            var MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;
                            if (MutationObserver) {
                                // 选择目标节点
                                var target = layerfooter[0];
                                // 创建观察者对象
                                var observer = new MutationObserver(function(mutations) {
                                    yzn.layerfooter(layero, index, that);
                                    mutations.forEach(function(mutation) {});
                                });
                                // 配置观察选项:
                                var config = { attributes: true, childList: true, characterData: true, subtree: true }
                                // 传入目标节点和观察选项
                                observer.observe(target, config);
                                // 随后,你还可以停止观察
                                // observer.disconnect();
                            }
                        }
                    } catch (e) {
                    }
                    if (frame && frame.length > 0) {
                        $.each(frame, function(i, v) {
                            // todo 优化弹出层背景色修改
                            $(v).before('<style>\n' +
                                'html, body {\n' +
                                '    background: #ffffff !important;\n' +
                                '}\n' +
                                '</style>');
                        });
                    }
                    if (yzn.checkMobile() || width === undefined || height === undefined) {
                        layer.full(index);
                    }
                    if (isResize) {
                        $(window).on("resize", function() {
                            //layer.full(index);
                            layer.style(index, {
                                top: 0,
                                height: $(window).height()
                            })
                        })
                    }
                }
            }, options ? options : {})
            return layer.open(options);
        },
        //关闭窗口并回传数据
        close: function(data) {
            var index = parent.layer.getFrameIndex(window.name);
            var callback = parent.$("#layui-layer" + index).data("callback");
            //再执行关闭
            parent.layer.close(index);
            //再调用回传函数
            if (typeof callback === 'function') {
                callback.call(undefined, data);
            }
        },
        layerfooter: function(layero, index, that) {
            var frame = layer.getChildFrame('html', index);
            var layerfooter = frame.find(".layer-footer");
            //表单按钮
            if (layerfooter.size() > 0) {
                $(".layui-layer-footer", layero).remove();
                var footer = $("<div />").addClass('layui-layer-btn layui-layer-footer');
                footer.html(layerfooter.html());
                footer.insertAfter(layero.find('.layui-layer-content'));
                //绑定事件
                footer.on("click", ".layui-btn", function() {
                    if ($(this).hasClass("disabled") || $(this).parent().hasClass("disabled")) {
                        return;
                    }
                    var index = footer.find('.layui-btn').index(this);
                    $(".layui-btn:eq(" + index + ")", layerfooter).trigger("click");
                });
                var titHeight = layero.find('.layui-layer-title').outerHeight() || 0;
                var btnHeight = layero.find('.layui-layer-btn').outerHeight() || 0;
                //重设iframe高度
                $("iframe", layero).height(layero.height() - titHeight - btnHeight);
            }
        },
        checkMobile: function() {
            var userAgentInfo = navigator.userAgent;
            var mobileAgents = ["Android", "iPhone", "SymbianOS", "Windows Phone", "iPad", "iPod"];
            var mobile_flag = false;
            //根据userAgent判断是否是手机
            for (var v = 0; v < mobileAgents.length; v++) {
                if (userAgentInfo.indexOf(mobileAgents[v]) > 0) {
                    mobile_flag = true;
                    break;
                }
            }
            var screen_width = window.screen.width;
            var screen_height = window.screen.height;
            //根据屏幕分辨率判断是否是手机
            if (screen_width < 600 && screen_height < 800) {
                mobile_flag = true;
            }
            return mobile_flag;
        },
        formatDateTime: function(timeStamp) {
            var date = new Date();
            date.setTime(timeStamp * 1000);
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            m = m < 10 ? ('0' + m) : m;
            var d = date.getDate();
            d = d < 10 ? ('0' + d) : d;
            var h = date.getHours();
            h = h < 10 ? ('0' + h) : h;
            var minute = date.getMinutes();
            var second = date.getSeconds();
            minute = minute < 10 ? ('0' + minute) : minute;
            second = second < 10 ? ('0' + second) : second;
            return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;
        },
        parame: function(param, defaultParam) {
            return param !== undefined ? param : defaultParam;
        },
        events: {
            //请求成功的回调
            onAjaxSuccess: function(ret, onAjaxSuccess) {
                var data = typeof ret.data !== 'undefined' ? ret.data : null;
                var msg = typeof ret.msg !== 'undefined' && ret.msg ? ret.msg : '操作成功!';

                if (typeof onAjaxSuccess === 'function') {
                    var result = onAjaxSuccess.call(this, data, ret);
                    if (result === false)
                        return;
                }
            },
            //请求错误的回调
            onAjaxError: function(ret, onAjaxError) {
                var data = typeof ret.data !== 'undefined' ? ret.data : null;
                if (typeof onAjaxError === 'function') {
                    var result = onAjaxError.call(this, data, ret);
                    if (result === false) {
                        return;
                    }
                }
            },
            //服务器响应数据后
            onAjaxResponse: function(response) {
                try {
                    var ret = typeof response === 'object' ? response : JSON.parse(response);
                    if (!ret.hasOwnProperty('code')) {
                        $.extend(ret, { code: -2, msg: response, data: null });
                    }
                } catch (e) {
                    var ret = { code: -1, msg: e.message, data: null };
                }
                return ret;
            }
        },
        request: {
            //修复URL
            fixurl: function(url) {
                if (url.substr(0, 1) !== "/") {
                    var r = new RegExp('^(?:[a-z]+:)?//', 'i');
                    if (!r.test(url)) {
                        url = "/" + url;
                    }
                }
                return url;
            },
            post: function(options, success, error) {
                return yzn.request.ajax('post', options, success, error);
            },
            get: function(options, success, error) {
                return yzn.request.ajax('get', options, success, error);
            },
            ajax: function(type, options, success, error) {
                options = typeof options === 'string' ? { url: options } : options;
                var index;
                if (typeof options.loading === 'undefined' || options.loading) {
                    index = layer.load(options.loading || 0);
                }
                options = $.extend({
                    type: type || 'get',
                    dataType: "json",
                    url: options.url || '',
                    data: options.data || {},
                    xhrFields: {
                        withCredentials: true
                    },
                    complete: function(xhr, textStatus) {
                        var token = xhr.getResponseHeader('__token__');
                        if (token) {
                            $("input[name='__token__']").val(token);
                        }
                    },
                    success: function(ret) {
                        index && layer.close(index);
                        //刷新客户端token
                        if (ret && typeof ret === 'object' && typeof ret.token !== 'undefined') {
                            $("input[name='__token__']").val(data.token);
                        }
                        ret = yzn.events.onAjaxResponse(ret);
                        if (ret.code === 1) {
                            yzn.events.onAjaxSuccess(ret, success);
                        } else {
                            yzn.events.onAjaxError(ret, error);
                        }
                    },
                    error: function(xhr) {
                        index && layer.close(index);
                        var ret = { code: xhr.status, msg: xhr.statusText, data: null };
                        yzn.events.onAjaxError(ret, error);
                    }
                }, options);
                return $.ajax(options);
            }
        },
        notice: {
            // 成功消息
            success: function(msg) {
                var index = notice.success({ message: msg });
                return index;
            },
            // 失败消息
            error: function(msg) {
                var index = notice.error({ message: msg });
                return index;
            },
            // 警告消息框
            warning: function(msg) {
                var index = notice.warning({ message: msg });
                return index;
            },
            // 消息提示
            info: function(msg) {
                var index = notice.info({ message: msg });
                return index;
            },
        },
        msg: {
            // 成功消息
            success: function(msg, callback) {
                if (callback === undefined) {
                    callback = function() {}
                }
                var index = layer.msg(msg, { icon: 1, shade: yzn.config.shade, scrollbar: false, time: 2000, shadeClose: true }, callback);
                return index;
            },
            // 失败消息
            error: function(msg, callback) {
                if (callback === undefined) {
                    callback = function() {}
                }
                var index = layer.msg(msg, { icon: 2, shade: yzn.config.shade, scrollbar: false, time: 3000, shadeClose: true }, callback);
                return index;
            },
            // 警告消息框
            alert: function(msg, callback) {
                var index = layer.alert(msg, { end: callback, scrollbar: false });
                return index;
            },
            // 对话框
            confirm: function(msg, ok, no) {
                var index = layer.confirm(msg, { title: '操作确认', btn: ['确认', '取消'] }, function() {
                    typeof ok === 'function' && ok.call(this);
                }, function() {
                    typeof no === 'function' && no.call(this);
                    self.close(index);
                });
                return index;
            },
            // 消息提示
            tips: function(msg, time, callback) {
                var index = layer.msg(msg, { time: (time || 3) * 1000, shade: this.shade, end: callback, shadeClose: true });
                return index;
            },
            // 加载中提示
            loading: function(msg, callback) {
                var index = msg ? layer.msg(msg, { icon: 16, scrollbar: false, shade: this.shade, time: 0, end: callback }) : layer.load(2, { time: 0, scrollbar: false, shade: this.shade, end: callback });
                return index;
            },
            // 关闭消息框
            close: function(index) {
                return layer.close(index);
            }
        },
        cache: {
            setStorage: function(key, value) {
                if (value != null && value !== "undefined") {
                    layui.data(key, {
                        key: key,
                        value: value
                    })
                } else {
                    layui.data(key, {
                        key: key,
                        remove: true
                    })
                }
            },
            getStorage: function(key) {
                var array = layui.data(key);
                if (array) {
                    return array[key]
                } else {
                    return false
                }
            }
        },
        init: function() {
            //修复含有fixed-footer类的body边距
            if ($(".fixed-footer").size() > 0) {
                $(document.body).css("padding-bottom", $(".fixed-footer").outerHeight());
            }
            //修复不在iframe时layer-footer隐藏的问题
            if ($(".layer-footer").size() > 0 && self === top) {
                $(".layer-footer").show();
            }
            var tips_index = 0;
            $(document).on('mouseenter', '[lay-tips]', function () {
                tips_index = layer.tips($(this).attr('lay-tips'), this, {
                    tips: 1,
                    time: 0
                });
            }).on('mouseleave', '[lay-tips]', function(){
                layer.close(tips_index);
            });
            // 对相对地址进行处理
            $.ajaxSetup({
                beforeSend: function(xhr, setting) {
                    setting.url = yzn.request.fixurl(setting.url);
                }
            });
            layer.config({
                skin: 'layui-layer-yzn'
            });
            notice.settings({
                timeout: 3000, //消失时间
                theme: 'dark', // 主题 dark light
                position: 'topRight', // 位置 bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter, center
                displayMode: 0, //0无限制 1同类型存在不显示 2同类型存在先移除
                progressBar: true, //进度条
            });
            // 放大图片
            $('body').on('click', '[data-image]', function() {
                var title = $(this).attr('data-image'),
                    src = $(this).attr('src'),
                    alt = $(this).attr('alt');
                var photos = {
                    "title": title,
                    "id": Math.random(),
                    "data": [{
                        "alt": alt,
                        "pid": Math.random(),
                        "src": src,
                        "thumb": src
                    }]
                };
                layer.photos({
                    photos: photos,
                    anim: 5
                });
                return false;
            });
            // 绑定ESC关闭窗口事件
            $(window).keyup(function (e) {
                if (e.keyCode == 27) {
                    if ($(".layui-layer").length > 0) {
                        var index = 0;
                        $(".layui-layer").each(function () {
                            index = Math.max(index, parseInt($(this).attr("times")));
                        });
                        if (index) {
                            layer.close(index);
                        }
                    }
                }
            });
            //点击包含.btn-addtabs的元素时新增选项卡
            $(document).on('click', '.btn-addtabs,.addtabsit', function (e) {
                var that = this;
                var options = $.extend({}, $(that).data() || {});
                var id = $(that).data("menu-id") || Math.round(Math.random() * (99999-10000) + 10000);
                var url = $(that).data("url") || $(that).attr('href');
                var title = $(that).attr("title") || $(that).data("title") || $(that).data('original-title');

                if (!$(this).attr('data-menu-id')) {
                    $(this).attr('data-menu-id', id);
                }
                if(parent.layui.admin){
                   parent.layui.admin.addTab(id, title,url);
                }else if(window.top.layui.admin){
                    window.top.layui.admin.addTab(id, title,url);
                }
            })
            // 监听弹出层的打开
            $(document).on('click', '[data-open]', function() {
                var clienWidth = $(this).attr('data-width') || 800,
                    clientHeight = $(this).attr('data-height') || 600,
                    dataFull = $(this).attr('data-full'),
                    checkbox = $(this).attr('data-checkbox'),
                    url = $(this).attr('data-open'),
                    title = $(this).attr("title") || $(this).data("title"),
                    tableId = $(this).attr('data-table');

                if (checkbox === 'true') {
                    tableId = tableId || init.table_render_id;
                    var checkStatus = table.checkStatus(tableId),
                        data = checkStatus.data;
                    if (data.length <= 0) {
                        yzn.msg.error('请勾选需要操作的数据');
                        return false;
                    }
                    var ids = [];
                    $.each(data, function(i, v) {
                        ids.push(v.id);
                    });
                    if (url.indexOf("?") === -1) {
                        url += '?id=' + ids.join(',');
                    } else {
                        url += '&id=' + ids.join(',');
                    }
                }
                if (dataFull === 'true') {
                    clienWidth = '100%';
                    clientHeight = '100%';
                }
                yzn.open(title, url, clienWidth, clientHeight);
            });
        }
    }
    yzn.init();
    exports(MOD_NAME, yzn);
});