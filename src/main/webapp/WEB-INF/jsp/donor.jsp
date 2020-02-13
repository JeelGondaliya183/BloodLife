<!doctype html>
<html lang="en">
<head>
    <title>Donor Details</title>
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
                            id="addDonor">
                        <i class="fas fa-user-plus"></i> Add Donation
                    </button>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="container table-responsive">
                    <table class="table table-striped" id="donorTable"
                           style="text-align: center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:5%">#</th>
                            <th scope="col" style="width:10%">First Name</th>
                            <th scope="col" style="width:10%">Last Name</th>
                            <th scope="col" style="width:10%">Blood Group</th>
                            <th scope="col" style="width:10%">Bag Number</th>
                            <th scope="col" style="width:10%">Quantity</th>
                            <th scope="col" style="width:10%">Contact Number</th>
                            <th scope="col" style="width:10%">Donated Date</th>
                            <th scope="col" style="width:10%">Expiry Date</th>
                            <th scope="col" style="width:0%"></th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <!--Add Begin Modal -->

            <div id="addDonorModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <form onsubmit="return addDonor()" action="javascript:void(0)"
                              id="addDonorDetails">
                            <div class="modal-header">
                                <h5 class="modal-title">Donation Details</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label"> Donor:<span
                                            style="color: red"> *</span>
                                    </label> <select class="form-control col-md-12" style="width: 100%" name="userId"
                                                     id="userId" placeholder="user" required></select>
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
                                    <label class="control-label"> Quantity (ml):<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" class="form-control" name="quantity"
                                                    id="quantity" min=10 placeholder="quantity" required>
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
            <div id="editDonorModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form onsubmit="return updateDonor()"
                              action="javascript:void(0)" id="updateDonor">
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
                            <button type="button" class="btn btn-danger" onclick=" deleteDonor()">Confirm</button>
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
        $("#header").html("Donation Details");
        $("li").removeClass("active");
        $("#donorJsp").addClass("active");
        getAllDonors();
        $('#userId').select2();
    });



    function addDonor() {
        var body = {
            "bloodGroup": $('#bloodGroup').val(),
            "quantity": $("#quantity").val(),
            "user": {"id": parseInt($('#userId').val())}
        };
        $.ajax({
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            headers: {

                "Authorization": "Bearer " + token
            },
            url: '/donor/save',
            data: JSON.stringify(body),
            success: function (response) {
                if (response.status == 200) {
                    $('#addDonorDetails').trigger('reset');
                    $("#addDonorModal").modal('hide');
                    $.notify({
                        // options
                        message: 'Donor added successfully'
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
                    getAllDonors();
                }
            }
        });
    }

    function updateDonor() {

        var body = {
            "id": $('#id').val(),
            "bloodGroup": $('#editBloodGroup').val(),
            "quantity": $("#editQuantity").val(),
            "user": {
                "id": $('#editUserId').val()
            }
        };
        $.ajax({
            type: 'POST',
            dataType: "json",
            contentType: "application/json",
            headers: {

                "Authorization": "Bearer " + token
            },
            url: '/donor/save',
            data: JSON.stringify(body),
            success: function (response) {
                if (response.status == 200) {
                    $('#updateDonor').trigger('reset');
                    $("#editDonorModal").modal('hide');
                    $.notify({
                        // options
                        message: 'Donor updated successfully'
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
                    getAllDonors();
                }
            }
        });

        $("#editDonorModal").modal('hide');

    }

    function editDonor(data) {
        console.log($(data).parent().parent());
       if ($(data).parent().parent().hasClass('rowSelected')) {
            $($(data).parent().parent()).removeClass('rowSelected');
       } else {
           table.$('tr.rowSelected').removeClass('rowSelected');
           $($(data).parent().parent()).addClass('rowSelected');
       }
        edit();
    }

    function deleteData(data) {

        if ($(data).parent().parent().hasClass('rowSelected')) {
            $($(data).parent().parent()).removeClass('rowSelected');
        } else {
            table.$('tr.rowSelected').removeClass('rowSelected');
            $($(data).parent().parent()).addClass('rowSelected');
        }
        $('#deleteModal').modal('show');
      //  deleteDonor();
    }

    function edit() {
        var rowData = $('#donorTable').DataTable().row(
            $('#donorTable tbody').find(".rowSelected")).data();
        console.log(rowData);
        getAllUsers();
        $("#editBloodGroup").val(rowData.bloodGroup);
        $("#editQuantity").val(rowData.quantity);
        $("#id").val(rowData.id);
        $("#editDonorModal").modal('show');
    }

    function deleteDonor() {
        var rowData = $('#donorTable').DataTable().row(
            $('#donorTable tbody').find(".rowSelected")).data();
        console.log(rowData);
        $.ajax({
            type: 'GET',
            contentType: "application/json",
            headers: {

                "Authorization": "Bearer " + token
            },

            url: '/donor/delete/' + rowData.id,
            success: function (response) {
                if (response.status == 200) {
                    $('#deleteModal').modal('hide');
                    getAllDonors();
                }
            }
        });


    }

    $("#addDonor").click(function () {
        getAllUsers();
        $("#addDonorModal").modal('show');
    });

    function getAllDonors() {
        if (table != null) {
            table.destroy();
        }
        table = $('#donorTable').DataTable({
            'ajax': {
                'url': /donor/,
                'type': 'GET',
                'async': false,
                'beforeSend': function (request) {
                    request.setRequestHeader("Authorization", "Bearer " + token);
                }
            },
            "columns": [
                { "data": "id", "visible": false },
                {"data": "user.firstName"},
                {"data": "user.lastName"},
                {"data": "bloodGroup"},
                {"data": "bagId"},
                {"data": "quantity"},
                {"data": "user.phone_number"},
                {
                    "data": "timestamp",
                    "render": function (data, type, row, meta) {

                        return moment(data).format("YYYY-MM-DD");

                    }
                },
                {
                    "data": "expiryDate",
                    "render": function (data, type, row, meta) {

                        return moment(data).format("YYYY-MM-DD");
                        ;
                    }
                },
                {
                    "data": null,
                    "render": function (data, type, row, meta) {
                        return '<i class="fas fa-edit" style="margin-right: 10%; font-size: 18px; color: #22733d" onclick="editDonor(this)"></i><i class="fas fa-trash-alt" style="margin-left: 10%; font-size: 18px; color: #bb3b3b" onclick="deleteData(this)"></i>';
                    }
                }
            ]
        });
    }

    function getAllUsers() {
        $.ajax({
            type: 'GET',
            contentType: "application/json",
            url: '/users/',
            headers: {

                "Authorization": "Bearer " + token
            },

            success: function (response) {
                if (response.status == 200) {
                    console.log(response.data);
                    $('#userId').html("");
                    $('#editUserId').html("");
                    var options = "";
                    for (var i = 0; i < response.data.length; i++) {
                        options += '<option value=' + response.data[i].id;
                        options += ' bloodGroup='+response.data[i].blood_group+'>' + response.data[i].email;
                        options += '</option>';
                    }
                    $('#userId').append(options);
                    $('#editUserId').append(options);
                    // $('#userId').change();
                }
            }
        });


        // $('#userId').change(function(){
        //    $('#bloodGroup').val($('#userId :selected').attr('bloodGroup'));
        // });
        //
        //
        // $('#editUserId').change(function(){
        //     $('#editBloodGroup').val($('#userId :selected').attr('bloodGroup'));
        // });
    }
</script>
</body>
</html>