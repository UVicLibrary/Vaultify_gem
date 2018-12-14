var edtfVar;

function edtfAPIQuery(query) {
    edtfVar = [];
    Rails.ajax({
        url: "/vaultify/edtf.text",
        async: false,
        type: "GET",
        data: "query=" + query,
        success: function (result) {
            if (result != "") {
                edtfVar.push(JSON.parse('{"text":"' + result + '", "url":"' + result + '"}'));
            }
        }
    });
}