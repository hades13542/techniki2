//funkcja seriaizujaca obiekt
$.fn.serializeObject = function() {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

//funkcja zapisujaca rekordy w bazie
function fn_saveOrDelete() {
    //serializujemy nasz obiekt, automatycznie zbierze wszystkie inputy formularza, gdzie wartości obiektu klucz:wartość to name:value z forma
    var json_data = $("#myForm").serializeObject();
    //zamienia nasz obiekt na stringa
    json_data = JSON.stringify(json_data);
    //kodujemy znaki specjalne
    var msg = "data=" + encodeURIComponent(json_data);
    //pobieramy aktualną ściężkę
    var url = "saveRec.php"
    //parsujemy ścieżkę tak, aby odwoływała się do metody każdego kontrolera saveRec
    $('#response').html("Trwa dodawanie");
    //ukrywamy button podczas dodawania
    $(':button').hide();

    //odpala natychmiast i wysyła do kontrolera nasze dane
    $.ajax({
        type: "POST",
        url: url,
        data: msg,
    }).done(function(response) {
       location.reload(true);
    });
}

function fn_delete() {
    //serializujemy nasz obiekt, automatycznie zbierze wszystkie inputy formularza, gdzie wartości obiektu klucz:wartość to name:value z forma
    var json_data = $("#myForm").serializeObject();
    //zamienia nasz obiekt na stringa
    json_data = JSON.stringify(json_data);
    //kodujemy znaki specjalne
    var msg = "data=" + encodeURIComponent(json_data);
    //sciezka
    var url = "delRec.php"
    //parsujemy ścieżkę tak, aby odwoływała się do metody każdego kontrolera saveRec
    $('#response').html("Trwa usuwanie");
    //ukrywamy button podczas dodawania
    $(':button').hide();

    //odpala natychmiast i wysyła do kontrolera nasze dane
    $.ajax({
        type: "POST",
        url: url,
        data: msg,
    }).done(function(response) {
      alert(response);
      location.reload(true);
    });
}

