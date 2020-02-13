
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />

<link rel="apple-touch-icon" sizes="76x76"
	href="../assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="../assets/img/favicon.png">

<title>Dashboard</title>

<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="/demo/demo.css" rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
<link href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"
	rel="stylesheet" />
<style>
.box:hover {
	box-shadow: 3px 3px 20px #000000;
}

.on{
	color : green;
}


#card3:hover {
	box-shadow: 3px 3px 20px #000000;
}

.card_img {
	height: 250px;
}

.text {
	color: #bd2a2a
}
</style>

<script>
	
	//this short scripts checks if the session exists, if it doesn't exists then login page is opened
	var flag = '<%=session.getAttribute("role") == null%>';
	
	 if(flag.toLowerCase()== 'true'){
		window.location.href="/";

	}
	 //if the user is a donor then the user is redirected to update profile page.
	 else if(flag.toLowerCase()== 'false'){
		var role='<%= session.getAttribute("role")%>'
		if(role ==="donor"){
		window.location.href="/updateProfile";
		
		}
	
	}
 </script>
</head>
<body >
	<div class="wrapper ">
	<jsp:include page="sidebar.jsp"></jsp:include>
		<div class="main-panel">
			<!-- Navbar -->
			<jsp:include page="navbar.jsp"></jsp:include>

			<!-- End Navbar -->
			<div class="content">
				<div class="row" style="margin-bottom: 2%;margin-left: 2%">
					<i class="fa fa-refresh rotate" aria-hidden="true" style="font-size: 18px;float: right ; cursor: pointer" id="autoRefresh"> Auto Refresh</i>

				</div>
				<div class="row">
					<div class="col-lg-3 col-sm-6 mb-3">
						<div id="card1" class="card ">
							<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
							<div class="card-img-top card_img"
								style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038772-stock-photo-a-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
							<div class="card-body">

								<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countA" ></p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 mb-3">
						<div id="card2" class="card ">
							<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
							<div class="card-img-top card_img"
								style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038792-stock-photo-a-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;">
							</div>
							<div class="card-body">
								<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countA-"></p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 mb-3">
						<div id="card3" class="card">
							<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
							<div class="card-img-top card_img"
								style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038856-stock-photo-b-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
							<div class="card-body">

								<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countB"></p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 mb-3">
						<div id="card4" class="card">
							<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
							<div class="card-img-top card_img"
								style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038868-stock-photo-b-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
							<div class="card-body">

								<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countB-"></p>
							</div>
						</div>
					</div>
					<div class="col-lg-3 col-sm-6 mb-3">
						<div id="card5" class="card">
							<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
							<div class="card-img-top card_img"
								style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038882-stock-photo-o-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
								<div class="card-body">

									<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countO"></p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 mb-3">
							<div id="card6" class="card">
								<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
								<div class="card-img-top card_img"
									style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038906-stock-photo-o-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
								<div class="card-body">

									<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countO-"></p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 mb-3">
							<div id="card7" class="card">
								<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
								<div class="card-img-top card_img"
									style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038822-stock-photo-ab-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
								<div class="card-body">

									<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countAB"></p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-sm-6 mb-3">
							<div id="card9" class="card">
								<!-- The below image has been taken from https://unsplash.com/ (look for reference number [4] under Landing page in ReadMe file)-->
								<div class="card-img-top card_img"
									style="background: linear-gradient(rgba(0, 0, 0, .2), rgba(0, 0, 0, .2)), url('https://st2.depositphotos.com/3097757/11803/i/950/depositphotos_118038840-stock-photo-ab-blood-type-on-red.jpg'); background-position: center; background-repeat: no-repeat; background-size: cover; border-radius: 10px;"></div>
								<div class="card-body">

									<p class="card-text" style="font-size: 24px; font-weight: 700;" id="countAB-"></p>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card box">
								<div class="header" style="padding: 1%; margin: 0px">
									<h4>
										Recent Donors <i class="fas fa-sync"
											style="float: right; padding: 2%; cursor: pointer"></i>
									</h4>
									<p class="categories">5 Recent donors</p>
									<hr>
								</div>
								<div class="content">
									<div class="container table-responsive">
										<table class="table table-striped" id="donorTable" style="text-align: center">
											<thead class="thead-dark">
												<tr>
													<th scope="col">First Name</th>
													<th scope="col">Last Name</th>
													<th scope="col">Blood Group</th>
													<th scope="col">Quantity</th>
													<th scope="col">Contact Number</th>
<%--													<th scope="col">Date</th>--%>
												</tr>
											</thead>
											<tbody>

											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="card box">
								<div class="header" style="padding: 1%; margin: 0px">
									<h4>
										Recent Receivers <i class="fas fa-sync"
											style="float: right; padding: 2%; cursor: pointer"></i>
									</h4>
									<p class="categories">5 Recent Receivers</p>
									<hr>
								</div>
								<div class="content">
									<div class="container table-responsive">
										<table class="table table-striped" id="receiverTable" style="text-align: center">
											<thead class="thead-dark">
												<tr>

													<th scope="col">First Name</th>
													<th scope="col">Last Name</th>
													<th scope="col">Blood Group</th>
													<th scope="col">Quantity</th>
													<th scope="col">Contact Number</th>

												</tr>
											</thead>
											<tbody>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="row"></div>
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>


		<script src="/js/core/jquery.min.js"></script>
		<script src="/js/core/popper.min.js"></script>
		<script src="/js/core/bootstrap.min.js"></script>
		<script src="/js/plugins/perfect-scrollbar.jquery.min.js"></script>
		<script src="/js/plugins/bootstrap-notify.js"></script>
		<script src="/js/paper-dashboard.min.js?v=2.0.0"></script>
		<script src="/demo/demo.js"></script>
		<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>


		<script>
			var token = '<%= session.getAttribute("token") %>';
			var autoRefresh = false;
			var donorTable;
			var receiverTable;
			var bgBelowThreshold = [] ;
			var thresholdA = false;
			var thresholdB = false;
			var thresholdO = false;
			var thresholdAB =false;
			var thresholdA_ = false;
			var thresholdB_ = false;
			var thresholdAB_ =false;
			var thresholdO_ = false;




			$(document).ready(function() {
				$("#header").html("Dashboard");
				$("li").removeClass("active");
				$("#dashboard").addClass("active");
				// var doctorTable = $('#doctorTable').DataTable({
				// 	scrollY : '50vh',
				// 	scrollCollapse : true,
				// 	"paging" : false
				// });
				// var donorTable = $('#donorTable').DataTable({
				// 	"paging" : false
				// });


				getRecentDonations();
				getRecentReceivers();
				getCounts();
			});


			function getCounts(){
				$.ajax({
					type: 'GET',
					contentType: "application/json",
					headers: {
						"Authorization": "Bearer " + token
					},
					async : false,
					url: '/dashboard/getCount',
					success: function (response) {
						if (response.status == 200) {
							bgBelowThreshold = '<%= session.getAttribute("threshold") %>';
							$.each( response.data, function( key, value ) {
								if(value.blood.bloodGroup.indexOf("+") >= 0 ){
									var id = value.blood.bloodGroup.slice(0,-1);
									$('#count'+ id).html(value.quantity + " ml");
									console.log(value.quantity);
									if(value.quantity < 700){
										setInterval(function() {
											$('#count'+id).closest('.card').fadeOut(1000);
											$('#count'+id).closest('.card').fadeIn(1000);
										}, 1500);
									}


								}else{
									$('#count'+ value.blood.bloodGroup).html(value.quantity + " ml");
									if(value.quantity < 700){
										setInterval(function() {
											$('#count'+ value.blood.bloodGroup).closest('.card').fadeOut(1000);
											$('#count'+ value.blood.bloodGroup).closest('.card').fadeIn(1000);
										}, 1500);
									}
								}
							});
						}
					}
				});
			}

		$('#autoRefresh').click(function(){
			if($(this).hasClass('on')){
				$(this).removeClass('on');
				autoRefresh = false;
				refreshBloodCount()
			}else {
				$(this).addClass('on');
				autoRefresh = true;
				refreshBloodCount()
			}
		});

			function refreshBloodCount(){
				setInterval(function() {
					if(autoRefresh){
						$('#autoRefresh').fadeOut(500);
						$('#autoRefresh').fadeIn(500);
						getCounts();
					}
				}, 5000);
			}
			
			function getRecentDonations() {
				if (donorTable != null) {
					donorTable.destroy();
				}
				donorTable = $('#donorTable').DataTable({
					'ajax': {
						'url': '/dashboard/recentDonations',
						'type': 'GET',
						'beforeSend': function (request) {
							request.setRequestHeader("Authorization", "Bearer " + token);
						}
					},
					"lengthChange": false,
					"paging": false,
					"columns": [

						{"data": "user.firstName"},
						{"data": "user.lastName"},
						{"data": "bloodGroup"},
						{"data": "quantity"},
						{"data": "user.phone_number"}
					]
				});
			}


			function getRecentReceivers() {
				if (donorTable != null) {
					donorTable.destroy();
				}
				donorTable = $('#receiverTable').DataTable({
					'ajax': {
						'url': '/dashboard/recentReceivers',
						'type': 'GET',
						async :false,
						'beforeSend': function (request) {
							request.setRequestHeader("Authorization", "Bearer " + token);
						}
					},
					"lengthChange": false,
					"paging": false,
					"columns": [

						{"data": "firstName"},
						{"data": "lastName"},
						{"data": "bloodGroup"},
						{"data": "quantity"},
						{"data": "contact"}
					]
				});
			}
		</script>
</body>
</html>