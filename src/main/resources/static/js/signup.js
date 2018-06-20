$(function () {
    $('#signup-form').ajaxForm({
        dataType: 'json',
        beforeSubmit: function (attr, $form) {
            var $p1 = $('#id-password')
            var $p2 = $('#id-repassword')
            if ($p1.val() !== $p2.val()) {
                $p1.val('')
                $p2.val('')
                $('#password-alert').text('两次密码不一致')
                return false
            }
            return true
        },
        success: function (data) {
            if (data.error) {
                console.log('注册失败')
                var $alert = $('#' + data.error.errorPos + '-alert')
                $alert.text(data.error.errorMsg)
            }
            if (data.success) {
                console.log('注册成功')
                window.location.href = '/account/login'
            }
        }
    })
})