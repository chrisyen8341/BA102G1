<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.emp.model.*"%>
<!DOCTYPE html>
<html lang="">
<%
	Emp emp = (Emp) request.getAttribute("emp");
%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link href="<%=request.getContextPath()%>/back_end/css/bootstrap.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/back_end/css/nav.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/back_end/css/colorplan.css"
	rel="stylesheet">
<!-- Custom CSS -->
<link
	href="<%=request.getContextPath()%>/back_end/css/modern-business.css"
	rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="<%=request.getContextPath()%>/back_end/font-awesome/css/font-awesome.css"
	rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/back_end/css/backend.css"
	rel="stylesheet">
<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
</head>

<body>
	<%@ include file="empNav.file"%>

	<div class="container-fluid">
		<div class="row">

			<%@ include file="empLSide.file"%>

			<div class="col-xs-12 col-sm-8">


				<h5 class="page-header text-right">�ثe��m:��ݭ���</h5>


				<div
					class="panel panel-default col-sm-offset-3 col-sm-6 text-center">

					<form action="" method="post">

						<div class="form-group pwd">
							<label for="empName" class="cols-sm-2 control-label">�m�W</label><span
								id="memIdShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="empName" id="memId"
										value="<%=(emp == null) ? "" : emp.getEmpName()%>"
										placeholder="�п�J�m�W" required />
								</div>
							</div>
						</div>


						<div class="form-group pwd">
							<label for="empName" class="cols-sm-2 control-label">�b��</label><span
								id="memIdShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-user fa"
										aria-hidden="true"></i></span> <input type="text"
										class="form-control" name="empId" id="memId"
										value="<%=(emp == null) ? "" : emp.getEmpId()%>"
										placeholder="�п�J�b��" required />
								</div>
							</div>
						</div>


						<div class="form-group">
							<label for="sel1">¾��</label> <select class="form-control" 
								id="sel1" name="empJob">
								<option value="�`�g�z">�`�g�z</option>
								<option value="��z">��z</option>
								<option value="�M��">�M��</option>
								<option value="�uŪ��">�uŪ��</option>
							</select>
						</div>

					</form>



				</div>




			</div>

			<script src="https://code.jquery.com/jquery.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>