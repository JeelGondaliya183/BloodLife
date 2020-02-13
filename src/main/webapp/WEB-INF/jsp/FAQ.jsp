<!-- Assignment 4 Submission 
     by Gaganpreet Singh 
	 Banner ID: B00819217 -->

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
<title>FAQ</title>

<meta content="width=device-width" name="viewport" />
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link href="/demo/login.css" rel="stylesheet" />
<style>
.nav-item {
	padding-right: 10%
}

ul {
	list-style: none; /* Remove default bullets */
}

.frequenQ>ul li::before {
	content: "\2022";
	color: red;
	font-weight: bold;
	display: inline-block;
	width: 1em;
	margin-left: -1em;
}
</style>
</head>

<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light shadow">
		<a class="navbar-brand" href="/index">BLOOD LIFE</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/">Login
				</a></li>
				<li class="nav-item "><a class="nav-link" href="/index">Home
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/events">Events</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/gallery">Gallery</a>
				</li>
				<li class="nav-item"><a class="nav-link active" href="/FAQ">FAQ</a>
				</li>


			</ul>
		</div>
	</nav>
	<div class="wrap">

		<div class="">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-12 col-md-7 col-lg-7 text-centers card card-body frequenQ"
						style="height: 600px; ">
						
							<!-- 
								Content taken from 
								https://blood.ca/en/blood/donating-blood 
							-->
							<h1 class="underline mb-5 ">Frequently Asked Questions</h1>
							<ul style="height: 430px; overflow: scroll">
								<li><b>How much blood are you taking with every
										donation?</b>
									<p>During a single blood donation, we obtain about 450 ml
										(a pint) of blood.</p></li>


								<li><b>How long is my body going to take to substitute
										the blood taken?</b>
									<p>Your donation's plasma part will be substituted in hours
										and the platelet part in days. It may take months for red
										blood cells to replenish.</p></li>


								<li><b>How long should I prevent strenuous exercise
										after blood donation?? </b>
									<p>After donating blood, you should prevent exhausting
										exercise for six to eight hours and heavy lifting for 24
										hours.</p></li>


								<li><b>What sort of blood does a person need to have
										for him/her to be a 'universal' donor?</b>
									<p>People with O negative (O-) blood are considered
										universal donors because anyone can receive O- blood. But all
										blood types are needed to meet the needs of patients for blood
										and blood products.</p></li>


								<li><b>I'm taking medicine at the moment. Can I donate
										blood anyway?</b>
									<p>If you want to know if a particular medication might
										prevent you from being eligible to donate, you can call us at
										1 888 X DONATE. When you take certain medications, you can
										still give blood: in many cases, this is not the medicine, but
										rather the reason for taking it.</p></li>


								<li><b>Why are the questions being asked so personal
										during the screening phase?</b>
									<p>The screening method is long and may seem intrusive, but
										it is totally essential to guarantee your safety and protect
										blood supply by screening individuals who are at higher danger
										of blood transmission of diseases.</p></li>


								<li><b>Is screening even necessary if you test all
										donated blood?</b>
									<p>While we use advanced and reliable processes to test
										each gift, these tests are not ideal. TThere are brief periods
										after infection called "window periods" when current tests
										cannot detect signs of a virus. These window periods were
										decreased but not eliminated by advances in testing
										technology. That's why we have rigorous screening processes to
										guarantee that every donor presents the lowest possible danger
										of disease transmission through their blood.</p></li>


								<li><b>I donate blood frequently and I always have the
										same responses to screening questions. Do I have to reply
										whenever I donate?</b>
									<p>We need to treat each donation as a distinct case
										because a lot can occur between donations. For the safety of
										blood supply and potential recipients of blood, we must be as
										careful as possible and ask the questions each time.</p></li>


								<li><b>I am a healthy adolescent. Why do I have to wait
										before I donate until I am 17?</b>
									<p>Current medical data informs us that 17 is the oldest
										age when blood can be given safely. But if you want to get
										engaged with Canadian Blood Services before you turn 17, there
										are other methods you can assist.</p></li>


								<li><b> When I come to donate, can I take kids with me?
								</b>If you take kids under the age of 10, please intend to have a
									friend or family member who does not donate with you. Children
									under the age of 10 and their supervisor are welcome to wait
									for their hero / donor in the refreshment area and enjoy a
									snack.
									<p>Children aged 10 and over are welcome to wait without
										oversight in the refreshment or specified waiting areas.</p></li>
							</ul>
						
					</div>

					<div class="col-md-1 col-lg-1 mt-5"></div>


					<div class="col-sm-12 col-md-4 col-lg-4 text-centers card my-auto mt-5"
						style="height: 600px;">
						<div class="align-items-center col-md-12 col-lg-12  my-auto">
							<div class="container ">
								<div class="row center  my-auto">
									<div class="mx-auto mt-5" id="faqFormDiv">
										<h3 class="login-heading mb-4">
											Still have a query? <br>We will be glad to answer
										</h3>
										<form id="faqForm" method="POST">
											<div class="form-label-group">
												<input type="email" name="email" id="FAQemail"
													class="form-control" placeholder="Email address" required
													autofocus> <label for="FAQemail">Email
													address</label>
											</div>

											<div class="form-label-group">
												<textarea id="question" rows=10 cols=33 name="question"
													class="form-control" placeholder="Let us know your query"
													required></textarea>
											</div>



											<button
												class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
												type="submit" id="submit">Submit</button>


										</form>
									</div>
									<div id="result" style="display: none">
										<h1>Query submitted successfully</h1>
										<br>
										<p>
											Your token id is: <span id="resultToken"></span> and the same
											has been sent to <span id="resultEmail"></span>
										</p>
										<br>
										<p>Our team will get back to you shortly</p>
										<p>
											Have more queries? <span><a id="resultBack" href="">Back</a></span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>


	<script src="/js/core/jquery.min.js"></script>
	<script src="/js/core/popper.min.js"></script>
	<script src="/js/core/bootstrap.min.js"></script>
	<script src="/js/plugins/perfect-scrollbar.jquery.min.js"></script>
	<script src="/js/plugins/bootstrap-notify.js"></script>
	<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="/js/paper-dashboard.js?v=2.0.0"></script>
	<script>
		jQuery(document).ready(

		// Jquery Function to call function on
		// click of submit button.
		function() {
			$("#result").hide();
			jQuery("#faqForm").submit(function(e) {
				e.preventDefault();

				var data = {
					"email" : jQuery("#FAQemail").val(),
					"question" : jQuery("#question").val()
				}
				console.log("email" + data.email);
				console.log("email" + data.question);
				jQuery.ajax({
					url : "/fetchFAQ",
					data : data,
					type : "POST"
				}).done(function(token) {
					$("#faqFormDiv").hide();
					$("#result").show();
					$("#resultToken").text(token);
					$("#resultEmail").text(jQuery("#FAQemail").val());

				});
			});
			$("#resultBack").click(function() {
				$("#faqFormDiv").show();
				$("#result").hide();
			})
		});
	</script>
</body>
</html>
