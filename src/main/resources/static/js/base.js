$(function() {
    $(window).scroll(function () {
        $('#to-top').hide()
        if ($(window).scrollTop() >= 400) {
            $('#to-top').show()
        }
    })
    $('#to-top').click(function () {
        $('body').animate({ scrollTop: 0 }, 400)
    })
    
    
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $.ajaxSetup({
        beforeSend: function (xhr) {
            if (header && token) {
                xhr.setRequestHeader(header, token);
            }
        }
    })  
    $('#logout-btn').click(function() {
        var url = $(this).attr('data-logout-url')
        $.post(url,{}, function() {
            location.href='/'
        })
    })
})

