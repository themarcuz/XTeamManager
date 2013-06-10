$(function () {
    $('.board-title-edit').hide();
    $('.board-title').click(function () {
        $(this).hide();
        $(this).parent().find('.board-title-edit').show();

    })
})