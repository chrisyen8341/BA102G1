<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5" %>
<%@ page import="com.member.model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<% Member member=(Member)request.getAttribute("member"); %>

<!DOCTYPE html>
<html lang="">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
	<title>Title Page</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<%@ include file="registerTest.file" %>
	
		<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->

</head>
<body>
	<div class="container">
		<div class="row main">

			<div class="col-sm-6 col-sm-offset-3">

				<form class="" action="Register" method="post" enctype="multipart/form-data">

					<div class="row">

						<div class="col-sm-6 form-group">
							<label for="memSname" class="cols-sm-2 control-label">�ʺ�</label><span id="memSnameShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="memSname" id="memSname" value="${member.memSname}" placeholder="�п�J�ʺ�"/>
								</div>
							</div>
						</div>


						<div class="col-sm-6 form-group">
							<label for="memName" class="cols-sm-2 control-label">�m�W</label><span id="memNameShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="memName" id="memName"  value="${member.memName}" placeholder="�п�J�z���m�W"/>
								</div>
							</div>
						</div>


					</div>



					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="memBday" class="cols-sm-2 control-label">�ͤ�</label><span id="memBdayShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="date" name="memBday" min="1910-01-01"  max='2000-13-13' id="memBday" value="${member.memBday}" class="form-control" placeholder="Confirm your Password"/>
								</div>
							</div>
						</div>


						<div class="col-sm-6 form-group">
							<label for="memPhone" class="cols-sm-2 control-label">���</label><span id="memPhoneShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
									<input type="text" class="form-control" name="memPhone" id="memPhone" value="${member.memPhone}" placeholder="�п�J�z�����"/>
								</div>
							</div>
						</div>

					</div>


					<div class="row">

						<div class="col-sm-6 form-group">
							<label for="memGender" class="control-label">�ʧO</label><br>
							<label class="radio-inline"><input type="radio" name="memGender" checked="true" value="0">�k</label>
							<label class="radio-inline"><input type="radio" name="memGender" value="1">�k</label>
							<label class="radio-inline"><input type="radio" name="memGender" value="2">�ĤT��</label>
						</div>

						<div class="col-sm-6 form-group">
							<label for="memRelation" class="control-label">�P�����A</label><br>
							<label class="radio-inline"><input type="radio" name="memRelation" checked="true" value="0">�樭</label>
							<label class="radio-inline"><input type="radio" name="memRelation" value="1">í�w�橹</label>
							<label class="radio-inline"><input type="radio" name="memRelation" value="2">�����}</label>
						</div>

					</div>



					<div class="form-group">
						<label for="memAddress" class="cols-sm-2 control-label">�a�}</label><span id="memAddressShow"></span>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<textarea class="form-control" id="memAddress" name="memAddress" value="${member.memAddress}" placeholder="�п�J�z���a�}"></textarea>
							</div>
						</div>
					</div>


					<div class="form-group">
						<label for="memEmail" class="cols-sm-2 control-label">�q�l�H�c</label><span id="memEmailShow"></span>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<input type="text" class="form-control" name="memEmail" id="memEmail" value="${member.memEmail}"  placeholder="�п�J�z���q�l�H�c"/>
							</div>
						</div>
					</div>



					<div class="form-group">
						<label for="memSelfintro" class="cols-sm-2 control-label">�����(�W��300�r)</label><span id="memSelfintroShow"></span>
						<div class="cols-sm-10">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
								<textarea class="form-control" id="memSelfintro" name="memSelfintro" value="${member.memSelfintro}" placeholder="��J������A����T�a"></textarea>
							</div>
						</div>
					</div>


					<div class="row">

						<div class="col-sm-6 form-group">
							<label for="memImg" class="control-label ">�Ӥ�</label><span id="memImgShow"></span> <br>
							<input  type="file"  name="memImg" id="memImg" placeholder="�п�ܷӤ�"/>
							<img src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder" height="200px" width="150px" id="memPic" style="margin-top: 5px "><br>		
						</div>

						<div class="col-sm-6 form-group">							
							<a href="#" class="btn btn-link">�s�W�d��</a>
						</div>

					</div>

					

					<input class="btn btn-primary btn-lg btn-block login-button" type="submit" value="���U">

				</form>

				<button type="button" class="btn btn-info" id="autoAddMem" style="margin-top: 10px">�s�W�@��|��</button>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>