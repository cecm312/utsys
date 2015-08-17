$(function() {
    $(document).on("click", ".modal-trigger", function() {
        var modal = $(this).data("modal");
        $(modal).openModal();
    });
    $(document).on("submit", "#form_new_module", function(e) {
        e.preventDefault();
        saveModule(this);
    });
    $(document).on("submit", "#form_new_schedule", function(e) {
        e.preventDefault();
        saveSchedule(this);
    });
    
    $(document).on("change", ".schedule_params", function(e) {
       $('#calendar').fullCalendar('refetchEvents');
    });

    $('#calendar').fullCalendar({
        defaultView: 'agendaWeek',
        minTime: "06:00:00",
        maxTime: "22:00:00",
        allDaySlot: false,
        titleFormat: " ",
        allDayText: " ",
        header: {
            right: false,
            title: false,
        },
        hiddenDays: [0],
        aspectRatio: 2,
        events: function(start, end, timezone, callback) {
            var datos=$("#form_new_schedule").serializeArray();
            datos.push({name:"module",value:"schedule"});
            datos.push({name:"action",value:"getSchedule"});
            $.ajax({
                url: "index.php?",
                dataType: "json",
                data: datos,
                type: "POST",
                success: function(data) {
                    
                    var events = [];
                    $.each(data,function() {
                        console.log(this);
                        events.push({
                            title: this.title,
                            start: this.start,
                            end: this.end
                        });
                    });
                    callback(events);
                }
            });
        }
    });
});


var saveModule = function(form) {
    var form = $(form);
    var datos = form.serializeArray();
    datos.push({name: "module", value: "schedule"});
    datos.push({name: "action", value: "saveModule"});
    $.ajax({
        url: "index.php?",
        dataType: "json",
        data: datos,
        type: "POST",
        success: function(data) {
            if (data.result) {
                swal({title: "Modulo Agregado", text: "El modulo fue agregado corectamente", type: "success"}, function() {
                    var hora_inicio = form.find("#hora_inicio");
                    var hora_fin = form.find("#hora_fin");
                    var option = "<option value='" + data.idmodule + "'>" + $(hora_inicio).val() + " - " + $(hora_fin).val() + "</option>";
                    $("#select_modulo").append(option);
                    $("#select_modulo").trigger("chosen:updated");
                    form[0].reset();
                    $("#modal1").closeModal();
                });
            }
        }
    });
}

var saveSchedule = function(form) {
    var form = $(form);
    var datos = form.serializeArray();
    datos.push({name: "module", value: "schedule"});
    datos.push({name: "action", value: "saveSchedule"});
    $.ajax({
        url: "index.php?",
        dataType: "json",
        data: datos,
        type: "POST",
        success: function(data) {
            if (data.result) {
                swal({title: "Modulo Agregado", text: "El modulo fue agregado corectamente", type: "success"}, function() {
                    $('#calendar').fullCalendar('refetchEvents');
                    
                });
            }
        }
    });
}