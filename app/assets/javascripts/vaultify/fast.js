var fastVar;


function fastAPIQuery(query, queryIndex) {
    fastVar = [];
    query = query.replace(/[^a-zA-Z\d\s]/g, '');
    const suggestReturn = queryIndex + "%2Cidroot%2Cauth";
    let qres = "&query=" + query + "&queryIndex=" + queryIndex + "&queryReturn=" + suggestReturn;
    qres += "&suggest=autoSubject&rows=20";
    Rails.ajax({
        url: "/vaultify/fast.json",
        async: false,
        type: "GET",
        data: qres,
        success: function (result) {
            dup = [];
            result.response.docs.forEach(function (element) {
                console.log(element);
                if (!dup.includes(element.auth)) {
                    dup.push(element.auth);
                    fastVar.push(JSON.parse('{"text":"' + element.auth + '", "url":"' + element.idroot + '"}'));
                }
            });
        }
    });
}
