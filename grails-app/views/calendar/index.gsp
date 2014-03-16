<!doctype html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>OnSchedule</title>
	</head>

	<body>
        <div class="row">
            
            <div class="col-md-2">
              <div id="myAffix"  data-spy="affix">
                <div class="well">
                    <ul class="nav nav-pills nav-stacked">
                        <g:each var="user" in="${users}">
                            <li id="usr" class="badge badge-important"><span class="glyphicon glyphicon-user"></span> ${user.fullName}</li>
                        </g:each>
                    </ul>
                </div>
              </div>
            </div>

            <div class="col-md-10">

                <div class="page-header">
                    <h1>Schedule</h1>
                </div>

            
                <div data-role="content">       
                    <fullcal:calendar id="cal">
                        header: {
                            left: 'prev,next today',
                            center: 'title',
                            right: 'month,agendaWeek,agendaDay'
                        },
                        editable: true,
                        droppable: true, // this allows things to be dropped onto the calendar !!!
                        columnFormat: { week: 'ddd d/M' },
                        timeFormat: 'HH:mm{ - HH:mm}',
                        drop: function(date, allDay) { // this function is called when something is dropped
                            // retrieve the dropped element's stored Event Object
                            var originalEventObject = $(this).data('eventObject');
                            
                            // we need to copy it, so that multiple events don't have a reference to the same object
                            var copiedEventObject = $.extend({}, originalEventObject);
                            
                            // assign it the date that was reported
                            copiedEventObject.start = date;
                            copiedEventObject.allDay = allDay;
                            
                            // render the event on the calendar
                            // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                            $('#cal').fullCalendar('renderEvent', copiedEventObject, true);
                            
                            // is the "remove after drop" checkbox checked?
                            if ($('#drop-remove').is(':checked')) {
                                // if so, remove the element from the "Draggable Events" list
                                $(this).remove();
                            }
                            
                        }
                    </fullcal:calendar>
                </div><!-- /content -->
            
            </div>
        </div>

        <r:script>
            $(document).ready(function() {
                $('#myAffix').affix({
                    offset: {
                      top: 50
                    }
                });

                $('#usr').each(function() {
                    alert('hi');
                    // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                    // it doesn't need to have a start or end
                    var eventObject = {
                        title: $.trim($(this).text()) // use the element's text as the event title
                    };
                    
                    // store the Event Object in the DOM element so we can get to it later
                    $(this).data('eventObject', eventObject);
                    
                    // make the event draggable using jQuery UI
                    $(this).draggable({
                        zIndex: 999,
                        revert: true,      // will cause the event to go back to its
                        revertDuration: 0  //  original position after the drag
                    });
                    
                });

            }
        </r:script>

	</body>
</html>
