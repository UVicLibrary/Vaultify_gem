function fast_horsey() {
    var current_api = "fast";
    return horsey(document.querySelector('#autoc_field'), {
        source(data, done) {
            fastAPIQuery(data.input, 'suggestall');
            setTimeout(function () {
                done(null, [{
                    list: fastVar
                }])
            }, 2000);
        },
        getText: 'text',
        getValue: 'url',
        limit: 10
    });
}

function aat_horsey() {
    return horsey(document.querySelector('#autoc_field'), {
        source(data, done) {
            aatAPIQuery(data.input, 'suggestall');
            setTimeout(function () {
                done(null, [{
                    list: aatVar
                }])
            }, 2000);
        },
        getText: 'text',
        getValue: 'url',
        limit: 10
    });
}

function iso_horsey() {
    return horsey(document.querySelector('#autoc_field'), {
        source(data, done) {
            isoAPIQuery();
            setTimeout(function () {
                done(null, [{
                    list: isoVar
                }])
            }, 2000);
        },
        getText: 'text',
        getValue: 'url',
        limit: 10
    });
}

function dcmi_horsey() {
    return horsey(document.querySelector('#autoc_field'), {
        source(data, done) {
            setTimeout(function () {
                done(null, [{
                    list: dcmiVar
                }])
            }, 2000);
        },
        getText: 'text',
        getValue: 'url',
        limit: 10
    });
}

function edtf_horsey() {
    return horsey(document.querySelector('#autoc_field'), {
        source(data, done) {
            edtfAPIQuery(data.input);
            setTimeout(function () {
                done(null, [{
                    list: edtfVar
                }])
            }, 2000);
        },
        getText: 'text',
        getValue: 'url',
        limit: 10
    });
}