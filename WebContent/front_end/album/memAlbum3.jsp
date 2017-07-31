<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="">

<head>

<%@ include file="memHead.file"%>
<style>
</style>


</head>

<body>
	<%@ include file="memNavBar.file"%>
	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-12 col-sm-2 postion-left-group ">
				<%@ include file="memZoneLSide.file"%>
			</div>

			<div class="col-xs-12 col-sm-8 ">
				<div class="row">


					<h5 class="page-header text-right">�ثe��m:�|���M��</h5>

					<div class="row">

						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">${member.memId}</h3>
							</div>
							<div class="panel-body">

   

   
 											<!-- �U��| �I�smodal-->
											<button type="button" class="btn btn-primary"
												data-toggle="modal" data-target="#addAlbum">�s�W��ï</button>
  
  								
								
							</div>

						</div>
					</div>
				</div>






		<!-- Disable MODAL -->
		<div class="modal fade" id="addAlbum" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document" >
				<div class="modal-content">
        <form action="<%=request.getContextPath() %>/FileUpload2" method="post" enctype="multipart/form-data">  
		<input id="input-repl-2" name="imgs" type="file" class="file-loading" accept="image/*" multiple>
        </form>  
				</div>
			</div>
		</div>



				<%@ include file="memButtom.file"%>


			</div>
		</div>


<script>


$("#input-repl-2").fileinput({
    uploadUrl: "<%=request.getContextPath()%>/FileUpload3", // server upload action
    uploadAsync: true,
    maxFileCount: 5,
    showBrowse: false,
    browseOnZoneClick: true,
    allowedFileExtensions: ["jpg", "png", "gif"]
});


</script>



		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>