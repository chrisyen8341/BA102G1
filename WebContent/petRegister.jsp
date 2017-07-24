<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>Title Page</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
	$(function() {

		$("#autoAddPet").click(function() {
			$("#petName").val("�樭��");
		});

	});
</script>



<!--[if lt IE 9]>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
			<![endif]-->
</head>
<body>
	<div class="container">
		<div class="row main">

			<div class="col-sm-6 col-sm-offset-3">

				<form class="" action="Register" method="post"
					enctype="multipart/form-data">



					<div id="petDiv">

						<div align="center">
							<Img src="images/logo.png" height="250px" width="100%" />
						</div>


						<div class="form-group">
							<label for="petName" class="cols-sm-2 control-label">�d���m�W</label><span
								id="petNameShow"></span>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="fa fa-lock fa-lg" aria-hidden="true"></i></span> <input
										type="text" class="form-control" name="petName" id="petName"
										placeholder="�п�J�z���d���m�W" />
								</div>
							</div>
						</div>


						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="petKind" class="control-label">�d������</label><br>
								<label class="radio-inline"><input type="radio"
									name="petKind" id="petOrNot_0" value="��" checked="true">��</label>
								<label class="radio-inline"><input type="radio"
									name="petKind" id="petOrNot_1" value="��">��</label> <label
									class="radio-inline"><input type="radio" name="petKind"
									id="petOrNot_2" value="��L">��L</label>
							</div>


							<div class="col-sm-6 form-group">
								<label for="petGender" class="control-label">�d���ʧO</label><br>
								<label class="radio-inline"><input type="radio"
									name="petGender" value="0" checked="true">�k</label> <label
									class="radio-inline"><input type="radio"
									name="petGender" value="1">�k</label>
							</div>

						</div>


						<div class="form-group">
							<label for="petImg" class="control-label">�d���Ӥ�</label><span
								id="petImgShow"></span><br> <input type="file"
								name="petImg" id="petImg" /> <img
								src="https://api.fnkr.net/testimg/350x200/00CED1/FFF/?text=img+placeholder"
								height="200px" width="150px" id="petPic" style="margin-top: 5px"><br>

						</div>

					</div>


					<input class="btn btn-primary btn-lg btn-block login-button"
						type="submit" value="���U">

				</form>

				<button type="button" class="btn btn-info" id="autoAddPet"
					style="margin-top: 10px">�s�W�d��</button>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>