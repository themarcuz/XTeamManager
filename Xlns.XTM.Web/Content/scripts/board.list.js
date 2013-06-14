$(function () {
    $('.board-title-edit')
        .hide()
        .keyup(function (event) {
            if (event.which == 13) { //enter
                var boardId = $(this).attr('data-board-id');
                var newtitle = $(this).val();
                var titleElement = $(this).parent().find('.board-title');
                var oldTitle = titleElement.text();
                titleElement.text(newtitle);
                SaveBoardTitle(boardId, newtitle, oldTitle);
                $(this).blur();
            }
            if (event.keyCode == 27) { //esc
                $(this).blur();
            }
        });
    $('.board-title').click(function () {
        $(this).hide();
        $(this).parent().find('.board-title-edit')
            .show()
            .select();   //select all the text in textbox

    })
    $('.board-title-edit').blur(function () {
        $(this).hide();
        $(this).parent().find('.board-title').show();
    })
})

function SaveBoardTitle(id, title, oldTitle) {
    //alert('si sta cercando di salvare il titolo "' + title + '" per la board ' + id);
    $.ajax({
        type: 'POST',
        url: "/Board/SaveTitle",
        cache: false,
        data: { IdBoard: id, Title: title },
        context: $(this),
        error: function () {
            alert(errMsg);
            var titleElement = $('h2.board-title[data-board-id=' + id + ']');
            titleElement.text(oldTitle);
            }
    });
}