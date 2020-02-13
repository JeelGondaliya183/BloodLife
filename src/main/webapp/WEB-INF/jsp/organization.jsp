<!doctype html>
<html lang="en">
<head>
    <title>Organization</title>
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
                            id="addOrganization">
                        <i class="fas fa-user-plus"></i> Add Organization
                    </button>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="container table-responsive">
                    <table class="table table-striped" id="organizationTable"
                           style="text-align: center">
                        <thead class="thead-dark">
                        <tr>
                            <th scope="col" style="width:0px">#</th>
                            <th scope="col" style="width:25%">Name</th>
                            <th scope="col" style="width:30%">Address</th>
                            <th scope="col" style="width:15%">Contact</th>
                            <th scope="col" style="width:10%">Email</th>
                            <th scope="col" style="width:10%">Threshold</th>
                            <th scope="col" style="width:10%"></th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
            <!--Add Begin Modal -->

            <div id="addOrganizationModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-md" role="document">
                    <div class="modal-content">
                        <form onsubmit="return addOrganization()" action="javascript:void(0)" id="addOrganizationDetails">
                            <div class="modal-header">
                                <h5 class="modal-title">Organization Details</h5>
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="modal-body">
                                <div class="form-group">
                                    <label class="control-label"> Name:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="name"
                                                    id="name" placeholder="name" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Address:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="address"
                                                    id="address" placeholder="address" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Contact:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="contact"
                                                    id="contact" placeholder="contact" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Email:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" name="email"
                                                    id="email" placeholder="email" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label">Blood Threshold:<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" min="500" class="form-control" name="email"
                                                    id="threshold" placeholder="email" required>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success" id="btnSave">Save</button>
                                <button type="button" class="btn btn-secondary"
                                        data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- End Add Modal -->
            <!--Edit Begin Modal -->
            <div id="editOrganizationModal" class="modal " tabindex="-1"
                 role="dialog">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <form onsubmit="return updateOrganization()"
                              action="javascript:void(0)" id="updateOrganizationDetails">
                            <div class="modal-header">
                                <h5 class="modal-title">Update Organization Details</h5>
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
                                    <label class="control-label"> Name:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" id="editName"
                                                    placeholder="name" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Address:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" id="editAddress"
                                                    placeholder="address" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Contact:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" id="editContact"
                                                    placeholder="contact" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Email:<span
                                            style="color: red"> *</span>
                                    </label> <input type="text" class="form-control" id="editEmail"
                                                    placeholder="email" required>
                                </div>
                                <div class="form-group">
                                    <label class="control-label"> Blood Threshold:<span
                                            style="color: red"> *</span>
                                    </label> <input type="number" min="500" class="form-control" id="editThreshold"
                                                    placeholder="threshold" required>
                                </div>
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

<%--<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_QXCVMoGyS0934D9Kd8qrsNpeYqzLkbI&libraries=places"></script>--%>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_QXCVMoGyS0934D9Kd8qrsNpeYqzLkbI&libraries=places&callback=autofill_address"
        async defer></script>

<script>
    var token = '<%= session.getAttribute("token") %>';
    var table;
    $(document).ready(function() {
        $("#header").html("Organization");
        $("li").removeClass("active");
        $("#organizationJsp").addClass("active");
        getAllOrganization();

    });



    function addOrganization() {
        var body = {"organizationName" : $('#name').val(),"address":$("#address").val(),"email": $('#email').val(),"contact": $('#contact').val(), "latitude": null, "longitude":null,"bloodThreshold" : $('#threshold').val()};
        $.ajax({
            type: 'POST',
            dataType:"json",
            contentType: "application/json",
            url: '/organization/save',
            headers: {

                "Authorization": "Bearer " + token
            },
            data: JSON.stringify(body),
            success: function (response) {
                if(response.status == 200){
                    $('#addOrganizationDetails').trigger('reset');
                    $("#addOrganizationModal").modal('hide');
                    $.notify({
                        // options
                        message : 'Organization added successfully'
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
                    getAllOrganization ();
                }
            }
        });
    }

    function updateOrganization() {

        var body = {"id":$('#id').val(),"organizationName" : $('#editName').val(),"address":$("#editAddress").val(),"contact" : $('#editContact').val()
          ,"email": $('#editEmail').val(), "latitude": null, "longitude":null, "bloodThreshold":$('#editThreshold').val()};
        $.ajax({
            type: 'POST',
            dataType:"json",
            contentType: "application/json",
            url: '/organization/save',
            headers: {

                "Authorization": "Bearer " + token
            },
            data: JSON.stringify(body),
            success: function (response) {
                if(response.status == 200){
                    $('#updateOrganizationDetails').trigger('reset');
                    $("#editOrganizationModal").modal('hide');
                    $.notify({
                        // options
                        message : 'Organization details updated successfully'
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
                    getAllOrganization ();
                }
            }
        });

        $("#editOrganizationModal").modal('hide');

    }

    function editOrganization(data) {
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
        deleteOrganization();
    }

    function edit() {
        var rowData = $('#organizationTable').DataTable().row(
            $('#organizationTable tbody').find(".rowSelected")).data();
        console.log(rowData);

        $("#editName").val(rowData.organizationName);
        $("#editAddress").val(rowData.address);
        $("#editContact").val(rowData.contact);
        $("#editEmail").val(rowData.email);
        $("#editThreshold").val(rowData.bloodThreshold);
        $("#id").val(rowData.id);
        $("#editOrganizationModal").modal('show');
    }

    function deleteOrganization() {
        var rowData = $('#organizationTable').DataTable().row(
            $('#organizationTable tbody').find(".rowSelected")).data();
        console.log(rowData);
        $.ajax({
            type: 'GET',
            contentType: "application/json",
            headers: {

                "Authorization": "Bearer " + token
            },
            url: '/organization/delete/'+rowData.id,
            success: function (response) {
                if(response.status == 200){
                    $.notify({
                        // options
                        message : 'Organization  deleted successfully'
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
                    getAllOrganization();
                }
            }
        });


    }

    $("#addOrganization").click(function() {
        $("#addOrganizationModal").modal('show');
    });

    function getAllOrganization() {
        if(table != null){
            table.destroy();
        }
        table = $('#organizationTable').DataTable( {
            'ajax': {
                'url': '/getAllOrganization',
                'type': 'GET',
                'beforeSend': function (request) {
                    request.setRequestHeader("Authorization", "Bearer " + token);
                }
            },
            "columns": [
                { "data": "id", "visible": false },
                { "data": "organizationName" },
                { "data": "address" },
                { "data": "contact" },
                { "data": "email" },
                { "data": "bloodThreshold" },
                { "data": null,
                    "render": function ( data, type, row, meta ) {
                        return '<i class="fas fa-edit" style="margin-right: 10%; font-size: 18px; color: #22733d" onclick="editOrganization(this)"></i><i class="fas fa-trash-alt" style="margin-left: 10%; font-size: 18px; color: #bb3b3b" onclick="deleteData(this)"></i>' ;
                    }
                }
            ]
        } );
    }
</script>
</body>
</html>