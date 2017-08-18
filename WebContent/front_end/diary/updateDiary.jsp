<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.letter.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Title Page</title>
    <link href="<%=request.getContextPath()%>/front_end/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/nav.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/colorplan.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/front_end/css/modern-business.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/date.css" rel="stylesheet">
    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/front_end/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/frontend.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.img-bg{
    opacity:1;
    background-color:#ccc;
    max-width: 100%;
    display: block;
    margin: 0 auto;
}
</style>
<body>
	
	<%@ include file="/front_end/frontEndNavBar.file"%>
    <%@ include file="leftbar.file" %>
    <div class="col-xs-12 col-sm-8 " >
                <div class="row">
    
                <h5 class="page-header text-right">�ثe��m:��x����</h5>
                
                
                <%-- ���~��C --%>
                <div class="row">
                	<div class=" col-sm-8 col-sm-offset-2">
						<c:if test="${not empty errorMsgs}">
							<font color='red'>�Эץ��H�U���~:
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li>${message}</li>
								</c:forEach>
							</ul>
							</font>
						</c:if>
                	</div>
                </div>
                <div class="row addmargin">
                	<div class=" col-sm-8 col-sm-offset-2   ">
<!--                 	�����ק��x�� -->
						<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data">
					
							
							��x�W��<br>
							<input type="hidden" name="diano" value="${diary.diaNo}"><br>
							<input type="text" name="dianame" value="${diary.diaName}"><br>
							<textarea rows="5" cols="80" name="diatext" >${diary.diaText}</textarea><br>
							<input type="file" name="diaimg" >
							<input type="hidden" name="action" value="update">
							<input type="submit" value="�T�w"><br>
							
						</form>
                	</div>
                </div>

                <%@ include file="/front_end/frontEndButtom.file"%>
              </div>
             </div>
</body>
</html>