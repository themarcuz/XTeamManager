var preventBlurring = false;

$(function () {
    $('.editable-property .edit-area').hide();
    $('.editable-property .edit-area .editable-value')
        .keyup(function (event) {
            var oldValue = $(this).parents('.editable-property').find('.readonly-value').text();
            if (event.keyCode == 27) { //esc
                $(this).blur();
                $(this).val(oldValue);
            }
        });
    $('.editable-property .edit-area .editable-value.send-on-cr')
        .keyup(function (event) {
            if (event.which == 13) { //enter
                PersistUpdate(this);
                $(this).blur();
            }
        });
    $('.editable-property .readonly-value').click(function () {
        $(this).hide();
        $(this).parent('.editable-property').find('.edit-area')
            .show()     //show all edit area
            .find('.editable-value').select();   //select all the text in textbox

        });
    $('.editable-property .edit-area .btn-save')
        .mousedown(function () {
            preventBlurring = true;            
        })
        .click(function () {
            var inputBox = $(this).parents('.edit-area').find('.editable-value');
            PersistUpdate(inputBox);
            preventBlurring = false;
            inputBox.blur();
        });
    $('body').mouseup(function () {
        preventBlurring = false;        
    })
    $('.editable-property .edit-area .editable-value').blur(function () {
        if (!preventBlurring) {
            $(this).parents('.edit-area').hide();
            $(this).parents('.editable-property').find('.readonly-value').show();
        }
    });
})

function PersistUpdate(editElement) {
    var editablePropertyDiv = $(editElement).parents('.editable-property');
    var readonlyElement = editablePropertyDiv.find('.readonly-value');
    var oldValue = readonlyElement.text();
    var id = editablePropertyDiv.attr('data-entity-id');
    var newValue = $(editElement).val();
    var entityName = editablePropertyDiv.attr('data-entity-name');
    var propertyName = editablePropertyDiv.attr('data-property-name');
    UpdateProperty(entityName, id, propertyName, newValue, oldValue, readonlyElement);
}

function UpdateProperty(entityName, id, propertyName, newValue, oldValue, readonlyElement) {
    readonlyElement.text(newValue);
    $.ajax({
        type: 'POST',
        url: "/" + entityName + "/Save" + propertyName,
        cache: false,
        data: { Id: id, Value: newValue },
        context: $(this),
        success: function () {
            readonlyElement.switchClass("", "alert-success", 300).delay(300).switchClass("alert-success", "", 300);
        },
        error: function (errMsg) {
            readonlyElement.text(oldValue);
            readonlyElement.switchClass("", "alert-error", 300)
                            .switchClass("alert-error", "", 300)
                            .switchClass("", "alert-error", 300)
                            .switchClass("alert-error", "", 300)
                            .switchClass("", "alert-error", 300)
                            .delay(500)
                            .switchClass("alert-error", "", 300);
        }
    });
}