<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.emp.model.*"%>
<%
	Emp empVO = (Emp) request.getAttribute("empVO"); //EmpServlet.java (Concroller), �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
%>
<!DOCTYPE html>
<html lang="">
<%
	Emp emp = (Emp) request.getAttribute("emp");
	pageContext.setAttribute("emp", emp);
%>
<head>
<%@ include file="empHeader.file"%>

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

										<table border='1' cellpadding='5' cellspacing='0' width='400'>
											<tr bgcolor='#CCCCFF' align='center' valign='middle'
												height='20'>
												<td>
													<h3>���u��ƭק�</h3> <a
													href="<%=request.getContextPath()%>/back_end/emp/authManage.jsp">�^����</a>
												</td>
											</tr>
										</table>

										<h3>��ƭק�:</h3>
										<%-- ���~��C --%>
										<c:if test="${not empty errorMsgs}">
											<font color='red'>�Эץ��H�U���~:
												<ul>
													<c:forEach var="message" items="${errorMsgs}">
														<li>${message}</li>
													</c:forEach>
												</ul>
											</font>
										</c:if>

										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/back_end/emp/EmpServlet.do"
											name="form1">
											<table border="0">




												<tr>
													<td>���u�s��:<font color=red><b>*</b></font></td>
													<td><%=empVO.getEmpNo()%></td>
												</tr>



												<tr>
													<td class="title">���u�m�W:</td>
													<td><input type="text" class="form-control"
														name="empName" id="empName" value="<%=empVO.getEmpName()%>"
														placeholder="��J���u�m�W" /></td> 
												</tr>


												<tr>
													<td class="title">¾��</td>
													<td><select class="form-control" id="sel1"
														name="empJob" value="<%=empVO.getEmpJob()%>">
															<option value=""></option>
															<option value="�`�g�z">�`�g�z</option>
															<option value="��z">��z</option>
															<option value="�M��">�M��</option>
															<option value="�uŪ��">�uŪ��</option>
													</select></td>
												</tr>


												<tr>
													<td class="title">���Τ��</td>
													<td><input type="date" name="empHireDate"
														min="1910-01-01" max='2000-13-13' id="empHireDate"
														value="<%=empVO.getEmpHireDate()%>" class="form-control"
														placeholder="Confirm your Password" /></td>
												</tr>









											</table>
											<br> <input type="hidden" name="action" value="update">
											<input type="hidden" name="empno"
												value="<%=empVO.getEmpNo()%>"> <input type="hidden"
												name="requestURL"
												value="<%=request.getParameter("requestURL")%>">
											<!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
											<input type="hidden" name="whichPage"
												value="<%=request.getParameter("whichPage")%>">
											<!--�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp-->
											<input type="submit" value="�e�X�ק�">
										</FORM>

										<br>�e�X�ק諸�ӷ��������|:
										<br>
										<b> <font color=blue>request.getParameter("requestURL"):</font>
											<%=request.getParameter("requestURL")%><br> <font
											color=blue>request.getParameter("whichPage"):</font> <%=request.getParameter("whichPage")%>
											(���d�ҥثe�Ω�:istAllEmp.jsp �P �ƦX�d�� listEmps_ByCompositeQuery.jsp)
										</b>
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



			</div>

			<script src="https://code.jquery.com/jquery.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

			<script>
				
			</script>
</body>
</html>
