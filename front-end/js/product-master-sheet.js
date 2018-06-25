$(document).ready(function () {
    makeRequest("GET", "http://localhost:6789/api/product/1", renderData);
});

function renderData(data) {
    alert(data);
    $('#id').text(data.ID);
    $('#code').text(data.Code);
    $('#name').text(data.Name);
}

function makeRequest(type, url, callBack) {
    $.ajax({
        type: type,
        dataType: "json",
        url: url,
        success: function (data) {
            callBack(data);
        },
        error: function (e) {
            debugger;
        }
    });
}