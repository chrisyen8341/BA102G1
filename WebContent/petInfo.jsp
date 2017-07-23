<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
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
<!--[if lt IE 9]>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
            </script>
  <STYLE>
    .title { width : 120px;          /* �]�w H1 ���˦�*/
         }
  </STYLE>
</head>

<body>
	<nav id="emerald-nav" class="navbar navbar-light navbar-fixed-top"
		role="navigation">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand logo" href="index.html">�d��You&amp;Me</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="date.html">���|�ӫ~</a></li>
					<li><a href="product.html">�ӫ�</a></li>
					<li><a href="activity.html">����</a></li>
					<li><a href="diary.html">�d����x</a></li>
				</ul>
				<div class="nav collapse navbar-collapse navbar-right" id="login">
					<ul class="nav navbar-nav">
						<li><a href="about.html">�ʪ���</a></li>
						<li><a href="about.html">�����H</a></li>
						<li><a href="services.html">�|���M��</a></li>
						<li><a href="contact.html">�n�X</a></li>
					</ul>
				</div>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-12 col-sm-2 postion-left-group ">
				<div id="menu">
					<div class="panel list-group list-color">
						<a href="#" class="list-group-item">�ӤH��T</a> <a href="#"
							class="list-group-item">�d����T</a> <a href="<%=request.getContextPath()+"/memPwdChange.jsp" %>"
							class="list-group-item">�ܧ�K�X</a> <a href="#" 
							class="list-group-item">��ï�޲z</a>
					</div>
				</div>
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
								<div class="row">
									<div class="col-md-3 col-lg-3 " align="center">
										<img alt="User Pic" id="petImg" src="PetImgReader" height="350px" width="250px" class="img-circle img-responsive">
									</div>


									<div class=" col-md-9 col-lg-9 ">
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td class="title">�d���m�W</td>
													<td>${pet.petName}</td>
												</tr>
												<tr>
													<td class="title">�d������</td>
													<td>${pet.petKind}</td>
												</tr>
												<tr>
													<td class="title">�d���ʧO</td>
													<%
														Pet pet = (Pet) session.getAttribute("pet");
														String petGender = String.valueOf(pet.getPetGender());
														HashMap pGender = (HashMap) application.getAttribute("mGender");
													%>
													<td><%=pGender.get(petGender)%></td>
												</tr>
												<tr>
													<td class="title">�d���~��</td>
													<td>${pet.petSpecies}</td>
												</tr>
												<tr>
													<td class="title">�ͤ�</td>
													<td>${pet.petBday}</td>
												</tr>
												
												<tr>
													<td class="title">�d������</td>
													<td>${pet.petIntro}</td>
												</tr>


											</tbody>
										</table>

										<a href="petInfoUpdate.jsp" class="btn btn-primary">�s��ӤH��T</a>
									</div>
								</div>
							</div>
							<div class="panel-footer">
								<a data-original-title="Broadcast Message" data-toggle="tooltip"
									type="button" class="btn btn-sm btn-primary"><i
									class="glyphicon glyphicon-envelope"></i></a> <span
									class="pull-right"> <a href="edit.html"
									data-original-title="Edit this user" data-toggle="tooltip"
									type="button" class="btn btn-sm btn-warning"><i
										class="glyphicon glyphicon-edit"></i></a> <a
									data-original-title="Remove this user" data-toggle="tooltip"
									type="button" class="btn btn-sm btn-danger"><i
										class="glyphicon glyphicon-remove"></i></a>
								</span>
							</div>

						</div>
					</div>
				</div>



				<div class="text-center">

					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li class="active"><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
					<br>
					<ul class="pager">
						<li><a href="#">�e�@��</a></li>
						<li><a href="#">�U�@��</a></li>
					</ul>

				</div>

				<div class="postion-left-group-b">
					<footer>
						<div class="row">
							<div class="col-sm-12">
								<div class="col-sm-3">
									<p>Copyright �d��You&amp;Me 2017</p>
								</div>
								<div class="col-sm-3">
									<p>����ڭ�</p>
								</div>
							</div>
						</div>
					</footer>
				</div>
				<a href="#">
					<div class="" id="fixedbutton-talk">
						<button class="button btn-lg btn-primary active">�����ѫ�</button>
					</div>
				</a>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>