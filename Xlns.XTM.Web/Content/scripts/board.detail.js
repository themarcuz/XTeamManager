$(function () {

    //handles card saving
    $('.board-central').on('click', '.save-card-edit', function () {
        $(this).parents('.card').attr('data-saved', 'true');
    });

    //handles card canceling
    $('.board-central').on('click', '.cancel-card-edit', function () {
        $(this).parents('.card').remove();
    });

    //handles new card adding
    $('.board-central').on('click', '.new-card', function () {
        var cardListDiv = $(this).parents('.list-container').find('.card-list');
        var cardTemplate = $('#card-template').clone();
        cardListDiv.append(cardTemplate.html());
    });

    //handles new list command
    $('.board-central').on('click', '.new-list-command', function () {
        var listTemplate = $('#list-template').clone();
        var boardCentral = $(this).parents('.new-list-box').before(listTemplate);
    });
})