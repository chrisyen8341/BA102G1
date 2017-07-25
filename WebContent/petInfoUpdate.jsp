<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.pet.model.*"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html lang="">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/nav.css" rel="stylesheet">
<link href="css/colorplan.css" rel="stylesheet">
<link href="css/frontend.css" rel="stylesheet" type="text/css">
<!-- Custom CSS -->
<link href="css/modern-business.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="font-awesome/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<link href="css/date.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	//�Ӥ��W�ǹw��
	$(function() {

		$("#petImg").change(function() {
			readURL(this);
		});

		function readURL(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#petPic').attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
		;

	});
</script>
<STYLE>
.title {
	width: 120px; /* �]�w H1 ���˦�*/
}
</STYLE>
<!--[if lt IE 9]>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
</head>

<body>
	<%@ include file="memNavBar.file"%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-12 col-sm-2 postion-left-group ">
				<%@ include file="memZoneLSide.file"%>
			</div>

			<%
				
			Integer petOrd=0;
			boolean petOedIsNull=false;
			try{
				petOrd = Integer.parseInt(request.getParameter("petOrd"));
			}
			catch(Exception e){
				petOrd=0;
				petOedIsNull=true;
			}
			if(!petOedIsNull){	
			 Pet pet = list.get(petOrd);
				pageContext.setAttribute("pet", pet);
			}
			%>


			<div class="col-xs-12 col-sm-8 ">
				<div class="row">

					<h5 class="page-header text-right">�ثe��m:�|���M��</h5>


					<div class="row">

						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">${member.memId}</h3>
							</div>
							<div class="panel-body">

								<div class="row">
									<form method="post" action="petUpdate" enctype="multipart/form-data">
										<div class="col-md-3 col-lg-3 " align="center">
											<img alt="User Pic" id="petPic"
												src="PetImgReader?petNo=${pet.petNo}" height="350px"
												width="250px" class="img-circle img-responsive"> <input
												type="file" name="petImg" id="petImg" placeholder="�s��ۤ�" />
										</div>


										<div class=" col-md-9 col-lg-9 ">
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td class="title">�d���m�W</td>
														<td><input type="text" class="form-control"
															name="petName" id="petName" value="${pet.petName}"
															placeholder="�п�J�ʺ�" /></td>
													</tr>
													<tr>
														<td class="title">�d������</td>
														<td>${pet.petKind}</td>
													</tr>
													<tr>
														<td class="title">�d���ʧO</td>
														<td>${pet.petGender==o?'�k':'�k'}</td>
													</tr>

													<tr>
														<td class="title">�d���~��</td>
														<td><input type="text" class="form-control"
															name="petSpecies" id="petSpecies"
															value="${pet.petSpecies}" placeholder="�п�J�z���m�W" /></td>
													</tr>

													<tr>
														<td class="title">�d���ͤ�</td>
														<td><input type="date" name="petBday"
															min="1910-01-01" max='2000-13-13' id="memBday"
															value="${pet.petBday}" class="form-control"
															placeholder="Confirm your Password" /></td>
													</tr>


													<tr>
														<td class="title">�d������</td>
														<td><textarea class="form-control" id="petIntro"
																name="petIntro" placeholder="�п�J�z���a�}">${pet.petIntro}</textarea></td>
													</tr>


												</tbody>

											</table>
											<input type="hidden" name="action" value="petUpdate">
											<input type="hidden" name="petNo" value="${pet.petNo}">
											<input type="submit" value="�ק�" class="btn btn-primary">
											
											<!-- �U��|���η| �I�smodal-->
											<button type="button" class="btn btn-danger"
												data-toggle="modal" data-target="#myModal">����</button>
											
											
											<c:if test="${not empty errorMsgs}">
												<font color="red">
													<ul>
														<c:forEach var="message" items="${errorMsgs}">
															<li>${message}</li>
														</c:forEach>
													</ul>
												</font>
											</c:if>
											
										</div>
									</form>
									<!-- Modal -->
									<div class="modal fade" id="myModal" tabindex="-1"
										role="dialog" aria-labelledby="exampleModalLabel"
										aria-hidden="true">
										<div class="modal-dialog" role="document">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="exampleModalLabel">�T�w�ק�</h5>
													<button type="button" class="close" data-dismiss="modal"
														aria-label="Close">
														<span aria-hidden="true">&times;</span>
													</button>
												</div>
												<div class="modal-body">�аݱz�O�_�T�{����?</div>
												<div class="modal-footer">
													<span>

														<form action="petInfoUpdate.jsp" method="post">
															<input type="hidden" name="petOrd" value=${s.index}>
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">�_</button>
															<input type="submit" class="btn btn-primary" value="�O">
														</form>
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>


							</div>


						</div>
					</div>
				</div>


				<%@ include file="memButtom.file"%>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>