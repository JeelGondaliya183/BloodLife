<!doctype html>
<html lang="en">
<head>
<title>Event Details</title>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />


<!-- Material Kit CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet" />
	<link
			href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css"
			rel="stylesheet" />
<style>
.rowSelected {
	
}
</style>

</head>
<body>
	<div class="wrapper">
		<jsp:include page="sidebar.jsp" ></jsp:include>
		<div class="main-panel">
			<jsp:include page="navbar.jsp" ></jsp:include>
			<div class="content">
				<div class="row">
					<div class="col-sm-1">
						<button type="button" class="btn btn-default btn-md"
							id="addEvent">
							<i class="fas fa-user-plus"></i> Add Events
						</button>
					</div>
				</div>
				<hr>
				<div class="row">
					<div class="container-fluid table-responsive">
						<table class="table table-striped" id="eventTable"
							style="text-align: center">
							<thead class="thead-dark">
								<tr>
									<th scope="col" style="width:5%">#</th>
									<th scope="col" style="width:20%">Event Name</th>
									<th scope="col" style="width:20%">Event Description</th>
									<th scope="col" style="width:15%">Address</th>
									<th scope="col" style="width:10%">Contact Number</th>
									<th scope="col" style="width:10%">Event Time</th>
									<th scope="col" style="width:10%">Event Created</th>
									<th scope="col" style="width:10%"></th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
				</div>
				<!--Add Begin Modal -->

				<div id="addEventModal" class="modal " tabindex="-1" role="dialog">
					<div class="modal-dialog modal-md" role="document">
						<div class="modal-content">
							<form action="javascript:void(0)" id="addDonorDetails" onsubmit="return addedEvent()" >
								<div class="modal-header">
									<h5 class="modal-title">Add Events</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div class="form-group">
										<label class="control-label"> Event Name:<span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control" name="eventName"
											id="eventName" placeholder="Event Name" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Event Description:<span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control"
											name="eventDescription" id="eventDescription"
											placeholder="Event Description" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Address:<span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control" name="address"
											id="address" placeholder="Address" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Contact Number: <span
											style="color: red"> *</span>
										</label> <input type="number" class="form-control" min=10 name=contactNumber
											id="contactNumber" placeholder="Contact Number" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Event Date: <span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control" name=eventDate
											id="eventDate" placeholder="Event Date" required>
									</div>
									<!-- <div class="form-group">
										<label class="control-label"> Event time: <span
											style="color: red"> *</span>
										</label> <input type="time" class="form-control" name=timestamp
											id="timestamp" placeholder="Time" required>
									</div> -->

								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-success" id="btnAdd">add</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				
				
				<!-- End Add Modal -->
				<!--Edit Begin Modal -->
				<div id="editEventModal" class="modal " tabindex="-1"
					role="dialog">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<form onsubmit="return updateEvent()"
								action="javascript:void(0)" id="updateEvent">
								<div class="modal-header">
									<h5 class="modal-title">Update Event Details</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<div style="display: none">
										<input id="id" type="text"/>
									</div>
									<div class="form-group">
										<label class="control-label"> Event Name:<span
												style="color: red"> *</span>
										</label> <input  class="form-control col-md-12" style="width: 100%" name="editEventName"
														  id="editEventName" placeholder="Event Name" required/>
									</div>
									<div class="form-group">
										<label class="control-label">Event Description:<span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control" id="editEventDescription"
											placeholder="Event Description" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Address:<span
											style="color: red"> *</span>
										</label> <input type="text" class="form-control" id="editAddress"
											placeholder="Address" required>
									</div>
									<div class="form-group">
										<label class="control-label"> Contact Number:<span
											style="color: red"> *</span>
										</label> <input type="number" class="form-control" min="10" id="editContactNumber"
											placeholder="Contact Number" required>
									</div>
									 <div class="form-group">
										<label class="control-label"> Date:<span
											style="color: red"> *</span>
										</label> <input type="date" class="form-control" id="editDate"
											placeholder="Date" required>
									</div>
									<!-- <div class="form-group">
										<label class="control-label"> Time:<span
											style="color: red"> *</span>
										</label> <input type="time" class="form-control" id="editTime"
											placeholder="Time" required>
									</div> -->
								</div>
								<div class="modal-footer">
									<button type="submit" class="btn btn-success" id="updateBtn">Update</button>
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<!-- End Edit Modal -->
				<div class="modal" id="deleteModal" tabindex="-1" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title"> Confirm Delete</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<p>Are you sure you want to delete?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" onclick=" deleteEvent()">Confirm</button>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="footer.jsp" ></jsp:include>
		</div>
	</div>

	<!--   Core JS Files   -->
	<script src="/js/core/jquery.min.js" ></script>
	<script src="/js/core/popper.min.js" ></script>
	<script src="/js/core/bootstrap.min.js" ></script>
	<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
		></script>
	<script src="/js/plugins/bootstrap-notify.js"></script>
	<script src="/js/plugins/moment.min.js"></script>
	<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/js/paper-dashboard.js?v=2.0.0" ></script>
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
	<script>
		var table;
		$(document).ready(function() {
			$("#header").html("Event Details");
			$("li").removeClass("active");
			$("#eventsJsp").addClass("active");
			getAllEvents();
			$('#userId').select2();
			$('#eventDate').datepicker({
				startDate : new Date()

			});
		});


		
		$('#addEvent').click(function() {
			$('#addEventModal').modal('show');
		});

		function addedEvent() {
			var date = new Date($('#eventDate').val());
			var body = {"eventName" : $('#eventName').val(),"eventDescription" : $('#eventDescription').val(),"contactNumber" : $('#contactNumber').val(),"address" : $('#address').val(),"eventDate" :date.getTime()};
			
			$.ajax({
				type : 'POST',
				dataType :"json",
				contentType:"application/json",
				url : '/saveEvent',
				data : JSON.stringify(body),
				success : function(data) {
					$('#addEventModal').modal('hide');
					$.notify({
						// options
						message : 'Event added successfully'
					}, {
						// settings
						type : 'success',
						allow_dismiss : true,
						placement : {
							from : "top",
							align : "center"
						},
						timer : 200
					});
					getAllEvents() ;
				}
			});
		}


		function updateEvent() {

			var body = {"eventId" : $('#id').val(),"eventName" : $('#editEventName').val(),"eventDescription" : $('#editEventDescription').val(),"contactNumber" : $('#editContactNumber').val(),"address" : $('#editAddress').val(),"eventDate" : $('#editDate').val()}
			
			$.ajax({
				type: 'POST',
				dataType:"json",
				contentType: "application/json",
				url: '/saveEvent',
				data: JSON.stringify(body),
				success: function (response) {
					if(response.status == 200){
						$('#updateEvent').trigger('reset');
						$("#editEventModal").modal('hide');
						$.notify({
							// options
							message : 'Event updated successfully'
						}, {
							// settings
							type : 'success',
							allow_dismiss : true,
							placement : {
								from : "top",
								align : "center"
							},
							timer : 200
						});
						getAllEvents();
						$('#addDonorDetails').trigger("reset");

					}
				}
			});

			$("#editEventModal").modal('hide');

		}

		function editDonor(data) {
			if ($(data).parent().parent().hasClass('rowSelected')) {
				$(data).parent().parent().removeClass('rowSelected');
			} else
			{
				table.$('tr.rowSelected').removeClass('rowSelected');
				$(data).parent().parent().addClass('rowSelected');
			}
			edit();
		}

		function deleteData(data) {
			if ($(data).parent().parent().hasClass('rowSelected')) {
				$(data).parent().parent().removeClass('rowSelected');
			} else
			{
				table.$('tr.rowSelected').removeClass('rowSelected');
				$(data).parent().parent().addClass('rowSelected');
			}
			$('#deleteModal').modal('show');

		}

		function edit() {
			var rowData = $('#eventTable').DataTable().row(
					$('#eventTable tbody').find(".rowSelected")).data();
			console.log(rowData);
			$("#id").val(rowData.eventId);
			$("#editEventName").val(rowData.eventName);
			$("#editEventDescription").val(rowData.eventDescription);
			$("#editAddress").val(rowData.address);
			$("#editDate").val(rowData.eventDate);
			$("#editContactNumber").val(rowData.contactNumber);
			$("#editEventModal").modal('show');
		}

		function deleteEvent() {
			var rowData = $('#eventTable').DataTable().row(
					$('#eventTable tbody').find(".rowSelected")).data();
			console.log(rowData);
			$.ajax({
				type: 'GET',
				contentType: "application/json",
				url: '/deleteEvent/'+rowData.eventId,
				success: function (response) {
					if(response.status == 200){
						$('#deleteModal').modal('hide');
						$.notify({
							// options
							message : 'Event deleted successfully'
						}, {
							// settings
							type : 'success',
							allow_dismiss : true,
							placement : {
								from : "top",
								align : "center"
							},
							timer : 200
						});
						getAllEvents();
					}
				}
			});


		}


		function getAllEvents() {
			if(table != null){
				table.destroy();
			}
			table = $('#eventTable').DataTable( {
				"ajax": "/getAllEvents",
				"columns": [
					{ "data": "eventId", "visible" : false },
					{ "data": "eventName" },
					{ "data": "eventDescription" },
					{ "data": "address" },
					{ "data": "contactNumber" },
					{ "data": "eventDate" ,
						"render": function ( data, type, row, meta ) {

							return moment(data).format("YYYY-MM-DD"); ;
						}
					},
					{ "data": "expiryDate",
						"render": function ( data, type, row, meta ) {

							return moment(data).format("YYYY-MM-DD"); ;
						}
					},
					{ "data": null,
						"render": function ( data, type, row, meta ) {
							return '<i class="fas fa-edit" style="margin-right: 10%; font-size: 18px; color: #22733d" onclick="editDonor(this)"></i><i class="fas fa-trash-alt" style="margin-left: 10%; font-size: 18px; color: #bb3b3b" onclick="deleteData(this)"></i>' ;
						}
					}
				]
			} );
		}

	</script>
</body>
</html>