<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.diary.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.submem.model.*"%>
<%@ page import="com.letter.model.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Member member = (Member)session.getAttribute("member");
	DiaryService diaSvc = new DiaryService();
	List<Diary> list = diaSvc.getAllFromMemNo(member.getMemNo());
	pageContext.setAttribute("list",list);
%>


<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemberService"/>
<jsp:useBean id="diaMsgSvc" scope="page" class="com.diamsg.model.DiaMsgService"/>


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
    
                <h5 class="page-header text-right">目前位置:日誌首頁</h5>
                <%@ include file="page1.file" %>
                
                <%-- 錯誤表列 --%>
                <div class="row">
                	<div class=" col-sm-8 col-sm-offset-2">
						<c:if test="${not empty errorMsgs}">
							<font color='red'>請修正以下錯誤:
							<ul>
								<c:forEach var="message" items="${errorMsgs}">
									<li>${message}</li>
								</c:forEach>
							</ul>
							</font>
						</c:if>
                	</div>
                </div>
                <div class="row" style="padding-top:0px;margin:0px;top:0px;" >
                	<div class=" col-sm-8 col-sm-offset-2   ">
<!--                 	此為新增日誌區 -->
						<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data">
					
							<input type="hidden" name="memno" value="${member.memSname}"><br>
							日誌名稱<br>
							<input type="text" name="dianame" ><br>
							<textarea rows="5" cols="80" name="diatext" ></textarea><br>
							<input type="file" name="diaimg">
							<input type="hidden" name="action" value="insert">
							<input type="submit" value="Upload"><br>
										
						</form>
                	</div>
                </div>

                <c:forEach var="diary" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                <div class="row">
                    <div class="panel panel-default col-sm-8 col-sm-offset-2 top-margin-sm">
                        <div class="">
                        	<div class="text-right">
<!--                         	修改日誌的部分 -->
                        		<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data">
		                        	<input type="hidden" name="action" value="getOne_For_Update">
		                        	<input type="hidden" name="diano" value="${diary.diaNo}">
									<input type="submit" value="修改">
								</form>
<!-- 								刪除日誌的部分 -->
								<form action="<%=request.getContextPath()%>/front_end/diary/diary.do" method=post enctype="multipart/form-data">
		                        	<input type="hidden" name="action" value="delete">
		                        	<input type="hidden" name="diano" value="${diary.diaNo}">
									<input type="submit" value="刪除"><br>
								</form>
							</div>
                            <div class="panel-heading">
                                <h3 class="panel-title">${diary.diaName}</h3>
                                <h3 class="panel-title text-right">最後發表:<fmt:formatDate value="${empty diary.diaCreTime? diary.diaModTime:diary.diaCreTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
                            </div>
                            <div class="panel-body">
                                <blockquote class="blockquote">
                                    <p class="text-justify">${diary.diaText}</p>
                                    <footer class="text-right">posted by
                                        <cite>${member.memSname}</cite>
                                    </footer>
                                </blockquote>
                            </div>
                         </div>
                            <div class="text-center ">
                            	<div class="row">
                            		<img src="<%=request.getContextPath()%>/front_end/diary/ShowImage?diano=${diary.diaNo}" style='height:auto;width:auto;display:${empty diary.diaImg ? "none":""};'></img>
                            	</div>
                            </div>
                            <!-- 新增留言區 -->
                            <div  class="panel-body" >	
                            	<c:if test="${ !empty member  }">
	                             	<div style="padding-top:10px ; ">	                            		
											<input type="hidden" name="diano" value="${ diary.diaNo }"> 
											<textarea rows="2" cols="60" name="diamsgtext" placeholder="留言......" ></textarea>
											<input type="submit" value="送出" onclick="insertMsg(this);"><br>										
	                            	</div>
	                            </c:if>
							<!--  秀出留言區    -->                            		
                            	<c:forEach var="diamsg" items="${diaMsgSvc.getAllMsgFromDia(diary.diaNo)}">
                            		<div class="" style="border-top:1px black solid;">
                            			<div >
                            				<p style="margin:0px;">${diamsg.diaMsgText }</p>
                            			</div>	
		                            	<div class="text-right" >
		                            		<fmt:formatDate value="${diamsg.diaMsgTime }" pattern="yyyy-MM-dd HH:mm:ss"/>	                            				
		                            			${memSvc.getOneMember(diamsg.memNo).getMemSname()}
							<!--  修改自己的留言區 -->
		                            		<c:if test="${ diamsg.memNo==member.memNo}">											
												<input type="hidden" value="${ diamsg.diaMsgNo }"> 
												<input type="button" value="修改" onclick="updateMsg(this);" >
												<input type="button" value="刪除" onclick="deleteMsg(this);">
		                            		</c:if>
		                            	</div>	                            				
                            		</div>
                            		</c:forEach>	
                            </div>        
                            
                                                 
                    </div>
                </div>
                </c:forEach>
                
<!--                 顯示頁數 -->
                <div class="text-center">               	   
                <%@ include file="page2.file" %> 
<!--                     <ul class="pagination"> -->
<!--                         <li><a href="#">&laquo;</a></li> -->
<!--                         <li><a href="#">1</a></li> -->
<!--                         <li><a href="#">2</a></li> -->
<!--                         <li class="active"><a href="#">3</a></li> -->
<!--                         <li><a href="#">4</a></li> -->
<!--                         <li><a href="#">5</a></li> -->
<!--                         <li><a href="#">&raquo;</a></li> -->
<!--                     </ul> -->
                    <br>
<!--                     <ul class="pager"> -->
<!--                         <li><a href="#">前一頁</a></li> -->
<!--                         <li><a href="#">下一頁</a></li> -->
<!--                     </ul> -->
                </div>
                <%@ include file="/front_end/frontEndButtom.file"%>
             </div>
           </div>   
 		<script type="text/javascript">
			function insertMsg(e){
				var diaNo = $(e).prev().prev().val();
				var diaMsgText = $(e).prev().val();
				$.ajax({ 
					url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
					data : {
						action : 'insert',
						diamsgtext : diaMsgText,
						diano : diaNo
											            						
					},
					type : 'POST',
					error : function(xhr) {
						alert('Ajax request 發生錯誤');
						},
					success : function(data) {		
						var obj = JSON.parse(data);//轉成json格式	
						$('<div>').attr({"class":"","id":"newMsg"}).css("border-top","1px black solid").appendTo($(e).parent().parent());
						$('<div>').attr("id","newP").appendTo('#newMsg');
						$('<p>').css("margin","0px").text(diaMsgText).appendTo('#newP');
						$('<div>').attr({"class":"text-right","id":"newName"}).text(obj.diaMsgTime+" "+obj.sname+" ").appendTo('#newMsg');
						$('<input>').attr({"type":"hidden","value":obj.curr}).appendTo('#newName');
						$('<input>').attr({"type":"button","value":"修改","onclick":"updateMsg(this);"}).appendTo('#newName');
						$('<input>').attr({"type":"button","value":"刪除","onclick":"deleteMsg(this);"}).appendTo('#newName');
						$('#newMsg').removeAttr('id');
						$('#newP').removeAttr('id');
						$('#newName').removeAttr('id');
					}
				});
				
			}											
			function updateMsg(e){
				if($(e).val()=="修改"){					
					$('<textarea>').attr("cols","62").css("resize","none").text($(e).parent().prev().find('p').text()).appendTo($(e).parent().prev());									                	
					$(e).parent().prev().find('p').remove();
					$(e).val('確定');
					$(e).next().val('取消');
				}else if($(e).val()=="確定"){
											                			
					$.ajax({ 
						url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
						data : {
							action : 'update',
							diamsgtext : $(e).parent().prev().find('textarea').val(),
							diamsgno : $(e).prev().val()											            						
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request 發生錯誤');
							},
						success : function(result) {			            						
							var textarea = $(e).parent().prev().find('textarea');
							$('<p>').css("margin","0px").text(textarea.val()).appendTo($(e).parent().prev()); 										            						
							textarea.remove();
							}
							});
						$(e).val('修改');
						$(e).next().val('刪除');
							}	
					}
			function deleteMsg(e){
				if($(e).val()=="刪除"){
					$.ajax({ 
						url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
						data : {
							action : 'delete',
							diamsgno : $(e).prev().prev().val()	
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request 發生錯誤');
						},
						success : function(result) {
							 $(e).parent().parent().remove();
										            						
						}
					});
				}else if($(e).val()=="取消"){
					var textarea = $(e).parent().prev().find('textarea');
					$('<p>').css("margin","0px").text(textarea.text()).appendTo($(e).parent().prev()); 										            						
					textarea.remove();
								            						
					$(e).val('刪除');
					$(e).prev().val("修改");
				}
			}
										                	
 		</script>                   
</body>
</html>