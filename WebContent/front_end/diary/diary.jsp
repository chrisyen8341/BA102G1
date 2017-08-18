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
	
	DiaryService diaSvc = new DiaryService();
    List<Diary> list = diaSvc.getAll();
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
    <link href="<%=request.getContextPath()%>/front_end/font-awesome/css/font-awesome.css" rel="stylesheet" type="text/css">
    <link href="<%=request.getContextPath()%>/front_end/css/frontend.css" rel="stylesheet" type="text/css">
	<link href="<%=request.getContextPath()%>/front_end/css/modern-business.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 	<script src="http://code.jquery.com/jquery-1.10.1.min.js"></script> -->
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
                <%@ include file="page1.file" %> 
                <c:forEach var="diary" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                <div class="row">
                    <div class="panel panel-default col-sm-8 col-sm-offset-2 top-margin-sm">
                        <div class="">
                            <div class="panel-heading">
                                <h3 class="panel-title">${diary.diaName}</h3>
                                <h3 class="panel-title text-right">�̫�o��:<fmt:formatDate value="${empty diary.diaCreTime? diary.diaModTime:diary.diaCreTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
                            </div>
                            <div class="panel-body">
                                <blockquote class="blockquote">
                                    <p class="text-justify">${diary.diaText}</p>
                                    <footer class="text-right">posted by
                                        <cite>                                     			
                                       		<a href="<%=request.getContextPath()%>/front_end/diary/personalDiary.jsp?memNo=${diary.getMemNo()}">${memSvc.getOneMember(diary.getMemNo()).getMemSname()}</a>				 
                                        </cite>
                                    </footer>
                                </blockquote>
                            </div>
                         </div>
                            <div class="text-center ">
                            	<div class="row">
                            		<img src="<%=request.getContextPath()%>/front_end/diary/ShowImage?diano=${diary.diaNo}" style='height:auto;width:400px;display:${empty diary.diaImg ? "none":""};'></img>
                            	</div>
                            </div>   
							<!-- �s�W�d���� -->
                            <div  class="panel-body" >	
                            	<c:if test="${ !empty member  }">
	                             	<div style="padding-top:10px ; ">	                            		
											<input type="hidden" name="diano" value="${ diary.diaNo }"> 
											<textarea rows="2" cols="60" name="diamsgtext" placeholder="�d��......" ></textarea>
											<input type="submit" value="�e�X" onclick="insertMsg(this);"><br>										
	                            	</div>
	                            </c:if>
							<!--  �q�X�d����    -->                            		
                            	<c:forEach var="diamsg" items="${diaMsgSvc.getAllMsgFromDia(diary.diaNo)}">
                            		<div class="" style="border-top:1px black solid;">
                            			<div >
                            				<p style="margin:0px;">${diamsg.diaMsgText }</p>
                            			</div>	
		                            	<div class="text-right" >
		                            		<fmt:formatDate value="${diamsg.diaMsgTime }" pattern="yyyy-MM-dd HH:mm:ss"/>	                            				
		                            			${memSvc.getOneMember(diamsg.memNo).getMemSname()}
	<!-- 	                            �ק�ۤv���d���� -->
		                            		<c:if test="${ diamsg.memNo==member.memNo}">											
												<input type="hidden" value="${ diamsg.diaMsgNo }"> 
												<input type="button" value="�ק�" onclick="updateMsg(this);" >
												<input type="button" value="�R��" onclick="deleteMsg(this);">
		                            		</c:if>
		                            	</div>	                            				
                            		</div>
                            		</c:forEach>	
                            </div>                             
                    </div>                
                </div>
                </c:forEach>
               
<!--                 ��ܭ��� -->
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
<!--                         <li><a href="#">�e�@��</a></li> -->
<!--                         <li><a href="#">�U�@��</a></li> -->
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
						alert('Ajax request �o�Ϳ��~');
						},
					success : function(data) {		
						var obj = JSON.parse(data);//�নjson�榡	
						$('<div>').attr({"class":"","id":"newMsg"}).css("border-top","1px black solid").appendTo($(e).parent().parent());
						$('<div>').attr("id","newP").appendTo('#newMsg');
						$('<p>').css("margin","0px").text(diaMsgText).appendTo('#newP');
						$('<div>').attr({"class":"text-right","id":"newName"}).text(obj.diaMsgTime+" "+obj.sname+" ").appendTo('#newMsg');
						$('<input>').attr({"type":"hidden","value":obj.curr}).appendTo('#newName');
						$('<input>').attr({"type":"button","value":"�ק�","onclick":"updateMsg(this);"}).appendTo('#newName');
						$('<input>').attr({"type":"button","value":"�R��","onclick":"deleteMsg(this);"}).appendTo('#newName');
						$('#newMsg').removeAttr('id');
						$('#newP').removeAttr('id');
						$('#newName').removeAttr('id');
					}
				});
				
			}											
			function updateMsg(e){
				if($(e).val()=="�ק�"){
					
					$('<textarea>').attr("cols","62").css("resize","none").text($(e).parent().prev().find('p').text()).appendTo($(e).parent().prev());									                	
					$(e).parent().prev().find('p').remove();
					$(e).val('�T�w');
					$(e).next().val('����');
				}else if($(e).val()=="�T�w"){
											                			
					$.ajax({ 
						url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
						data : {
							action : 'update',
							diamsgtext : $(e).parent().prev().find('textarea').val(),
							diamsgno : $(e).prev().val()
												            						
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request �o�Ϳ��~');
							},
						success : function(result) {			            						
							var textarea = $(e).parent().prev().find('textarea');
							$('<p>').css("margin","0px").text(textarea.val()).appendTo($(e).parent().prev()); 										            						
							textarea.remove();
							}
							});
						$(e).val('�ק�');
						$(e).next().val('�R��');
							}	
					}
			function deleteMsg(e){
				if($(e).val()=="�R��"){
					$.ajax({ 
						url : "<%=request.getContextPath()%>/front_end/diary/diaMsg.do",
						data : {
							action : 'delete',
							diamsgno : $(e).prev().prev().val()	
						},
						type : 'POST',
						error : function(xhr) {
							alert('Ajax request �o�Ϳ��~');
						},
						success : function(result) {
							 $(e).parent().parent().remove();
										            						
						}
					});
				}else if($(e).val()=="����"){
					var textarea = $(e).parent().prev().find('textarea');
					$('<p>').css("margin","0px").text(textarea.text()).appendTo($(e).parent().prev()); 										            						
					textarea.remove();
								            						
					$(e).val('�R��');
					$(e).prev().val("�ק�");
				}
			}
										                	
 		</script>         
        
   
</body>
</html>