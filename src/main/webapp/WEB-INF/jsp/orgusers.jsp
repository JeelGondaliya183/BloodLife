<!doctype html>
<html lang="en">
<head>
    <title>Users</title>
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
    <style>
        .rowSelected {

        }
    </style>

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
                            id="addUser">
                        <i class="fas fa-user-plus"></i> Add  User
                    </button>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="container table-responsive">
                    <table class="table table-striped" id="usersTable"
                           style="text-align: center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:5%">#</th>
                            <th scope="col" style="width:10%">First Name</th>
                            <th scope="col" style="width:10%">Last Name</th>
                            <th scope="col" style="width:10%">Email</th>
                            <th scope="col" style="width:10%">Phone Number</th>
                            <th scope="col" style="width:10%">Organization</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <!--Add Begin Modal -->

            <div id="addUserModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <form onsubmit="return addUser()" action="javascript:void(0)"
                              id="addDonorDetails">
                            <div class="modal-header">
                                <h5 class="modal-title">Users Details</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label"> Organization:<span
                                            style="color: red"> *</span>
                                    </label> <select class="select2 col-sm-12" id="organizationList"
                                                     name="organization" style="width: 100%" >
                                </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> FirstName:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="firstName"
                                                    id="firstName"  placeholder="First name" required >
                                </div>
                                <div class="form-group">
                                    <label class="control-label">LastName:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="lastName"
                                                    id="lastName"  placeholder="Last Name" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Email:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="email"
                                                    id="email"  placeholder="Email" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">password:<span
                                            style="color: red"> *</span>
                                    </label> <input type="password" class="form-control" name="password"
                                                    id="password"  placeholder="password" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Age:<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" class="form-control" name="age"
                                                    id="age" min=10 placeholder="age" required/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Blood Group:<span
                                            style="color: red"> *</span>
                                    </label> <select class="form-control col-md-12" style="width: 100%" name="bloodGroup"
                                                     id="bloodGroup" placeholder="bloodGroup" required>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Contact:<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" class="form-control" name="contact"
                                                    id="contact"  placeholder="contact" required/>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Gender:<span
                                            style="color: red"> *</span>
                                    </label> <select class="form-control col-md-12" style="width: 100%" name="gender"
                                                     id="gender" placeholder="gender" required>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                </select>
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
            <div id="editUserModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form onsubmit="return updateUser()"
                              action="javascript:void(0)" id="updateUser">
                            <div class="modal-header">
                                <h5 class="modal-title">Update Donation Details</h5>
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
                                    <label class="control-label"> Donor:<span
                                            style="color: red"> *</span>
                                    </label> <select class="form-control col-md-12" style="width: 100%"
                                                     name="editUserId"
                                                     id="editUserId" placeholder="user" required disabled></select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Blood Group:<span
                                            style="color: red"> *</span>
                                    </label> <select class="form-control col-md-12" style="width: 100%" name="editBloodGroup"
                                                     id="editBloodGroup" placeholder="bloodGroup" required>
                                    <option value="A+">A+</option>
                                    <option value="A-">A-</option>
                                    <option value="B+">B+</option>
                                    <option value="B-">B-</option>
                                    <option value="O+">O+</option>
                                    <option value="O-">O-</option>
                                    <option value="AB+">AB+</option>
                                    <option value="AB-">AB-</option>
                                </select>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Quantity:<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" class="form-control" id="editQuantity"
                                                    placeholder="quantity" required>
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
                            <button type="button" class="btn btn-danger" onclick=" deleteUser()">Confirm</button>
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
    var table;
    $(document).ready(function () {
        $("#header").html("Users");
        $("li").removeClass("active");
        $("#orgUsersJsp").addClass("active");
        getAllUser();
       // $('#userId').select2();
    });

    function getAllOrganizations() {
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
                    }
                    $('#organizationList').append(options);
                    $('#organizationList').select2();
                }
            }
        });

    }

    function addUser() {
        var body = {
            "organization": {"id" : parseInt($("#organizationList").val())},
            "firstName": $("#firstName").val(),
            "lastName": $("#lastName").val(),
            "email": $("#email").val(),
            "age": $("#age").val(),
            "bloodGroup": $("#bloodGroup").val(),
            "phone_number": $("#contact").val(),
            "role": "organization"
        };
        $.ajax({
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            headers: {

                "Authorization": "Bearer " + token
            },
            url: 'register',
            data: JSON.stringify(body),
            success: function (response) {
                if (response.status == 200) {
                    $('#addDonorDetails').trigger('reset');
                    $("#addUserModal").modal('hide');
                    $.notify({
                        // options
                        message: 'User added successfully'
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
                    getAllUser();
                }
            }
        });
    }






    $("#addUser").click(function () {
        getAllOrganizations();
        $("#addUserModal").modal('show');
    });

    function getAllUser() {
        if (table != null) {
            table.destroy();
        }
        table = $('#usersTable').DataTable({
            'ajax': {
                'url': /users/,
                'type': 'GET',
                'beforeSend': function (request) {
                    request.setRequestHeader("Authorization", "Bearer " + token);
                }
            },
            "columns": [
                { "data": "id", "visible": false },
                {"data": "firstName"},
                {"data": "lastName"},
                {"data": "email"},
                {"data": "phone_number"},
                {
                    "data": "organization.organizationName",
                    "render": function (data, type, row, meta) {
                        if(data == null){
                            return "-";
                        }else{
                            return data;
                        }
                    }

                }

            ]
        });
    }



</script>
</body>
</html>