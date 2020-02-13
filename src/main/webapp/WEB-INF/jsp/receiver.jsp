<!doctype html>
<html lang="en">
<head>
	<title>Receiver Details</title>
	<meta charset="utf-8">
	<meta
			content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
			name="viewport"/>
	<!--     Fonts and icons     -->
	<link
			href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
			rel="stylesheet"/>
	<link rel="stylesheet"
		  href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"/>


	<!-- Material Kit CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet"/>
	<link rel="stylesheet"
		  href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
		  integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
		  crossorigin="anonymous">
	<link rel="stylesheet"
		  href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
		  rel="stylesheet"/>
	<link
			href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css"
			rel="stylesheet"/>


</head>
<body>
<div class="wrapper">
	<jsp:include page="sidebar.jsp"></jsp:include>
	<div class="main-panel">
		<jsp:include page="navbar.jsp"></jsp:include>
		<div class="content">
			<div class="row">
				<div class="col-sm-1">
					<button type="button" class="btn btn-default btn-md"
							id="addReceiver">
						<i class="fas fa-user-plus"></i> Add Receiver
					</button>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="container-fluid table-responsive">
					<table class="table table-striped" id="receiverTable"
						   style="text-align: center">
						<thead class="thead-dark">
						<tr>
							<th scope="col" style="width:5%">#</th>
							<th scope="col" style="width:10%">First Name</th>
							<th scope="col" style="width:10%">Last Name</th>
							<th scope="col" style="width:10%">Blood Group</th>
							<th scope="col" style="width:10%">Quantity</th>
							<th scope="col" style="width:20%">Address</th>

							<th scope="col" style="width:15%">Email</th>
							<th scope="col" style="width:10%">Issue Date</th>
							<th scope="col" style="width:10%"></th>
						</tr>
						</thead>
						<tbody>

						</tbody>
					</table>
				</div>
			</div>
			<!--Add Begin Modal -->

			<div id="addReceiverModal" class="modal " tabindex="-1"
				 role="dialog">
				<div class="modal-dialog modal-md" role="document">
					<div class="modal-content">
						<form onsubmit="return addReceiver()" action="javascript:void(0)"
							  id="addReceiverDetails">
							<div class="modal-header">
								<h5 class="modal-title">Receiver Details</h5>
								<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="form-group">
									<label class="control-label"> FirstName:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="firstName"
													id="firstName" placeholder="First name" required>
								</div>
								<div class="form-group">
									<label class="control-label">LastName:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="lastName"
													id="lastName" placeholder="Last Name" required>
								</div>
								<div class="form-group">
									<label class="control-label">Blood Group:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="bloodGroup"
													id="bloodGroup" placeholder="Blood group" required/>
								</div>
								<div class="form-group">
									<label class="control-label"> Quantity (ml):<span
											style="color: red"> *</span>
									</label> <input type="number" class="form-control" name="quantity"
													id="quantity" min=10 placeholder="quantity" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Address:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="address"
													id="address" placeholder="address" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Email:<span
											style="color: red"> *</span>
									</label> <input type="email" class="form-control" name="email"
													id="email" placeholder="email" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Contact:<span
											style="color: red"> *</span>
									</label> <input type="number" class="form-control" min="10"name="contact"
													id="contact" placeholder="contact" required/>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" id="btnSave">Save</button>
								<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- End Add Modal -->
			<!--Edit Begin Modal -->
			<div id="editReceiverModal" class="modal " tabindex="-1"
				 role="dialog">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<form onsubmit="return updateReceiver()"
							  action="javascript:void(0)" id="updateReceiver">
							<div class="modal-header">
								<h5 class="modal-title">Update Receiver Details</h5>
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
								<label class="control-label"> FirstName:<span
										style="color: red"> *</span>
								</label> <input type="text" class="form-control" name="editFirstName"
												id="editFirstName" disabled placeholder="First name" required >
							</div>
								<div class="form-group">
									<label class="control-label">LastName:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="editLastName"
													id="editLastName" disabled placeholder="Last Name" required>
								</div>
								<div class="form-group">
									<label class="control-label">Blood Group:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="editBloodGroup"
													id="editBloodGroup" placeholder="Blood group" required/>
								</div>
								<div class="form-group">
									<label class="control-label"> Quantity (ml):<span
											style="color: red"> *</span>
									</label> <input type="number" class="form-control" name="editQuantity"
													id="editQuantity" min=10 placeholder="quantity" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Address:<span
											style="color: red"> *</span>
									</label> <input type="text" class="form-control" name="editAddress"
													id="editAddress" placeholder="address" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Email:<span
											style="color: red"> *</span>
									</label> <input type="email" class="form-control" name="editEmail"
													id="editEmail" placeholder="email" required/>
								</div>
								<div class="form-group">
									<label class="control-label">Contact:<span
											style="color: red"> *</span>
									</label> <input type="number" class="form-control"  min="10"  name="editContact"
													id="editContact" placeholder="contact" required/>
								</div>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-success" id="updateBtn">Update</button>
								<button type="button" class="btn btn-secondary"
										data-dismiss="modal">Close
								</button>
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
							<button type="button" class="btn btn-danger" onclick=" deleteReceiver()">Confirm</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</div>

<!--   Core JS Files   -->
<script src="/js/core/jquery.min.js"></script>
<script src="/js/core/popper.min.js"></script>
<script src="/js/core/bootstrap.min.js"></script>
<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
></script>
<script src="/js/plugins/bootstrap-notify.js"></script>
<script src="/js/plugins/moment.min.js"></script>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/paper-dashboard.js?v=2.0.0"></script>
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
<script>
	var token = '<%= session.getAttribute("token") %>';
	var receiverTab;
	$(document).ready(function () {
		$("#header").html("Receiver Details");
		$("li").removeClass("active");
		$("#receiverJsp").addClass("active");
		getAllReceiver();

	});



	function addReceiver() {
		var body = {
			"firstName": $('#firstName').val(),
			"lastName": $('#lastName').val(),
			"quantity": $("#quantity").val(),
			"bloodGroup": $("#bloodGroup").val(),
			"address": $("#address").val(),
			"email": $("#email").val(),
			"contact": $("#contact").val(),
			"organization" : null

		};
		$.ajax({
			type: 'POST',
			dataType: "json",
			contentType: "application/json",
			headers: {

				"Authorization": "Bearer " + token
			},
			url: '/receiver/save',
			data: JSON.stringify(body),
			success: function (response) {
				if (response.status == 200) {
					$('#addReceiverDetails').trigger('reset');
					$("#addReceiverModal").modal('hide');
					$.notify({
						// options
						message: 'Receiver added successfully'
					}, {
						// settings
						type: 'success',
						allow_dismiss: true,
						placement: {
							from: "top",
							align: "center"
						},
						timer: 200
					});
					getAllReceiver();
				}
			}
		});
	}

	function updateReceiver() {

		var body = {
			"firstName": $('#editFirstName').val(),
			"lastName": $('#editLastName').val(),
			"quantity": $("#editQuantity").val(),
			"bloodGroup": $("#editBloodGroup").val(),
			"address": $("#editAddress").val(),
			"email": $("#editEmail").val(),
			"contact": $("#editContact").val(),
			"organization" : null

		};
		$.ajax({
			type: 'POST',
			dataType: "json",
			contentType: "application/json",
			headers: {

				"Authorization": "Bearer " + token
			},
			url: '/receiver/save',
			data: JSON.stringify(body),
			success: function (response) {
				if (response.status == 200) {
					$('#updateReceiver').trigger('reset');
					$("#editReceiverModal").modal('hide');
					$.notify({
						// options
						message: 'Receiver updated successfully'
					}, {
						// settings
						type: 'success',
						allow_dismiss: true,
						placement: {
							from: "top",
							align: "center"
						},
						timer: 200
					});
					getAllReceiver();
				}
			}
		});

		$("#editReceiverModal").modal('hide');

	}

	function editReceiver(data) {
		console.log($(data).parent().parent());
		if ($(data).parent().parent().hasClass('rowSelected')) {
			$($(data).parent().parent()).removeClass('rowSelected');
		} else {
			receiverTab.$('tr.rowSelected').removeClass('rowSelected');
			$($(data).parent().parent()).addClass('rowSelected');
		}
		edit();
	}

	function deleteData(data) {

		if ($(data).parent().parent().hasClass('rowSelected')) {
			$($(data).parent().parent()).removeClass('rowSelected');
		} else {
			receiverTab.$('tr.rowSelected').removeClass('rowSelected');
			$($(data).parent().parent()).addClass('rowSelected');
		}
		$('#deleteModal').modal('show');
	}

	function edit() {
		var rowData = $('#receiverTable').DataTable().row(
				$('#receiverTable tbody').find(".rowSelected")).data();
		console.log(rowData);
		$("#editFirstName").val(rowData.firstName);
		$("#editLastName").val(rowData.lastName);
		$("#editBloodGroup").val(rowData.bloodGroup);
		$("#editQuantity").val(rowData.quantity);
		$("#editAddress").val(rowData.address);
		$("#editContact").val(rowData.contact);
		$("#editEmail").val(rowData.email);
		$("#id").val(rowData.id);
		$("#editReceiverModal").modal('show');
	}

	function deleteReceiver() {
		var rowData = $('#receiverTable').DataTable().row(
				$('#receiverTable tbody').find(".rowSelected")).data();
		console.log(rowData);
		$.ajax({
			type: 'DELETE',
			contentType: "application/json",
			headers: {

				"Authorization": "Bearer " + token
			},

			url: '/receiver/' + rowData.id,
			success: function (response) {
				if (response.status == 200) {
					$('#deleteModal').modal('hide');
					$.notify({
						// options
						message: 'Receiver deleted successfully'
					}, {
						// settings
						type: 'success',
						allow_dismiss: true,
						placement: {
							from: "top",
							align: "center"
						},
						timer: 200
					});
					getAllReceiver();
				}
			}
		});


	}

	$("#addReceiver").click(function () {
		$("#addReceiverModal").modal('show');
	});

	function getAllReceiver() {
		if (receiverTab != null) {
			receiverTab.destroy();
		}
		var orgId = '<%= session.getAttribute("organizationId") %>';
		receiverTab = $('#receiverTable').DataTable({
			'ajax': {
				'url': '/receiver?organizationId='+orgId,
				'type': 'GET',
				'beforeSend': function (request) {
					request.setRequestHeader("Authorization", "Bearer " + token);
				}
			},
			"columns": [
				{ "data": "id", "visible": false },
				{"data": "firstName"},
				{"data": "lastName"},
				{"data": "bloodGroup"},
				{"data": "quantity"},
				{"data": "address"},
				{"data": "email"},
				{
					"data": "issueDate",
					"render": function (data, type, row, meta) {
						return moment(data).format("YYYY-MM-DD");
					}
				},
				{
					"data": null,
					"render": function (data, type, row, meta) {
						return '<i class="fas fa-edit" style="margin-right: 10%; font-size: 18px; color: #22733d" onclick="editReceiver(this)"></i><i class="fas fa-trash-alt" style="margin-left: 10%; font-size: 18px; color: #bb3b3b" onclick="deleteData(this)"></i>';
					}
				}
			]
		});
	}
	


</script>
</body>
</html>