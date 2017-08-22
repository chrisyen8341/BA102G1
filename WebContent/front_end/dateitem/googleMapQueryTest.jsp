<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.dateitem.model.*"%>
<%@ page import="com.restaurant.model.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>

<%@ include file="header.file"%>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAUbYcDBdfK_UjTWa9G6FSe3EfERMpEZQ">
	
</script>
<!--     <script src="https://maps.googleapis.com/maps/api/js?sensor=false" type="text/javascript"></script> -->
<script src="<%=request.getContextPath()%>/front_end/js/d3.min.js"></script>



<head>
<title>約會首頁</title>
<style type="text/css">
#map_canvas {
	width: 100%;
	height: 100%;
}
</style>
</head>
<body bgcolor='white'>



	<%@ include file="/front_end/frontEndNavBar.file"%>




	<div class="container-fluid">
		<div class="row">
			
			
			<div class="col-xs-12 col-sm-1">
				<div id="menu">
					<div class="panel list-group list-color postion-left-group">
						<a
							href="<%=request.getContextPath()%>/front_end/dateitem/select_page.jsp"
							class="list-group-item">約會首頁</a> <a href="#"
							class="list-group-item">人氣排行</a> <a
							href="<%=request.getContextPath()%>/front_end/dateitem/dateitem.do?action=list_buyer_future"
							class="list-group-item">買家購買紀錄</a>
					</div>
					<div class="panel list-group list-color">
						<a
							href="<%=request.getContextPath()%>/front_end/dateitem/dateitem.do?action=check_Seller"
							class="list-group-item">上架約會商品</a> <a
							href="<%=request.getContextPath()%>/front_end/dateitem/list_seller_future.jsp"
							class="list-group-item">賣家管理約會商品</a>
					</div>
				</div>
			</div>




			<!-- JSP以一個包含格線的div開始, 但是結束的</div>寫在footer裡面 -->

			<div class="col-xd-12 col-sm-6  main-page-show">

					<span>
						<Form action="<%=request.getContextPath()%>/front_end/dateitem/dateitem.do" method="post">
							<input type="hidden" name="action" value="googleMapQuery">
							<input type="text" id="dateMeetingTime" name="dateMeetingTime">

							<input type="submit">
							<!--   <button class="btn btn-lg btn-warning glyphicon glyphicon-search"> </button> -->


						</Form>

					</span>


					<div id="map_canvas"></div>

			</div>


			<div class="col-xd-12 col-sm-5  main-page-show">
				
				
			
			</div>






				<footer>
					<div class="row navbar-fixed-bottom">
						<div class="col-sm-12">
							<div class="col-sm-3">
								<p>Copyright 寵物You&amp;Me 2017</p>
							</div>
							<div class="col-sm-3">
								<p>關於我們</p>
							</div>
						</div>
					</div>
				</footer>
			
			
			
			
		</div>
		<a href="#">
			<div class="" id="fixedbutton-talk">
				<button class="button btn-lg btn-primary active">交易聊天室</button>
			</div>
		</a>
	</div>








	<script>
		function initializeMaps() {
			

			var options = {
				zoom : 10,
				center : {
					lat : 25.042419,
					lng : 121.541808
				}
			}

			var map = new google.maps.Map(
					document.getElementById('map_canvas'), options);

		

		}

		initializeMaps();
	</script>

<script>

$(function(){
	
	$("#dateMeetingTime").datetimepicker({
		format: 'Y-m-d',
		 timepicker:false,		 
		 mindate:0,
	});

	 
});


</script>

</body>

</html>

