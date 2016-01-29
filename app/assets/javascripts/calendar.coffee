
$ ->
  $calendar = $('#fullcalendar')
  h = $(window).innerHeight() - 50

  # new event modal
  $newEventModal = $('#newEventModal')
  onNewEventModalSave = (callback) ->
    title = $('#newEventName').val()
    callback(title)

  showNewEventModal = (start, callback) ->
    formattedDate = moment(start).format('Do MMMM, hh:mm:ss')
    $newEventModal.find('.modal-title').text('New event on ' + formattedDate)
    $newEventModal.off('shown.bs.modal').on 'shown.bs.modal', ->
      $('#newEventName').val('').focus()
    $newEventModal.off('hidden.bs.modal').on 'hidden.bs.modal', ->
      callback(false)
    $newEventModal.modal('show')

    $('#newEventModalSave').off('click').on 'click', ->
      onNewEventModalSave(callback)
      $newEventModal.modal('hide')

  # full calendar handles
  onSelect = (start, end) ->
    showNewEventModal start, (title) ->
      if title
        eventData =
          title: title
          start: start
          end: moment(start).add(1, 'hour')
        $calendar.fullCalendar('renderEvent', eventData, true)
      $calendar.fullCalendar('unselect')

  onEventClick = (calEvent, e, view) ->
    alert('Event clicked!')
    false

  $calendar.fullCalendar
    lang: "ru"
    height: h
    header: {}
    allDaySlot: false
    snapDuration: '00:15:00'
    defaultView: 'agendaDay'
    selectable: true
    selectHelper: true
    editable: true
    events: '/events.json'
    select: onSelect
    eventClick: onEventClick


