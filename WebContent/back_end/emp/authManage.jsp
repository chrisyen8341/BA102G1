<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.emp.model.*"%>
<!DOCTYPE html>
<html lang="">
<%
	Emp emp = (Emp) request.getAttribute("emp");
	pageContext.setAttribute("emp", emp);
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


<style>
.submit {
	matgin-top: 20px;
}
</style>
</head>

<body>
	<%@ include file="empNav.file"%>

	<div class="container-fluid">
		<div class="row">

			<%@ include file="empLSide.file"%>

			<div class="col-xs-12 col-sm-8">


				<h5 class="page-header text-right">�ثe��m:��ݭ���</h5>


				<div class="row">

					<div class="panel panel-info">

						<div class="panel-heading">
							<h3 class="panel-title">${member.memId}</h3>
						</div>

						<div class="panel-body">


							<div class="row">

								<div class=" col-md-9 col-lg-9 ">
									<tbody>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/emp/emp.do"
											name="form1">
											<table class="table table-user-information">



												<tr>
													<b><font>�d�߭��u:</font></b>
												</tr>

												<tr>
													<td class="title">���u�s��:</td>
													<td><input type="text" class="form-control"
														name="empno" id="memSname" value="6001"
														placeholder="�п�J���u�s��" /></td>
												</tr>
		

												<tr>
													<td class="title">���u�m�W:</td>
													<td><input type="text" class="form-control"
														name="ename" id="memSname" value="�d�ç�"
														placeholder="��J���u�m�W" /></td>
												</tr>


												<tr>
													<td class="title">¾��</td>
													<td><select class="form-control" id="sel1"
														name="empJob">
															<option value="�`�g�z">�`�g�z</option>
															<option value="��z">��z</option>
															<option value="�M��">�M��</option>
															<option value="�uŪ��">�uŪ��</option>
													</select></td>
												</tr>


												<tr>
													<td class="title">���Τ��</td>
													<td><input type="date" name="memBday" min="1910-01-01"
														max='2000-13-13' id="memBday" value="${member.memBday}"
														class="form-control" placeholder="Confirm your Password" /></td>
												</tr>





											</table>

											<input type="hidden" name="action" value="memUpdate">
											<input type="submit" value="�ק�" class="btn btn-primary">

										</FORM>
									</tbody>


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
							</div>
						</div>
					</div>
				</div>



































				<!-- 				<div class="panel panel-default col-sm-offset-3 col-sm-6 text-center"> -->

				<!-- 					<FORM METHOD="post" -->
				<%-- 						ACTION="<%=request.getContextPath()%>/emp/emp.do" name="form1"> --%>
				<!-- 						<b><font color=blue>�U�νƦX�d��:</font></b> <br>  -->
				<!-- 						<b>��J���u�s��:</b>  -->
				<!-- 						<input type="text" name="empno" value="7001"><br>  -->

				<!-- 						<b>��J���u�m�W:</b> -->
				<!-- 						<input type="text" name="ename" value="KING"><br> -->



				<!-- 						<b>��ܳ���:</b>  -->


				<!-- 						<div class="form-group"> -->
				<!-- 							<label for="sel1">¾��</label> <select class="form-control" -->
				<!-- 								id="sel1" name="empJob"> -->
				<!-- 								<option value="�`�g�z">�`�g�z</option> -->
				<!-- 								<option value="��z">��z</option> -->
				<!-- 								<option value="�M��">�M��</option> -->
				<!-- 								<option value="�uŪ��">�uŪ��</option> -->
				<!-- 							</select> -->
				<!-- 						</div> -->

				<!-- 						<br>  -->
				<!-- 						<b>���Τ��:</b> <input class="cal-TextBox" -->
				<!-- 							onFocus="this.blur()" size="9" readonly type="text" -->
				<!-- 							name="hiredate" value="1981-11-17">  -->
				<!-- 							<a class="so-BtnLink" -->
				<!-- 							href="javascript:calClick();return false;" -->
				<!-- 							onmouseover="calSwapImg('BTN_date', 'img_Date_OVER',true);" -->
				<!-- 							onmouseout="calSwapImg('BTN_date', 'img_Date_UP',true);" -->
				<!-- 							onclick="calSwapImg('BTN_date', 'img_Date_DOWN');showCalendar('form1','hiredate','BTN_date');return false;"> -->
				<!-- 						</a> <input type="submit" value="�e�X"> <input type="hidden" -->
				<!-- 							name="action" value="listEmps_ByCompositeQuery"> -->
				<!-- 					</FORM> -->


				<!-- 				</div> -->




			</div>

			<script src="https://code.jquery.com/jquery.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

			<script>
				
			</script>
</body>

</html>