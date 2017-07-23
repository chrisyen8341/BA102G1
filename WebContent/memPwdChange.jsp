<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
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

$(function(){
	
	$("#memNewPwd").blur(function () {
		var regex = new RegExp('.*[a-zA-Z]+.*');
		if($("#memNewPwd").val().length<6){
			$("#memPwdShow").html("&nbsp;&nbsp;&nbsp;&nbsp;�K�X���׻ݤj��6").css('color','red');
		}
		else if(!$("#memNewPwd").val().match(regex)) {
			$("#memNewPwdShow").html("&nbsp;&nbsp;&nbsp;&nbsp;�K�X���]�t�^��r").css('color','red');
		} 
		else{
			$("#memNewPwdShow").html("").css('color','green');
		}
	});

	//�T�{�K�X����
	$("#conPwd").blur(function() {
		if ($("#memNewPwd").val().trim() == $("#conPwd").val().trim()) {
			$("#conPwdShow").html("&nbsp;&nbsp;&nbsp;&nbsp;�K�X�۲�").css('color','green');
		} else {
			$("#conPwdShow").html("&nbsp;&nbsp;&nbsp;&nbsp;�K�X���۲�").css('color','red');
		}
		;
	});
	
	
});


</script>
<STYLE>
.title {
	width: 150px; /* �]�w H1 ���˦�*/
}
</STYLE>
<!--[if lt IE 9]>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
            <![endif]-->
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
							class="list-group-item">�d����T</a> <a href="#"
							class="list-group-item">�w����</a> <a href="#"
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
								<form method="post" action=Update>
									<div class="row">
										<div class="col-md-3 col-lg-3 " align="center">
											<img alt="User Pic" id="memPic" src="DBGifReader"
												height="350px" width="250px"
												class="img-circle img-responsive"> 
										</div>


										<div class=" col-md-9 col-lg-9 ">
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td class="title">�ثe���K�X</td>
														<td><input type="password" class="form-control"
															name="memPwd" id="memPwd"
															placeholder="�п�J�ثe���K�X" /></td>
													</tr>
													<tr>
														<td class="title">�s�K�X</td>
														<td><input type="password" class="form-control"
															name="memNewPwd" id="memNewPwd"
															placeholder="�п�J�z���s�K�X" /><span id="memNewPwdShow"></span></td>
													</tr>
													<tr>
														<td class="title">���s��J�s�K�X</td>
														<td><input type="password" name="conPwd"
															id="conPwd"
														    class="form-control"
															placeholder="�нT�{�z���K�X" /><span id="conPwdShow"></span></td>
													</tr>
	

												</tbody>
											</table>
											<input type="hidden" name="action" value="pwdChange">
											<input type="submit" value="�ק�K�X" class="btn btn-primary">
											<c:if test="${not empty errorMsgs}">
												<font color="red">
													<ul>
														<c:forEach var="message" items="${errorMsgs}">
															<li>${message}</li>
														</c:forEach>
													</ul>
												</font>
											</c:if>
											
											<c:if test="${success!=null}">
											<font color="green">
											<ul>
											<li>${success}</li>
											</ul>
											</font>
											</c:if>
										</div>
									</div>
								</form>
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
					<div id="fixedbutton-talk">
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