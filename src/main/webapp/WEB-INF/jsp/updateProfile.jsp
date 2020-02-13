
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <!-- Material Kit CSS -->
<link href="/css/bootstrap.min.css" rel="stylesheet" />
<link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
 <link rel="stylesheet" href="demo/edit_profile.css">
	
<title>Profile</title>
<script>
	
	//Check if the session exists, if it doesn't, then redirect the user to login.
	var flag = '<%=session.getAttribute("role") == null%>';
	
	 if(flag.toLowerCase()== 'true'){
		window.location.href="/";

	}
</script>	 
</head>
<body onload="loadData();">
	<div class="wrapper">
			<jsp:include page="sidebar.jsp" />
			<div class="main-panel">
				<jsp:include page="navbar.jsp" />
				<div class="content">
					    <div class="row">
					    
      <div class="col-xs-10 col-sm-9 col-lg-10 center">
        <form class="form ">
          <div id="parent_layout" class="card center">
            <div class="card-details center">
              <!-- This image was taken from https://pixabay.com/ (look for reference number [1] under Edit profile page in ReadMe file)-->
              <img src="https://cdn.pixabay.com/photo/2015/03/04/22/35/head-659651_1280.png" class="img-circle profile-avatar" alt="User avatar">
            </div>
            <div class="card-btn center">
              <button id="edit_btn" type="button" onclick="makeEditable()" name="button">Edit Profile</button>
              <button id="save_btn" type="button" onclick="saveChanges()" name="button" disabled="disabled">Save Edits</button>
              <button id="delete_btn" type="button" onclick="deleteUser()" name="button" >Delete Account</button>
            </div>
          </div>
          <br>
          <div class="card ">
            <div class="card-details ">
              <div class="card-heading">
                <h4 class="card-title">Your info</h4>

              </div>
              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>First Name:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <input id="first_name" type="text" class="form-control" readonly="readonly">
                </div>
              </div>
              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>Last Name:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <input id="last_name" type="text" class="form-control" readonly="readonly" required>
                </div>
              </div>

              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>Age:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <input id="Age" type="text" class="form-control" readonly="readonly">
                </div>
              </div>

              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>Gender:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <select id="type" class="form-control" disabled=disabled>
                    <option>Male</option>
                    <option>Female</option>
                    <option>Other</option>
                  </select>
                </div>
              </div>

            </div>
          </div>
          <br>
          <div class="card ">
            <div class="card-details ">
              <div class="card-heading">
                <h4 class="card-title">Contact info</h4>
              </div>
              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>Email:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <input id="email" type="email" class="form-control" readonly="readonly">
                </div>
              </div>
              <div class="form-group">
                <div class="lable-class col-sm-2">
                  <label>Phone Number:</label>
                </div>
                <div class="field col-sm-10 col-lg-8">
                  <input id="phone" type="tel" class="form-control" readonly="readonly">
                </div>
              </div>
            </div>
          </div>
          <br>
        </form>
      </div>
    </div>
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
                          <p>Are you sure you want to delete you account?</p>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-danger" onclick=" deleteUser()">Confirm</button>
                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                      </div>
                    </div>
                  </div>
</div>
</div>
</div>
<script src="/js/core/jquery.min.js" ></script>
<script src="/js/core/popper.min.js" ></script>
<script src="/js/core/bootstrap.min.js" ></script>
<script src="/js/plugins/perfect-scrollbar.jquery.min.js"
	></script>
<script src="/js/plugins/bootstrap-notify.js"></script>
<script src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/js/paper-dashboard.js?v=2.0.0" ></script>
<script>
  var token='<%= session.getAttribute("token") %>';
$(document).ready(function(){
	$("#header").html("Update Profile");
});

var id ,first_name, last_name, Age, email, phone_number,blood_group,role,gender;

//This method loads the user details from the user table in the database.
function loadData(){
	var id='<%= session.getAttribute("id") %>';
	$.ajax({
		type: 'GET',
		dataType: "json",
		url: '/users/'+id,
      headers: {

        "Authorization": "Bearer " + token
      },

		success: function(response){
			var jsonData=response.data;
			first_name=jsonData.firstName;
			last_name= jsonData.lastName;
			Age= jsonData.age;
			phone_number= jsonData.phone_number;
			blood_group= jsonData.blood_group;
			password= jsonData.password;
			role= jsonData.role;
			email= jsonData.email;
			gender= jsonData.gender;
			id= jsonData.id;
			

			document.getElementById('first_name').value = first_name;
		    document.getElementById('last_name').value = last_name;
		    document.getElementById('Age').value = Age;
		    document.getElementById('email').value = email;
		    document.getElementById('type').value = gender;
		    document.getElementById('phone').value = phone_number;
		}
	});
	
	
}


function makeEditable() {
	
	 
  document.getElementById('first_name').removeAttribute('readonly');
  document.getElementById('last_name').removeAttribute('readonly');
  document.getElementById('Age').removeAttribute('readonly');
  document.getElementById('email').removeAttribute('readonly');
  document.getElementById('phone').removeAttribute('readonly');
  document.getElementById('save_btn').removeAttribute('disabled');
  document.getElementById('type').removeAttribute('disabled');
  document.getElementById('edit_btn').setAttribute('disabled', 'disabled');

};

function saveChanges() {
  first_name = document.getElementById('first_name').value;
  last_name = document.getElementById('last_name').value;
  Age = document.getElementById('Age').value;
  email = document.getElementById('email').value;
  phone_number = document.getElementById('phone').value;
  gender=document.getElementById('type').value;
  var id='<%= session.getAttribute("id") %>';
	var refer_friend="hello@gmail.com";
	var blood_group="A-";  
	var body = {"id":id , "age" : Age, "blood_group" : blood_group, "email" : email, "firstName" : first_name, "lastName" : last_name, "role": role, "gender":gender, "phone_number" : phone_number, "password":password};

	//Make a "POST" request and save the updated user details to MySQL database.
	
	 $.ajax({
			type: 'POST',
			url: '/users/updateProfilePost',
	        processData: false,
		    contentType: "application/json",
		    dataType:"json",
             headers: {

               "Authorization": "Bearer " + token
             },
            data: JSON.stringify(body),
		    success: function(response) {
				console.log(response);
				//if the response is ok then update data on the front-end
				if(response.status==200){
					  document.getElementById('first_name').value = first_name;
					    document.getElementById('last_name').value = last_name;
					    document.getElementById('Age').value = Age;
					    document.getElementById('email').value = email;
					    document.getElementById('phone').value = phone_number;

					    document.getElementById('first_name').setAttribute('readonly', 'readonly');
					    document.getElementById('last_name').setAttribute('readonly', 'readonly');
					    document.getElementById('Age').setAttribute('readonly', 'readonly');
					    document.getElementById('email').setAttribute('readonly', 'readonly');
					    document.getElementById('phone').setAttribute('readonly', 'readonly');
					    document.getElementById('save_btn').setAttribute('disabled', 'disabled');
					    document.getElementById('edit_btn').removeAttribute('disabled');
					    document.getElementById('type').setAttribute('disabled', 'disabled');
					    $.notify({
							// options
							message : 'Profile Successfully updated'
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
				//print error messages from the backend validations
				else if(response.status==400){
					$.notify({
						// options
						message : response.Message
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
				}
				
			}
		}); 
  
}

$("#delete_btn").click(function(){
  $('#deleteModal').modal('show');
});


  function deleteUser() {
    var id='<%= session.getAttribute("id") %>';

    $('#deleteModal').modal('hide');
  }

</script>
			
</body>
</html>