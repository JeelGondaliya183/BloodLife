
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
<meta
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0 , shrink-to-fit=no"
	name="viewport" />
  <link rel="apple-touch-icon" sizes="76x76" href="../assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../assets/img/favicon.png">
  <title>
  	Gallery Management
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/css/paper-dashboard.css?v=2.0.0" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="/demo/demo.css" rel="stylesheet" />
  <link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">
</head>
<body>
  <div class="wrapper">
  
	<jsp:include page="sidebar.jsp"></jsp:include>
	
    <div class="main-panel">
      <!-- Navbar -->
      <jsp:include page="navbar.jsp"></jsp:include> 
      <!-- End Navbar -->

      <div class="content">
        <div class="row">
          <div class="col-sm-1">
            <button type="button" class="btn btn-default btn-md"
                    id="addPhoto">
              <i class="fa fa-picture-o" aria-hidden="true"></i> Add Photo
            </button>
          </div>
        </div>
        <div class="row" id="photosDiv">
          <div class="col-4" id="photoComponent" style="display: none;">
            <div class="card" style="width: 20rem;">
             <a href="#"> <img class="card-img-top" src="" alt="Card image cap" style="height: 200px;"></a>
              <div class="card-body">
                <h4 class="card-title" id="imgTitle">Card title</h4>
                <button  class="btn btn-danger" onclick="deletePhoto(this)" id="deletePhoto"><i class="fa fa-trash" aria-hidden="true"></i> Remove</button>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
        </div>
<%--      Begin  Add photo modal--%>
        <div id="addPhotoModal" class="modal " tabindex="-1"
             role="dialog">
          <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
              <form  action="javascript:void(0)"
                    id="addDonorDetails">
                <div class="modal-header">
                  <h5 class="modal-title">Ad photo to gallery</h5>
                  <button type="button" class="close" data-dismiss="modal"
                          aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <label class="control-label">Photo title <span
                            style="color: red"> *</span>
                    </label> <input type="text" class="form-control" name="photoTitle"
                                    id="photoTitle" placeholder="Title" required>
                  </div>
                  <div class="form-group">
                    <label class="control-label"> Photo :<span
                            style="color: red"> *</span>
                    </label>
                  </div>
                  <input type="file" class="form-control"
                         id="photo" placeholder="photo" required>
                </div>
                <div class="modal-footer">
                  <button type="submit" class="btn btn-success" id="btnAdd">add</button>
                  <button type="button" class="btn btn-secondary"
                          data-dismiss="modal">Close</button>
                </div>
              </form>
            </div>
          </div>
        </div>
<%--        End add photo modal--%>
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
  
  
  <script>
  $(document).ready(function(){
	  $("#header").html("Gallery Management");
	  $("li").removeClass("active");
	  $("#galleryJsp").addClass("active");
	 // 
    getAllPhotos ();
  });

    $('#addPhoto').click(function(){
      $('#addPhotoModal').modal('show');
    })

    $('#btnAdd').click(function() {
      var data = new FormData();
      jQuery.each(jQuery('#photo')[0].files, function (i, file) {
        data.append('file', file);
      });
      $.ajax({
        type: 'POST',
        cache: false,
        contentType: false,
        processData: false,
        url: '/uploadFile',
        data: data,
        success: function (data) {
          if(data['status']==200){
            var requestBody = '{';
            requestBody += '"title":"'+$('#photoTitle').val();
            requestBody += '","imageUrl":"'+data.link;
            requestBody += '"}';
            $.ajax({
              type: 'POST',
              dataType:"json",
              contentType: "application/json",
              url: '/saveImageDetails',
              data: requestBody,
              success: function (response) {
                if(response.status == 200){
                  $('#addPhotoModal').modal('hide');
                  getAllPhotos ();
                }
              }
            });
          }
        }
      });
    });

  function getAllPhotos () {
    $.ajax({
      type: 'GET',
      dataType:"json",
      url: '/getAllPhotos',
      success: function (response) {
        $("#photosDiv").children().not('#photoComponent').remove();
        for (var i = 0; i <  response.data.length; i++) {
          $("#photoComponent").clone().appendTo("#photosDiv").attr("id","photo"+i).css("display","block");
          $("#photo"+i).find("img").attr("src",response.data[i].imageUrl);
          $("#photo"+i).find("#imgTitle").html(response.data[i].title);
          $("#photo"+i).find("#deletePhoto").attr("id","deletePhoto"+response.data[i].id);
        }
      }
    });
  }

  function deletePhoto(element){
    console.log(element.id);
    var photoId = element.id;
    photoId = photoId.split("Photo")[1];
    $.ajax({
      type: 'GET',
      dataType:"json",
      url: '/deletePhoto?photoId='+photoId,
      success: function (response) {
        if (response.status === 200){
          getAllPhotos();
        }
      }
    });
  }
  </script>
  </body>
</html>