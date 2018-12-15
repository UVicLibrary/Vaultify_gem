var aatVar = [];

function aatAPIQuery(query) {
    cleanQuery = query.replace(/[^a-zA-Z0-9]\s/g, '');
    cleanQuery = cleanQuery.replace(" ", "+");
    cleanQuery = cleanQuery.replace('%20', "");
    cleanQuery = cleanQuery.replace("AAT", "");
    cleanQuery = cleanQuery.replace("aat", "");
    console.log(cleanQuery);
    aatVar = [];
    Rails.ajax({
        url: "/vaultify/aat.json",
        async: false,
        type: "GET",
        data: "cleanQuery=" + cleanQuery,
        success: function (result) {
            var dup = [];
            result.forEach(function (element) {
                console.log(element);
                if (!dup.includes(element.preferred_term)) {
                    dup.push(element.preferred_term);
                    aatVar.push(JSON.parse('{"text":"' + element.preferred_term + '", "url":"' + element.subject_id + '"}'));
                }
            });
        }
    });


    const options = {
        hostname: 'vocabsservices.getty.edu',
        path: '/AATService.asmx/AATGetTermMatch?term=' + cleanQuery + '&logop=&notes=',
        //headers: {
        //    'Authorization': 'Basic ' + 'user' + ':' + 'pass'
        //},
        method: 'GET',
    };
    console.log(options);
}
