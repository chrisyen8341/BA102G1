<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.member.model.*"%>
<%@ page import="com.letter.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>


<html lang="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Title Page</title>
    <link href="<%=request.getContextPath()%>/front_end/css/bootstrap.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/nav.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/colorplan.css" rel="stylesheet"> 
    <link href="<%=request.getContextPath()%>/front_end/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/modern-business.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/front_end/css/frontend.css" rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
</head>
<body >
	
	
 	<%@ include file="/front_end/frontEndNavBar.file"%>
 	
    
        
    <div class="container-fluid" >
    	<div class="row">    
            <%@ include file="leftbar.file" %> 
    
    
			<div class="col-xs-12 col-sm-8" style="margin-top:5px;" >
                <h5 class="page-header text-right">目前位置:站內信首頁</h5>
                 <div class="row" style="overflow-y:scroll;overflow-x:hidden;height:400px;" >                	
                    <div class="panel panel-default text-center " >                   
                        <div class="">                             
                            <div class="panel-body">										
									<c:forEach var="ltr" items="${letterSvc.getTagLtrs(member.getMemNo())}">				
										<div class="row text-center" ">										
											<a href='#modal-${ltr.letterNo}' data-toggle="modal" class="btn col-md-10" style="${ltr.letterState =='0' ? 'background-color:#e7e7e7;': 'background-color:white;'}">
												<table class="table table-hover table-condensed" >
													<tbody>
														<tr>
															<td>${ltr.letterTypeNo}</td>																									
															<td>${ltr.letterText}</td>	
															<td><fmt:formatDate value="${ltr.letterTime}" pattern="yyyy-MM-dd"/></td>										
														</tr>
													</tbody>	
												</table>
											</a>
											<div class="col-md-2">
												<input type="hidden" value="${ltr.letterNo}" >
												<c:if test = "${ltr.letterTag =='1'}" var="outcome" scope="page">
													<input type="button" value="已標註" class="btn btn-warning btn-sm" onclick="tag(this);" >						
												</c:if>
												<c:if test = "${outcome==false}">
													<input type="button" value="標註" class="btn btn-info btn-sm" onclick="tag(this);">						
												</c:if>
											</div>
										</div>
										<div class="modal fade" id="modal-${ltr.letterNo}">
													<div class="modal-dialog">
														<div class="modal-content">
															<div class="modal-header text-left">														
																<div class="modal-title">${ltr.letterTypeNo}</div>
															</div>
															<div class="modal-body text-left" style="height:300px;">
																${ltr.letterText}
															</div>
															<div class="modal-footer">
																<input type="hidden" value="${ltr.letterNo}" >
																<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="haveRead(this);" >確認</button>
															</div>
														</div>
													</div>
												</div>																												
									</c:forEach>										
                            </div>
                         
                                               
                         </div>                                
                    </div>  
					             
                </div>
				<%@ include file="/front_end/frontEndButtom.file"%>
            </div>
       </div>
     </div>
                
                <script type="text/javascript">
	                function tag(e){
	                	var ltrNo = $(e).prev().val();
	                	if($(e).val()=="標註"){
	                		$.ajax({
								url:"<%=request.getContextPath()%>/front_end/letter/letter.do",
								data:{
									action : 'updateTag',
									letterno : ltrNo					
								},
								type : 'POST',
								error : function(xhr) {
									alert('Ajax request 發生錯誤');
									},
								success : function(result) {
									$(e).val("已標註");
									$(e).attr("class","btn btn-warning btn-sm");
								}
							});	
	                	}else if($(e).val()=="已標註"){
	                		$.ajax({
								url:"<%=request.getContextPath()%>/front_end/letter/letter.do",
								data:{
									action : 'updateNotTag',
									letterno : ltrNo					
								},
								type : 'POST',
								error : function(xhr) {
									alert('Ajax request 發生錯誤');
									},
								success : function(result) {
									$(e).val("標註");
									$(e).attr("class","btn btn-info btn-sm");
								}
							});	
	                	}
	                }
                function haveRead(e){
                	
                	var ltrNo = $(e).prev().val();
                	$.ajax({
						url:"<%=request.getContextPath()%>/front_end/letter/letter.do",
						data:{
							action : 'updateRead',
							letterno : ltrNo					
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request 發生錯誤');
							},
						success : function(result) {
							$(e).parents(".fade").prev().find("a").css("background-color","white");
							$("span.badge").text(parseInt($("span.badge").text())-1);
						}
					});	  	
                }
                
                </script>
                
                
</body>
</html>