<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.album.model.*"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.pet.model.*"%>

<html lang="">


<%
	Integer memNo = Integer.parseInt(request.getParameter("memNo"));
	MemberService memSvc = new MemberService();
	Member memberV = memSvc.getOneMember(memNo);
	pageContext.setAttribute("memberV", memberV);
	Member member = (Member) session.getAttribute("member");
	List<Pet> list = memSvc.getPetsByMemNo(memberV.getMemNo());
	pageContext.setAttribute("list", list);
%>

<head>

<%@ include file="memHead.file"%>
<style>
.pet {
	margin-top: 50px;
}

.member {
	margin-buttom: 100px;
}

#memeImg {
	float: left;
	padding: 20px;
}

</style>





</head>

<body>
	<%@ include file="/front_end/frontEndNavBar.file"%>

	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-12 col-sm-2 postion-left-group "></div>

			<div class="col-xs-12 col-sm-8 ">
				<div class="row">

					<div class="row">

						<div class="panel panel-info">

							<div class="panel-heading">

								<%@ include file="viewMemInfoTop.file"%>

							</div>

							<div class="panel-body">
							
							
<!-- 							你的日誌內容 -->
							
							
							
							</div>

						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="/front_end/frontEndButtom.file"%>
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function(e) {
			$('.search-panel .dropdown-menu').find('a').click(function(e) {
				e.preventDefault();
				var param = $(this).attr("href").replace("#", "");
				var concept = $(this).text();
				$('.search-panel span#search_concept').text(concept);
				$('.input-group #search_param').val(param);
			});
		});
	</script>
</body>

</html>