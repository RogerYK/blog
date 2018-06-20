var replyuser = null
var replyid = null
$(function () {
    var editor = editormd("editormd", {
        path: "/vendor/editor/lib/",
        width: "100%",
        height: 150,
        saveHTMLToTextarea: true,
    })

    $('.reply-btn').click(function () {
        replyuser = $(this).attr('data-reply-username')
        replyid = $(this).attr('data-reply-comment-id')
        $('#reply-to').text('回复@' + replyuser)
        $('#reply-cancel').removeClass('d-none')
    })

    $('#submit-btn').click(function () {
        var url = $(this).attr('data-submit-url')
        var articleId = $(this).attr('data-article-id')
        var jqxhr = $.post(
            url,
            {
                replyUsername: replyuser,
                replyCommentId: replyid,
                replyArticleId: articleId,
                content: editor.getHTML()
            },
            function (data) {
                if (data.success) {
                    location.reload();
                } else {
                    alert('评论失败')
                }
            },
            'json'
        ).fail(function () {
            alert('评论失败')
        })
    })

    $('#reply-cancel').click(function () {
        replyuser = null
        replyid = null
        $('#reply-to').text('')
        $(this).addClass('d-none')
    })
})
