<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="com.restaurant.model.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="java.util.*"%>

<%@ include file="header.file"%>

<jsp:useBean id = "dSvc" scope="page" class="com.dateitem.model.DateItemService" />

<%
Member member = (Member) session.getAttribute("member");
List<DateItemVO> list = dSvc.findByBuyer_future(member.getMemNo());
pageContext.setAttribute("list",list);
%>




<head><title>�ʶR����</title></head>
<body bgcolor='white'>

<%@ include file="nav.file"%>
<%@ include file="sidelist.file"%>

<!-- JSP�H�@�ӥ]�t��u��div�}�l, ���O������</div>�g�bfooter�̭� -->

<div class="col-xd-12 col-sm-8 col-sm-offset-1 main-page-show">

					<ul class="list-inline amos">
						    <li><a href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=list_buyer_future">�i�椤�����|</a></li>
					<li><a href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=list_buyer_history">�L�h�����|���</a></li>
					</ul>
  
  <c:if test="${not empty itemPurchased}">
  <h1>�z�w�ʶR���\�A�s�W�@������!</h1>
   <c:remove var="itemPurchased" scope="request"/>
  </c:if>
  
  
  <table class="table text-align:center">
	<tr>
		<th align="center">�s��</th>
		<th align="center">�ɶ�</th>
		<th align="center">��a</th>
<th></th>

	</tr>
<%@ include file="page3.file"%>
<c:forEach var="dateitem" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr align='center' valign='middle'>
			<td>${dateitem.dateItemNo}</td>
			<td>${dSvc.getTimeForYMD(dateitem.dateMeetingTime)}</td>
			<td>${dateitem.sellerNo}</td>

			<td><a class="btn btn-primary" data-toggle="modal" data-target="#modal-cancel" href="#">�ڭn����</a></td>
			<td><a class="btn btn-primary" data-toggle="modal" data-target="#modal-app" href="#">�ڭn�ӶD</a></td>
		</tr>
		
<!-- ================================================�������s��modal,�����bforeach��=====		 -->
		<div id="modal-cancel" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">�������|�w�w</h4>
      </div>
      <div class="modal-body">
        <p></p>
        <p>�T�w�w����?</p>
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-default" href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=cancel_date&dateItemNo=${dateitem.dateItemNo}&fromwho=buyer">�T�{����</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">�^�W�@��</button>
      </div>
    </div>

  </div>
</div>
<!-- ================================================�������s��modal,�����bforeach��=====		 -->		
  </c:forEach>
  
  
  
</table>



<%@ include file="footer.file"%>




