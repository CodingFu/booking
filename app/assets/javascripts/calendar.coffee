
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

  onEventClick = (calEvent, e, view) ->
    alert('Event clicked!')
    false

  $calendar = $('#fullcalendar')
  $calendar.fullCalendar
    header: {}
    allDaySlot: false
    firstDay: 1
    snapDuration: '00:15:00'
    defaultView: 'agendaDay'
    selectable: true
    selectHelper: true
    editable: true
    events: '/events.json'
    select: onSelect
    eventClick: onEventClick

