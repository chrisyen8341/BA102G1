<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="com.restaurant.model.*" %>
<%@ page import="com.member.model.*" %>
<%@ page import="java.util.*"%>

<%@ include file="header.file"%>

<jsp:useBean id = "dSvc" scope="page" class="com.dateitem.model.DateItemService" />
<jsp:useBean id = "memSvc" scope="page" class="com.member.model.MemberService" />
<%
    List<DateItemVO> list = dSvc.getAllItems();
    pageContext.setAttribute("list",list);
%>




<head><title>���|����</title></head>
<body bgcolor='white'>



<%@ include file="nav.file"%>
<%@ include file="sidelist.file"%>

<%-- <%@ include file="page3.file"%>	 --%>

<!-- JSP�H�@�ӥ]�t��u��div�}�l, ���O������</div>�g�bfooter�̭� -->

<div class="col-xd-12 col-sm-10  main-page-show">
<div class="col-sm-10 col-sm-offset-1">
<Form method="post" action="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do">
<span >

<input type="hidden" name="action" value="searchDateItem">
<input type="date" id="datepicker" name="dateMeetingTime">
  <select class="w3-select selectpicker" name="memGender">
    <option value="" disabled selected>�п�ܥD�H�ʧO</option>
    <option value="">�ҥi</option>
    <option value="0">�k</option>
    <option value="1">�k</option>
    <option value="2">���@�z�S</option>
  </select>
  
  <select class="w3-select selectpicker" name="petGender">
    <option value="" disabled selected>�п���d��</option>
    <option value="">�ҥi</option>
    <option value="0">��</option>
    <option value="1">��</option>
    <option value="2">��L</option>
  </select>
    
	<input type="submit">
<!--   <button class="btn btn-lg btn-warning glyphicon glyphicon-search"> </button> -->

 </span> 
</Form>
 </div>
 
 
  <c:forEach var="dateitem" items="${list}">
          <div class="col-sm-4 ">
            <div class="bg-color">
            <div class="card hovercard">
                <div class="cardheader" style="background-image:url('<%=request.getContextPath()%>/ImgReader?dateItemNo=${dateitem.dateItemNo}&action=dateImg');">

                </div>
                <div class="avatar">
                    <img src="<%=request.getContextPath()%>/ImgReader?sellerNo=${dateitem.sellerNo}&action=memImg">
                </div>
                <div class="info">
                    <div class="title dateDes">
                        <a class="dateDes" target="_blank" href="http://scripteden.com/">${dateitem.dateItemTitle}</a>
                    </div>
                    <div class="desc">${memSvc.getOneMember(dateitem.sellerNo).getMemSname()}</div>
                    <div class="desc">${dSvc.getTimeForItem(dateitem.dateMeetingTime)}</div>
                    <div class="desc">${dateitem.dateItemLocate}</div>
                </div>
                <div class="bottom">
                    <a class="btn btn-info" href="">
                        �Ա�
                    </a>
                </div>
                </div>
            </div>

        </div>
 
 </c:forEach>       
  
  
  
<!--   <table class="table text-align:center"> -->
<!-- 	<tr> -->
<!-- 		<th align="center">�Ϥ�</th> -->
<!-- 		<th align="center">�ʺ�</th> -->
<!-- 		<th align="center">�s��</th> -->
<!-- 		<th align="center">�ɶ�</th> -->
<!-- 		<th align="center">��a</th> -->
<!-- 		<th align="center">����</th> -->
<!-- 		<th align="center">�\�U</th> -->
<!-- 	</tr> -->
	
<%-- <c:forEach var="dateitem" items="${list}"> --%>
<!-- 	<tr align='center' valign='middle'> -->
<%-- 		<td><img id="allitemsimg" src="<%=request.getContextPath()%>/ImgReader?dateitemNo=${dateitem.dateItemNo}"></td> --%>
<%-- 			<td>${memSvc.getOneMember(dateitem.sellerNo).getMemSname()}</td> --%>
<%-- 			<td>${dateitem.dateItemNo}</td> --%>
<%-- 			<td>${dSvc.getTimeForItem(dateitem.dateMeetingTime)}</td> --%>
<%-- 			<td>${dateitem.sellerNo}</td> --%>
<%-- 			<td>${dateitem.dateItemPrice}</td> --%>
<%-- 			<td>${dateitem.restListNo}</td> --%>
<!-- 			<td><a class="btn btn-primary checkit" data-toggle="modal" data-target="#modal-buy" >�ʶR</a></td> -->
<%-- 			<td><input id="checkvalue" type="hidden" class="checkvalue" value="${dateitem.dateItemNo}" /></td> --%>
<!-- 		</tr> -->

		
<!-- <div id="modal-buy" class="modal fade" role="dialog"> -->
<!--   <div class="modal-dialog"> -->
<!--     <div class="modal-content"> -->
<!--       <div class="modal-header"> -->
<!--         <button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!--         <h4 class="modal-title">���|�w�w</h4> -->
<!--       </div> -->
<!--       <div class="modal-body"> -->
<!--         <p>�T�w�w�����|��?</p> -->
<!--       </div> -->
<!--       <div class="modal-footer"> -->
<%--         <a type="button" class="btn btn-default" href="<%=request.getContextPath() %>/front_end/dateitem/dateitem.do?action=buy_date&dateItemNo=${dateitem.dateItemNo}" >�T�{�ʶR</a> --%>
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">�^�W�@��</button> -->
<!--       </div> -->
<!--     </div> -->

<!--   </div> -->
<!-- </div> -->









<%--   </c:forEach> --%>
<!-- </table> -->

<!-- <script> -->
<!-- // function checktime(dateItemNo){ -->
<!-- // 	e.preventDefault(); -->
<!-- // 	alert('in'); -->
<!-- // 	$.ajax -->
<!-- //     ({ -->
<!-- //         type: "POST",            -->
<!-- //         data: 'dateItemNo='+dateItemNo+'&action=checkTime' , -->
<!-- //         url: 'dateitem.do', -->
<!-- //    		 success:function(content) -->
<!-- //     { -->
<!-- //            alert('ok');           -->
<!-- //         }    -->
        
<!-- //     }); -->
<!-- // } -->
<!-- // $('.checkit').on('click', function(e) { -->
<!-- // 	alert('in'); -->
<!-- //     $.ajax({ -->
<!-- //         url:  'dateitem.do', -->
<!-- //         type: 'POST', -->
<!-- //         data: 'dateItemNo='+$(this).next('.checkvalue').val()+'&action=checkTime', -->
<!-- //          +$(this).next('td').find('#checkvalue').val()+ -->
<!-- //         success: function(html){ -->
<!-- //         	alert('success'); -->
<!-- //             $('#modal-buy .modal-body p').html('test'); -->
<!-- //             $('#modal-buy').modal('show'); -->
<!-- //         }, -->
<!-- //         error: function(){ -->
<!-- //             alert("error"); -->
<!-- //         }   -->
<!-- //     });   -->
<!-- // }); -->

<!-- </script> -->








<%@ include file="footer.file"%>





