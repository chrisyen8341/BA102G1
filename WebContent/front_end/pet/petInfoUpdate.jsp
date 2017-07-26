<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.pet.model.*"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html lang="">

<head>
<%@ include file="memHead.file"%>
<title>�d��You&amp;Me</title>
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
									<form method="post" action="<%=request.getContextPath() %>/petUpdate" enctype="multipart/form-data">
										<div class="col-md-3 col-lg-3 " align="center">
											<img alt="User Pic" id="petPic"
												src="<%=request.getContextPath() %>/PetImgReader?petNo=${pet.petNo}" height="350px"
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