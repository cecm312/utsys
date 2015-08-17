$(function () {
    $('#calendar').fullCalendar({
        defaultView: 'agendaWeek',
        minTime: "06:00:00",
        maxTime: "22:00:00",
        allDaySlot: false,
        titleFormat: " ",
        allDayText: " ",
        header: {
            right: false,
            title:false,
        },
        hiddenDays: [0],
        aspectRatio:2,
        events: [
            {
                title: 'event2',
                start: '2015-08-17T12:50:00',
                end: '2015-08-17T13:50:00'
            }
        ]
    });
});