
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<!-- CSS Files -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->

<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>
<link
	href='https://demos.creative-tim.com/bs3/paper-dashboard/assets/css/themify-icons.css'
	rel='stylesheet' type='text/css'>
<link
	href='https://demos.creative-tim.com/bs3/paper-dashboard/assets/css/animate.min.css'
	rel='stylesheet' type='text/css'>
<link href="/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">


<title>Blood Life</title>
<style type="text/css">
.login {
	margin-top: 5%;
	background: #130101a1;
	border-radius: 40px;
	color: white;
	text-align: center;
}

.carousel-inner img {
	width: 100%;
	height: 100%;
}

.nav-item, .nav-link {
	color: black !important;
}
</style>
</head>

<body style="background: #f4f3ef">
	<div style="margin-bottom: 2.5%">
		<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
			<a class="navbar-brand" href="/index">BLOOD LIFE</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="/">Login </a></li>
					<li class="nav-item active"><a class="nav-link" href="/index">Home
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/events">Events</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/gallery">Gallery</a>
					</li>

				</ul>
			</div>
		</nav>
		<div class="container">
			<div class="row" style="margin: 1.5%">

				<select class="select2 col-sm-12" id="organizationList"
					name="organization" multiple="multiple">
				</select>

			</div>
			<div class="row" style="margin: 1.5%">

				<button class="btn btn-md btn-info" id="searchDonorBtn"
					style="float: right; margin-top: 0px">Search By Blood
					Availability</button>

			</div>
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">Requirement Details</h4>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<form action="javascript:void(0);">
							<!-- Modal body -->
							<div class="modal-body">
								<div class="form-group">
									<span class="form-label"> Blood Quantity: </span> <select
										class="col-sm-12" id="bloodList" style="width: 100%">
										<option value="A+">A+</option>
										<option value="A-">A-</option>
										<option value="B+">B+</option>
										<option value="O+">O+</option>
										<option value="O-">O-</option>
										<option value="AB+">AB+</option>
										<option value="AB-">AB-</option>
									</select>
								</div>
								<div class="form-group">
									<span class="form-label"> Blood Quantity (ml): </span> <input
										type="number" class="form-control" id="quantity" min=10
										required />
								</div>

							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="submit" id="submitBtn" class="btn btn-success">Submit</button>
								<button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-sm-6">
					<div class="card" style="background: #a94d4d; color: white">
						<div class="content">
							<div class="container">
								<div class="row">
									<div class="col-lg-3" style="padding: 3%">
										<div class="text-center">
											<i class="fas fa-ambulance" style="font-size: 72px"></i>
										</div>
									</div>
									<div class="col-lg-9" style="padding: 3%; font-size: 24px">
										<div class="numbers">
											<p>Registered Organizations</p>
											<span id="organizationCount"></span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>


				<div class="container" style="margin-top: 5%; margin-bottom: 5%">
					<h3 id="organizationTitle">Organizations</h3>
					<div class="card" id="organizationDiv"
						style="margin-bottom: 5%; display: none;">
						<div class="container-fluid"
							style="margin-bottom: 1%; margin-top: 1%">
							<div class="header">
								<h3 class="title" style="padding-top: 1%; font-family: cursive">Organization
									Name</h3>
							</div>
							<div class="content row">
								<div class="col-sm-12">
									<div class="form-group">
										<div class="form-control">
											<span class="form-label" id="contact"> Contact: </span>
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<span class="form-label" id="address"> Address: </span>
										</div>
									</div>
									<div class="form-group">
										<div class="form-control">
											<span class="form-label" id="email"> Email: </span>
										</div>
									</div>
								</div>
								<div class="container-fluid">
									<div id="googleMap" style="width: 100%; height: 300px;"></div>
								</div>
							</div>
							<div class="footer">
								<hr>

							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>
	<!-- Footer -->
	<footer class="page-footer font-small blue"
		style="background: #f8f9fa !important; position: fixed; width: 100%; bottom: 0; height: 5%">

		<div class="footer-copyright  py-3" style="padding-left:5%;padding-right:5%">
			About Us &nbsp;&nbsp; Contact  Us &nbsp;&nbsp; <span class="fab fa-twitter-square"> &nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span class="fab fa-facebook-square"></span>
			<span style="float:right"> 2018 Copyright</span></div>
	</footer>

	<script src="/js/core/jquery.min.js"></script>
	<script src="/js/core/popper.min.js"></script>
	<script src="/js/core/bootstrap.min.js"></script>
	<script src="/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<script src="/js/plugins/bootstrap-notify.js"></script>
	<script src="/js/paper-dashboard.min.js?v=2.0.0" type="text/javascript"></script>
	<script src="./demo/demo.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAgr94q-qXSYGSO-NdpvvrImA_ln0uVcs"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>
	<script type="text/javascript">
		var token = '<%= session.getAttribute("token") %>';
		var organizationCount;
	var markersList = [];
	var organizationData = [];
	$(document).ready(function() {
		$('#organizationList').select2({
			placeholder : "Select Organization"
		});
		getAllOrganizations();
		$('#bloodList').select2({
			placeholder : "Select blood group"
		});
		$("#organizationTitle").hide();
		$('#organizationCount').html(organizationCount);
	});

	$("#organizationList")
			.change(
					function() {
						console.log($("#organizationList").val().length);
						var organizationList = $('#organizationList').select2('data');
						$("#organizationDiv").siblings().not("h3").remove();
						$("#organizationTitle").hide();
						if ($("#organizationList").val().length == 0) {
							$.notify({
								// options
								message : 'Select the organization'
							}, {
								// settings
								type : 'danger',
								allow_dismiss : true,
								placement : {
									from : "top",
									align : "center"
								},
								timer : 200
							});

						} else {
							for (var i = 0; i < $("#organizationList").val().length; i++) {
								$("#organizationTitle").show();
								$("#organizationDiv").clone().insertAfter(
										"#organizationDiv").attr("id",
										"organization" + i);
								$("#organization" + i).css("display", "block");
								$("#organization" + i).find(".title").html(
										organizationList[i].text);
								$("#organization" + i).find("#contact").html(
										"organization " + i
												+ " : contact Number");
								$("#organization" + i).find("#address").html(
										"address " + i + " : address Number");
								$("#organization" + i).find("#email").html(
										"email " + i + " : email Number");
								$("#organization" + i).find("#googleMap").attr(
										"id", "googleMap" + i);
								$("#organization" + i).find("#contact").html("contact : " + organizationData[i].contact);
								$("#organization" + i).find("#address").html("address : " + organizationData[i].address);
								$("#organization" + i).find("#email").html("email : " + organizationData[i].email);
								loadMap(organizationData[i].latitude,organizationData[i].longitude ,i,organizationData[i]);
							}
						}
					});

	$("#searchDonorBtn").click(function() {
		$("#myModal").find('form').trigger('reset');
		$('#myModal').modal({
			show : true
		});
	})

	function loadMap(latitude, longitude, index, organization) {
		markersList = [];
		var pre_infoWindow = false;
		var latlng = new google.maps.LatLng(latitude,
				longitude);

		var mapProp = {
			center : latlng,
			zoom : 13
		};
		var map = new google.maps.Map(document.getElementById("googleMap"
				+ index), mapProp);
		var latlong = new google.maps.LatLng(latitude,
				longitude);
		var infowindow = new google.maps.InfoWindow(
				{
					content : "<table><tr><th>Contact : </th><td>"
							+ organization.contact
							+ "</td></tr>"
							+ "<tr><th>Address :</th><td>"
							+ organization.address
							+ "</td></tr>"
							+ "<tr><th>Email :</th><td>"
							+ organization.email + "</td></tr>" + "</table>",

					maxWidth : 400
				});
		var marker = new google.maps.Marker({
			position : latlong,
			map : map
		});
		marker.addListener('click', function() {
			if (pre_infoWindow) {
				pre_infoWindow.close();
			}
			pre_infoWindow = infowindow;
			infowindow.open(map, marker);
		});
		marker.setMap(map);
		$("#googleMap" + index).show();
	}

		function  getAllOrganizations() {
			$.ajax({
				type: 'GET',
				contentType: "application/json",
				headers: {

					"Authorization": "Bearer " + token
				},
				async:false,
				url: '/getAllOrganization',
				success: function (response) {
					if(response.status == 200){
						var options = "";
						organizationCount = response.data.length;
						for (var i = 0; i < response.data.length ; i++) {
							options += '<option value='+response.data[i].id;
							options += '>'+response.data[i].organizationName;
							options += '</option>';
							organizationData.push(response.data[i]);
						}
						$('#organizationList').append(options);
					}
				}
			});

		}

		$('#submitBtn').click(function(){
			$.ajax({
				type: 'GET',
				contentType: "application/json",
				headers: {

					"Authorization": "Bearer " + token
				},

				url: '/getOrganizationByBloodQuatity?bloodGroup='+$('#bloodList :selected').val()+ "&quantity="+$('#quantity').val(),
				success: function (response) {
					if(response.status == 200){
						$("#organizationDiv").siblings().not("h3").remove();
						$("#organizationTitle").hide();
						var organizationData = response.data;
						for (var i = 0; i < organizationData.length; i++) {
							$("#organizationTitle").show();
							$("#organizationDiv").clone().insertAfter(
									"#organizationDiv").attr("id",
									"organization" + i);
							$("#organization" + i).css("display", "block");
							$("#organization" + i).find(".title").html(
									organizationData[i].organizationName);
							$("#organization" + i).find("#contact").html(
									"organization " + i
									+ " : contact Number");
							$("#organization" + i).find("#address").html(
									"address " + i + " : address Number");
							$("#organization" + i).find("#email").html(
									"email " + i + " : email Number");
							$("#organization" + i).find("#googleMap").attr(
									"id", "googleMap" + i);
							$("#organization" + i).find("#contact").html("contact : " + organizationData[i].contact);
							$("#organization" + i).find("#address").html("address : " + organizationData[i].address);
							$("#organization" + i).find("#email").html("email : " + organizationData[i].email);
							loadMap(organizationData[i].latitude,organizationData[i].longitude ,i,organizationData[i]);
						}
						$('#myModal').modal('hide');
					}
				}
			});
		})
</script>
</body>
</html>
