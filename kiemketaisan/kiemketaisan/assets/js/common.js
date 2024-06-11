
function load() {
    debugger;
    $('#responsive').show();
}
function loadfrmEditSussess() {
    $('#responsive').show();
}
function closedialog(){
    $("#responsive").hide();
}
function login(res) {
    debugger;
    if (res.status) {
        if (res.message != undefined) {
            $('p#notify').text(res.message);
            $('.message-box').css("background-color", "white");
            $('.message-model').show();
            $('.message-model').hide(4000);
                location.href = "/Home/Index";
        }
    } else {
        if (res.message != undefined) {
            $('p#notify').text(res.message);
            $('.message-box').css("background-color", "white");
            $('.message-model').show();
            $('.message-model').hide(4000);
        }
    }
}