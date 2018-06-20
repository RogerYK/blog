$(function () {
    var editor = editormd("editormd", {
        path: "/vendor/editor/lib/",
        width: "100%",
        height: 800,
        saveHTMLToTextarea: true,
    })

    $("#blog-release").bind("click", function () {
        $("#input-md").val(editor.getMarkdown())
        $("#input-html").val(editor.getHTML())
        $("#blog-form").submit()
    })
})
