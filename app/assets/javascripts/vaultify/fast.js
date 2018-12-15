//var express = require('express');
//var router = express.Router();
//const http = require('http');
var xhr = new XMLHttpRequest();

//router.get('/:index/:query', function(req, res, next) {
function makeFastQuery (req, res, next) {
  result = fastAPIQuery(req.params.query, req.params.index, (err, data) => {
    if (err || !data) {
      console.log(err);
      return next(err);
    }

    const names = [];
    const ids = [];
    data.forEach(element => {
      console.log(element);
      if (!names.includes(element.auth)){
          names.push(element.auth);
          ids.push(element.idroot)
        }
    });
    res.json({'names': names, 'ids': ids})
  })
}

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

  /*

  const req = http.get(url, (res) => {
    res.setEncoding('utf8');

    res.on('data', (chunk) => {
      buffer += chunk
    });

    res.on('end', () => {
      const data = JSON.parse(buffer);
      callback(null, data.response.docs)
    })
  })
  req.on('error', (err) => {
    callback(err);
  })*/


//module.exports = router;