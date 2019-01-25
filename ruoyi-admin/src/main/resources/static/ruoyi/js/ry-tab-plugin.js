var $tab=(function (document) {
    var open = function (dataUrl, menuName) {
        var dataIndex = new Date().getTime();
        flag = true;
        // 选项卡菜单已存在
        $('.menuTab', document).each(function () {
            if ($(this).data('id') == dataUrl) {
                if (!$(this).hasClass('active')) {
                    $(this).addClass('active').siblings('.menuTab').removeClass('active');
                    scrollToTab(this);
                    // 显示tab对应的内容区
                    $('.mainContent .RuoYi_iframe', document).each(function () {
                        if ($(this).data('id') == dataUrl) {
                            $(this).show().siblings('.RuoYi_iframe').hide();
                            return false;
                        }
                    });
                }
                flag = false;
                return false;
            }
        });
        // 选项卡菜单不存在
        if (flag) {
            var str = '<a href="javascript:;" class="active menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
            $('.menuTab', document).removeClass('active');

            // 添加选项卡对应的iframe
            var str1 = '<iframe class="RuoYi_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
            $('.mainContent', document).find('iframe.RuoYi_iframe').hide().parents('.mainContent').append(str1);

            $.modal.loading("数据加载中，请稍后...");

            $('.mainContent iframe:visible', document).load(function () {
                $.modal.closeLoading();
            });
            // 添加选项卡
            $('.menuTabs .page-tabs-content', document).append(str);
            scrollToTab($('.menuTab.active', document));
        }
        return false;
    }

    var calSumWidth =  function (elements) {
        var width = 0;
        $(elements).each(function () {
            width += $(this).outerWidth(true);
        });
        return width;
    }
    var scrollToTab = function (element) {
        var marginLeftVal = calSumWidth($(element).prevAll()),
            marginRightVal = calSumWidth($(element).nextAll());
        // 可视区域非tab宽度
        var tabOuterWidth = calSumWidth($(".content-tabs", document).children().not(".menuTabs"));
        //可视区域tab宽度
        var visibleWidth = $(".content-tabs", document).outerWidth(true) - tabOuterWidth;
        //实际滚动宽度
        var scrollVal = 0;
        if ($(".page-tabs-content", document).outerWidth() < visibleWidth) {
            scrollVal = 0;
        } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
            if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                scrollVal = marginLeftVal;
                var tabElement = element;
                while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content", document).outerWidth() - visibleWidth)) {
                    scrollVal -= $(tabElement).prev().outerWidth();
                    tabElement = $(tabElement).prev();
                }
            }
        } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
            scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
        }
        $('.page-tabs-content', document).animate({marginLeft: 0 - scrollVal + 'px'}, "fast");
    }
    return {openTab: open}
})(parent.document);