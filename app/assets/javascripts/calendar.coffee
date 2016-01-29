
$ ->
  onSelect = (start, end) ->
    title = prompt('Event title')
    if title
      eventData =
        title: title
        start: start
        end: end
      $calendar.fullCalendar('renderEvent', eventData, true)
    $calendar.fullCalendar('unselect')

  $calendar = $('#fullcalendar')
  $calendar.fullCalendar
    header: {}
    firstDay: 1
    slotDuration: '00:15:00'
    defaultView: 'agendaDay'
    selectable: true
    selectHelper: true
    editable: true
    select: onSelect
    events: '/events.json'
