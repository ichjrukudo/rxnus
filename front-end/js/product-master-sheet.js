$(document).ready(function () {
    makeRequest("GET", "http://localhost:6789/api/product/1").then( data => {
        console.log(data);
    }).catch(err => {
        console.log(err);
    });
});

function renderData(data) {
    alert(data);
    $('#id').text(data.ID);
    $('#code').text(data.Code);
    $('#name').text(data.Name);
}

function makeRequest(type, url, callBack) {
    return new Promise((resolve, reject)=> {
         $.ajax({
            type: type,
            dataType: "json",
            url: url,
            success: (data, status, res) => {
                console.log(res)
                return resolve(data)
            },
            error: (err) => reject(err)
        });
    } )
}