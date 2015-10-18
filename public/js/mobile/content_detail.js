// 内容页JS

$(function () {
    // 查看全文按钮
    function hideLargeContent () {
        var contentHeight = $('.content').height();
        var heightLimit   = 500;
        
        if ($('.content iframe').length > 0) {
            var $iframe = $('.content iframe:first');
            heightLimit = $iframe.offset().top + $iframe.height() - 100;
        }
        
        if (contentHeight > heightLimit) {
            $('.content-box>.content').css('height', heightLimit + 'px');
            $('.content-box').after('' + 
            '<a href="#" class="more-box">' +
            '    点击查看全文<span class="more_ico"></span>' +
            '</a>' +
            '');
            
            $('.more-box').click(function (event) {
                event.preventDefault();
                
                $(this).remove();
                $('.content-box>.content').css('height', 'auto');
            });
        }
    }
    
    setTimeout(hideLargeContent, 300);
    
    // 图片放大绑定
    (function () {
        $('.js_img').wrap(function () {
            return '<div class="js_img_zoom">' + $(this).text() + '</div>';
        });
        
        $('.js_img_zoom').prepend('<span class="icon_zoom"></span>').click(function (event) {
            var $_this   = $(this);
            var $_img    = $_this.find('.js_img');
            
            $_img[0].src = $_img.attr('original-src');
            $_this.find('.icon_zoom').remove();
            $_this.addClass('expended').unbind('click');
        });
        
        $('.js_img_zoom').parent('p').css('text-align', 'center');
    })();
    
});