var modal, autoc, current_api;

function fileValidation() {

    var fileInput = document.getElementById("csv");
    var filePath = fileInput.value;
    var allowedExtensions = /(\.csv)$/i;
    if (!allowedExtensions.exec(filePath)) {
        alert('ERROR: This is not a valid file type. You can only upload .CSV extension files');
        fileInput.value = '';
        return false;
    }
}

function loadTable(e) {
    var tables = document.getElementsByTagName('table');
    Array.from(tables).forEach(function (element) {
        if (element.id != "modal_table")
            element.style.display = "none";
    });
    document.getElementById(e.value).style.display = "table";
    var this_api = document.getElementById(e.value + "_api").innerText;
    if (current_api != this_api) {
        autoc.destroy();
        autoc = window[this_api + "_horsey"]();
        current_api = this_api;
    }
}

window.onload = function () {
    modal = document.getElementById('editModal');
    window.onclick = function (event) {
        if (event.target == modal) {
            closeModal();
        }
    };
    var table = document.getElementsByTagName('table')[0].id;
    current_api = document.getElementById(table + "_api").innerHTML;
    autoc = window[current_api + "_horsey"]()
};

function clear_modal() {
    document.getElementById("modal_title").innerHTML = "";
    document.getElementById("modal_orig").innerHTML = "";
    document.getElementById("modal_adjust").innerHTML = "";
}

function openModal(el) {
    clear_modal();
    modal.style.display = 'block';
    console.log(el);
    document.getElementById("current_row").innerHTML = el.id;
    document.getElementById("modal_title").innerHTML = el.getElementsByClassName('title')[0].innerHTML;
    document.getElementById("modal_orig").innerHTML = el.getElementsByClassName('original')[0].innerHTML;
    Array.from(el.getElementsByClassName('adjusted-list')[0].getElementsByTagName("li")).forEach(function (e) {
        add_li(e.childNodes[0].data, e.getElementsByClassName("url")[0].value);
    });
    //SET AUTOC HORSEY API!!!!!!!!!!!!!!!!!!!!!!!!!!!

}

function create_li(item, url) {
    if (item == "")
        return null;
    var li = document.createElement("li");
    var text = document.createTextNode(item);
    var url_input = document.createElement("input");
    url_input.setAttribute('type', 'hidden');
    url_input.setAttribute('class', 'no-dis url');
    var row = document.getElementById('current_row').innerText.split('-');
    var name = row[0] + "[" + row[1] + "][" + (modal.getElementsByClassName("url").length).toString() + "]";
    url_input.setAttribute('name', name);
    url_input.value = url;
    li.setAttribute('class', 'modal_li');
    li.appendChild(text);
    li.appendChild(url_input);
    li.appendChild(remove_span());
    return li;
}

function remove_span() {
    var remove = document.createElement("span");
    remove.setAttribute('class', 'remove');
    remove.setAttribute('onclick', 'remove(this.parentNode)');
    remove.innerHTML = "&times;";
    return remove;
}

function add_field() {
    var input = document.getElementById("autoc_field");
    var table = document.getElementById("current_row").innerHTML.split("-")[0];
    var api = document.getElementById(table + "_api").innerHTML;
    var url = "";
    eval(api + "Var").forEach(function (row) {
        if (row.text == input.value)
            url = row.url;
    });
    add_li(input.value, url);
    input.value = "";
}

function add_li(text, url) {
    var li = create_li(text, url);
    if (li != null)
        document.getElementById("modal_adjust").appendChild(li);
}

function remove(element) {
    element.parentNode.removeChild(element);
}

function closeModal() {
    modal.style.display = 'none';
}

function modal_apply(id) {
    var row = document.getElementById(id).getElementsByClassName('adjusted-list')[0];
    var list = modal.getElementsByClassName("modal_li");
    row.innerHTML = "";
    Array.from(list).forEach(function (element) {
        var new_li = element.cloneNode(true);
        new_li.removeChild(new_li.childNodes[new_li.childNodes.length - 1]);
        row.appendChild(new_li);
    });
    closeModal();
}

function modal_apply_all() {
    var modal_orig = document.getElementById("modal_orig").getElementsByClassName("original-list")[0];
    var table = document.getElementById("current_row").innerHTML.split("-")[0];
    var rows = document.getElementById(table).getElementsByTagName("tr");
    Array.from(rows).forEach(function (row) {
        var orig = row.getElementsByClassName("original-list")[0];
        if (orig != undefined) {
            if (orig.innerHTML == modal_orig.innerHTML) {
                modal_apply(row.id);
            }
        }
    });
}


/*
function to_list(text) {
    var list = [];
    text.split(mvs).forEach(function(element) {
        var li = create_li(element);
        list.append(li);
    });
    return list;
}
*/