$(function () {
    $("#add-category-btn").click(function () {
        $("#modal-title").text("新建分类")
        $("#save-category-btn").click(function () {
            var form = $("#category-form")
            form.attr({
                "action": "addcategory",
                "method": "post",
            })
            form.submit()
        })
        $("#category-modal").modal("show")
    })

    $(".modify-category-btn").click(function () {
        var id = $(this).attr("category-id")
        $("#modal-title").text("修改标签" + id)
        var form = $("#category-form")
        form.attr({
            "action": "updatecategory/" + id,
            "method": "post",
        })
        $("#save-category-btn").click(function () {
            form.submit()
            $("#category-modal").modal("hide")
        })
        $("#category-modal").modal("show")
    })
})
