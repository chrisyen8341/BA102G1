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
List<DateItemVO> list = dSvc.findBySeller_onsale(member.getMemNo());
pageContext.setAttribute("list",list);
%>




<head><title>��a����</title></head>
<body bgcolor='white'>

<%@ include file="/front_end/frontEndNavBar.file"%>
<%@ include file="sidelist.file"%>

<!-- JSP�H�@�ӥ]�t��u��div�}�l, ���O������</div>�g�bfooter�̭� -->

<div class="col-xd-12 col-sm-8 col-sm-offset-1 main-page-show">

					<ul class="list-inline amos">
					<li><a href="<%=request.getContextPath() %>/front_end/dateitem/list_seller_future.jsp">�i�椤�����|</a></li>
					<li><a href="<%=request.getContextPath() %>/front_end/dateitem/list_seller_onsale.jsp">�W�[�������|</a></li>
					<li><a href="<%=request.getContextPath() %>/front_end/dateitem/list_seller_history.jsp">�L�h�����|���</a></li>
					</ul>
  
   <c:if test="${empty list}"> 
   <h1>�z�S������i�椤�����|!</h1> 
<%--    <c:remove var="itemPurchased" scope="request"/> --%>
   </c:if> 
   <c:if test="${not empty itemAdded}">
  <h1>�z�w�W�[�@�����|�A�g�J�z������!</h1>
   <c:remove var="itemAdded" scope="request"/>
  </c:if>
  
  
  <table class="table text-align:center">
	<tr>
		<th align="center">�s��</th>
		<th align="center">�ɶ�</th>
		<th align="center">�R�a</th>
<th></th>

	</tr>
<%@ include file="page3.file"%>
<c:forEach var="dateitem" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr align='center' valign='middle'>
			<td>${dateitem.dateItemNo}</td>
			<td>${dSvc.getTimeForYMD(dateitem.dateMeetingTime)}</td>
			<td>${dateitem.buyerNo}</td>

			<td><a class="btn btn-primary" data-toggle="modal" data-target="#modal-cancel" href="#">�U�[�o�Ӱӫ~</a></td>
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
        <p>�T�w�U�[��?</p>
        <p>��L�H�N�|�ݤ���o�Ӭ��|~</p>
      </div>
      <div class="modal-footer">
        <a type="button" class="btn btn-default" href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=cancel_date&dateItemNo=${dateitem.dateItemNo}&fromwho=seller">�T�{�U�[</a>
        <button type="button" class="btn btn-default" data-dismiss="modal">�^�W�@��</button>
      </div>
    </div>

  </div>
</div>
<!-- ================================================�������s��modal,�����bforeach��=====		 -->		
  </c:forEach>
  
  
  
</table>



<%@ include file="footer.file"%>





