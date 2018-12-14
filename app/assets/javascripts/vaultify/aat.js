/*var express = require('express');
var router = express.Router();
var config = require('../defaultConfig')
const http = require('http');
const xmlParseString = require('xml2js').parseString;
*/


function makeAatQuery(req, res, next) {
    result = aatAPIQuery(req.params.query, (err, data) => {
        if (err || !data) {
            console.log(err)
            return next(err)
        }
        let subjects;
        try {
            subjects = data.Vocabulary.Subject.map(subject => {
                return subject.Preferred_Term[0]._
            })
        } catch (e) {
            subjects = []
        }
        res.json({'names': subjects})
    })
}

var aatVar;
function aatAPIQuery (query, format) {
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
            aatVar = result;
        }
    });


    const options = {
        hostname: 'vocabsservices.getty.edu',
        path: '/AATService.asmx/AATGetTermMatch?term=' + cleanQuery + '&logop=&notes=',
        headers: {
            'Authorization': 'Basic ' + 'user' + ':' + 'pass'
        },
        method: 'GET',
    };
    console.log(options);
}

/*
const req = http.request(options, (res) => {
  let buffer = "";
  res.setEncoding('utf8');

  res.on('data', (chunk) => {
    buffer += chunk
  });

  res.on('end', () => {
    xmlParseString(buffer, (err, res) => {
      if (err) {
        console.log(err)
        callback(err)
      }
      callback(null, res)
    });
  })
})
req.on('error', (err) => {
  console.log(err)
})
req.end()
}


module.exports = router;

*/