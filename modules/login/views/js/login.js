$(function () {
    $(document).on("submit", "form.loginUser", function (e) {
        e.preventDefault();
        login(this);
    });
});

var login = function (selector) {
    var form = $(selector);
    var datos=form.serializeArray();
    datos.push({name:"module",value:"login"});
    datos.push({name:"action",value:"checkUser"});
    $.ajax({
        url: "index.php?",
        dataType: "json",
        async: false,
        data: datos,
        type: "POST",
        success: function (data) {
            console.log(data);
            if(data.valido){
                location.reload();
            }else{
                form[0].reset();
                $(".loginMessage").html(data.mensaje);
            }
            
        }
    });
};