<!DOCTYPE html>
<html lang="en">
<head>
<title>Events</title>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/css/select2.min.css"
	rel="stylesheet" />
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<style>
.nav-item {
	padding-right: 10%
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
		<a class="navbar-brand" href="#">BLOOD LIFE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarCollapse" aria-controls="navbarCollapse"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarCollapse">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link " href="/">Login</a></li>
				<li class="nav-item"><a class="nav-link" href="/index">Home</a>
				</li>
				<li class="nav-item "><a class="nav-link active" href="/events">Events</a>
				</li>
				<li class="nav-item"><a class="nav-link " href="/gallery">Gallery</a>
				</li>

			</ul>
		</div>
	</nav>
	<div class="row" style="margin-top: 5%;">
		<div class="container">
			<h2 class="title" style="padding-top: 1%;font-family: serif;text-transform: capitalize">Upcoming Events
				</h2>
			<hr>
			<div class="card" id="organizationDiv" style="margin-bottom: 5%;display: none">
				<div class="container-fluid"
					style="margin-bottom: 1%; margin-top: 1%">
					<div class="header">
						<h3 class="title" style="padding-top: 1%;font-family: serif;text-transform: capitalize">Event
							Name</h3>
					</div>
					<div class="content row">
						<div class="col-sm-8">
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
									<span class="form-label" id="email"> Description: </span>
								</div>
							</div>
						</div>
<%--						<div class="col-sm-4">--%>
<%--							<img--%>
<%--								src="https://static.meraevents.com/content/gallery/109010/14445991_1079817365472520_5637130704403341559_n1475680184.jpg"--%>
<%--								title="will be replaced by organization logo"--%>
<%--								style="width: 320px; height: 150px">--%>
<%--						</div>--%>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row"></div>
	<footer class="page-footer font-small blue"
		style="background: #f8f9fa !important; position: fixed; width: 100%; bottom: 0; height: 5%">

		<div class="footer-copyright  py-3" style="padding-left:5%;padding-right:5%">
			About Us &nbsp;&nbsp; Contact  Us &nbsp;&nbsp; <span class="fab fa-twitter-square"> &nbsp;&nbsp;&nbsp;&nbsp;</span>
							<span class="fab fa-facebook-square"></span>
			<span style="float:right"> � 2018 Copyright</span></div>
	</footer>


	<script src="/js/core/jquery.min.js" ></script>
	<script src="/js/core/popper.min.js" ></script>
	<script src="/js/core/bootstrap.min.js" ></script>
	<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
		></script>
	<script src="/js/plugins/bootstrap-notify.js"></script>
	<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/js/paper-dashboard.js?v=2.0.0" ></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.7/js/select2.min.js"></script>

	<script>
		$(document).ready(
				function() {
					getEvents();


				});

		function getEvents() {
			$.ajax({
				type: 'GET',
				contentType: "application/json",
				url: '/getAllUpComingEvents',
				success: function (response) {
					if (response.status == 200) {

						console.log(response.data);


						for (var i = 0; i < response.data.length; i++) {
							$("#organizationTitle").show();
							$("#organizationDiv").clone().insertAfter(
									"#organizationDiv").attr("id",
									"organization" + i);
							$("#organization" + i).css("display", "block");
							$("#organization" + i).find(".title").html( response.data[i].eventName);
							$("#organization" + i).find("#contact").html(
									"organization : " + response.data[i].orgName+"");
							$("#organization" + i).find("#address").html(
									"address : " +  response.data[i].address+"");
							$("#organization" + i).find("#email").html(
									"Event Date : " +  response.data[i].eventDate+"");
							$("#organization" + i).find("#googleMap").attr("id",
									"googleMap" + i);

						}
					}
				}
			});
		}
	</Script>
</body>
</html>
