<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.member.model.*"%>
<%request.setCharacterEncoding("UTF-8");%>  
<%response.setCharacterEncoding("UTF-8");%> 



<html>
<head>
<script src="<%=request.getContextPath() %>/front_end/js/jquery.js"></script>
<script src="<%=request.getContextPath() %>/front_end/js/bootstrap.min.js"></script>
<%@ include file="page4.file" %>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	Member mem=(Member)session.getAttribute("member");

%>
<%@ include file="/front_end/frontEndNavBar.file" %>
<%@ include file="page2.file" %>


<div class="container">
	 <div style="margin-left:20px;">	
      <h2>確認你的訂單資訊</h2>
      </div>
      <div style="margin-top:2cm">
      <form class="col-sm-8" action="<%=request.getContextPath()%>/OrderInsert" method="POST">
        <div class="form-group">
          <label for="name">訂購人姓名:</label>
          <input type="text" class="form-control" id="name" value="<%= mem.getMemName()%>">
        </div>
        <div class="form-group">
          <label for="addr">訂購人住址:</label>
          <input type="text" class="form-control" id="addr" value="<%= mem.getMemAddress()%>">
        </div>
        <div class="form-group">
          <label for="tel">訂購人電話:</label>
          <input type="text" class="form-control" id="tel" value="<%= mem.getMemPhone()%>">
        </div>
        <div class="form-group">
          <label for="tel">訂單總金額:</label>
          <input type="text" class="form-control" id="tel" value="<%= session.getAttribute("amount")%>">
        </div>
        <button type="submit" class="btn btn-default">確定付款</button>
        
      </form>
      </div>
    </div>



<%@ include file="/front_end/frontEndButtom.file" %>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

</body>
</html>