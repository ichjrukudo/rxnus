$(document).ready(function () {
    $.ajax({
        type: "GET",
        dataType: "json",
        url: "http://localhost:6789/api/product/1",
        success: function (data) {
            alert(data);
            $('#id').text(data.ID);
            $('#code').text(data.Code);
            $('#name').text(data.Name);
        },
        error: function (e) {
            debugger;
        }
    });
});