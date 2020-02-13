<!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="/demo/login.css" rel="stylesheet" />
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
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link active" href="/">Login
				</a></li>
				<li class="nav-item "><a class="nav-link" href="/index">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/events">Events</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/gallery">Gallery</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/FAQ">FAQ</a>
				</li>

			</ul>
		</div>
	</nav>
	<div class="wrap">

		<div class="card">
			<div class="container-fluid">
				<div class="row no-gutter">
					<div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
					<div class="col-md-8 col-lg-6">
						<div class="login d-flex align-items-center py-5">
							<div class="container">
								<div class="row center">
									<div class="col-md-9 col-lg-8 mx-auto ">
										<h3 class="login-heading mb-4">Welcome back!</h3>

										<form onsubmit="return login()" action="javascript:void(0)">
											<div class="form-label-group">
												<input type="email" id="inputEmail" class="form-control"
													placeholder="Email address" required autofocus> <label
													for="inputEmail">Email address</label>
											</div>

											<div class="form-label-group">
												<input type="password" id="inputPassword"
													class="form-control" placeholder="Password" required>
												<label for="inputPassword">Password</label>
											</div>
											<span class="col-md-3" id="display_msg" style="font-size: 18px; color: #c33131; display: none;">Invalid username or password</span>
											<button
												class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
												type="submit" style="margin-top: 5%;">Sign in</button>
											<button
												class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
												type="button" id="signUp">Sign up</button>
											<div class="text-center">
												<a class="small" href="#" onClick='forgotPass()'
													id="forgotPass">Forgot password?</a>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<div id="referFriendModal" class="modal " tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<form onsubmit="return referFriend()" action="javascript:void(0)"
					  id="referFriendForm">
					<div class="modal-header">
						<h5 class="modal-title">Refer Friend</h5>
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label"> Refer Friend: <span
									style="color: red"> *</span>
							</label> <input type="text" class="form-control" name="email"
											id="referEmail" placeholder="Friend's Email" required>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" id="btnReferFriend">Send Email
							</button>
						<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div id="signUpModal" class="modal " tabindex="-1" role="dialog">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<form onsubmit="return SignUpDone()" action="javascript:void(0)"
					id="signUpDetails">
					<div class="modal-header">
						<h5 class="modal-title">Sign Up</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label"> First Name:<span
								style="color: red"> *</span>
							</label> <input type="text" class="form-control" name="firstName"
								id="firstName" placeholder="firstname" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Last Name:<span
								style="color: red"> *</span>
							</label> <input type="text" class="form-control" name="lastName"
								id="lastName" placeholder="lastName" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Blood Group:<span
								style="color: red"> *</span>
							</label> <select class="col-sm-12 form-control" id="bloodList"
								style="width: 100%">
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
							<label class="control-label"> Email:<span
								style="color: red"> *</span>
							</label> <input type="email" class="form-control" name="contact"
								id="contact" placeholder="contact" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Password:<span
								style="color: red"> *</span>
							</label> <input type="password" class="form-control" name="passwordSignUp"
								id="passwordSignUp" placeholder="password" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Age: <span
								style="color: red"> *</span>
							</label> <input type="number" class="form-control" name="age" id="age"
								placeholder="age" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Phone Number: <span
								style="color: red"> *</span>
							</label> <input type="number" class="form-control" name="phone_number" id="phone_number"
								placeholder="Phone Number" required>
						</div>
						<div class="form-group">
							<label class="control-label"> Gender: <span
								style="color: red"> *</span>
							</label> <select class="col-sm-12 form-control" id="gender"
								style="width: 100%">
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" id="btnSave">Sign
							up</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Forgot password modal -->
	<div id="forgotPasswordModal" class="modal " tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-md" role="document">
			<div class="modal-content">
				<form onsubmit="return forgotPassDone()" action="javascript:void(0)"
					id="forgetPasswordForm">
					<div class="modal-header">
						<h5 class="modal-title">Forgot Password?</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label class="control-label"> Email<span
								style="color: red"> *</span>
							</label> <input type="email" class="form-control" name="email"
								id="emailVerify" placeholder="Email" required>
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success" id="btnSubmit">Submit</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script src="/js/core/jquery.min.js"></script>
	<script src="/js/core/popper.min.js"></script>
	<script src="/js/core/bootstrap.min.js"></script>
	<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
		></script>
	<script src="/js/plugins/bootstrap-notify.js"></script>
	<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/js/paper-dashboard.js?v=2.0.0"></script>
	<script>
	
		function login(){

			var email = $('#inputEmail').val();
			var password = $('#inputPassword').val();

			var body = '{';
			body += '"email": "'+ email +'"';
			body += ',"password":"'+password+'"';
			body += '}';

			$.ajax({
				type: "POST",
				url: "/token?username="+email+"&password="+password,
				dataType:"json",
				contentType: "application/json",
				async:false,
				success: function (response) {
					if(response.status==200) {
						$.ajax({
							type: "POST",
							url: "/userCheck",
							data : body,
							dataType:"json",
							async:false,
							contentType: "application/json",
							success: function (response) {
								var role = '<%= session.getAttribute("role") %>';
								console.log(response.role);
							  if(response.status==200) {
							  	if(response.role == "admin"){
									document.location.href = '/organizationPage';
								}else if(response.role == "organization"){
									document.location.href = '/dashboardPage';
								}else{
									document.location.href = '/updateProfile';
								}

								}else{
								  $('#display_msg').css("display","");
							  }
							}

						})
					}else{
						$('#display_msg').css("display","");
					}

				}

			})

		}

		function SignUpDone() {
			var body = {"firstName": $('#firstName').val(),
						"lastName": $('#lastName').val(),
						"password": $('#passwordSignUp').val(),
						"email": $('#contact').val(),
						"phone_number": $('#phone_number').val(),
						"age": $('#age').val(),
						"gender": $('#gender').val(),
						"blood_group": $('#bloodList').val(),
						"role": null
						};
			
			$.ajax({
				type: "POST",
				url: "/register",
				data: JSON.stringify(body),
				dataType:"json",
				contentType: "application/json",
				success: function (response) {
					if(response.status==200){
						$("#signUpModal").modal('hide');
						$.notify({
							// options
							message : 'Registered successfully'
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
								
					}
				},
				error: function (error){
					console.log("error");
				}

			})
			
			
		}
		
		function forgotPassDone() {
			$("#forgotPasswordModal").modal('hide');
			$.notify({
				// options
				message : 'Email Sent'
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
		}
		
		
		$("#signUp").click(function() {
			$("#signUpModal").modal('show');
		});

		$("#referFriend").click(function() {
			$("#referFriendModal").modal('show');
		});
		
		function forgotPass(){
			$("#forgotPasswordModal").modal('show');
		}
		
</Script>
</body>
</html>
