<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="">

<head>

<%@ include file="memHead.file"%>
<style>

 

</style>


</head>

<body>
	<%@ include file="memNavBar.file"%>
	<div class="container-fluid">
		<div class="row">

			<div class="col-xs-12 col-sm-2 postion-left-group ">
				<%@ include file="memZoneLSide.file"%>
			</div>

			<div class="col-xs-12 col-sm-8 ">
				<div class="row">


					<div class="row">
					<div class="col-xs-12 col-sm-4 ">
					<h5 class="page-header">

										
						<form id="custom-search-form" action="<%=request.getContextPath() %>/Update" method="post" class="form-search form-horizontal pull-left">
							<!-- 							<div class="input-append span12"> -->
							<!-- 								<input type="hidden" name="action" value="search"> -->
							<%-- 								<input type="hidden" name="loc" value="<%=request.getRequestURI() %>"> --%>
							<!-- 								<input type="text" name="search" class="search-query mac-style" -->
							<!-- 									placeholder="�j�M�|�����d��"> -->
							<!-- 								<button type="submit" class="btn"> -->
							<!-- 									<i class="glyphicon glyphicon-search"></i> -->
							<!-- 								</button> -->
							<!-- 							</div> -->


							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">Filter by</span> <span class="caret"></span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#contains">�|��</a></li>
										<li><a href="#its_equal">�d��</a></li>
										<li class="divider"></li>
										<li><a href="#all">Anything</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all"
									id="search_param"> <input type="text"
									class="form-control" name="x" placeholder="Search term...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
							
							
						</form>


					</h5>
</div>
</div>

					<div class="row">

						<div class="panel panel-info">
							<div class="panel-heading">
								<h3 class="panel-title">${member.memId}</h3>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-3 col-lg-3 " align="center">
										<img alt="User Pic" id="memImg"
											src="<%=request.getContextPath()%>/DBGifReader"
											height="350px" width="250px"
											class="img-circle img-responsive">
									</div>


									<div class=" col-md-9 col-lg-9 ">
										<table class="table table-user-information">
											<tbody>
												<tr>
													<td class="title">�ʺ�</td>
													<td>${member.memSname}</td>
												</tr>
												<tr>
													<td class="title">�m�W</td>
													<td>${member.memName}</td>
												</tr>
												<tr>
													<td class="title">�ͤ�</td>
													<td>${member.memBday}</td>
												</tr>
												<tr>
													<td class="title">���</td>
													<td>${member.memPhone}</td>
												</tr>
												<tr>
													<td class="title">�ʧO</td>
													<%
														String memGender = String.valueOf(member.getMemGender());
														HashMap mGender = (HashMap) application.getAttribute("mGender");
													%>
													<td><%=mGender.get(memGender)%></td>
												</tr>
												<tr>

													<td class="title">�P��</td>
													<%
														String memRelation = String.valueOf(member.getMemRelation());
														HashMap mRelation = (HashMap) application.getAttribute("mRelation");
													%>
													<td><%=mRelation.get(memRelation)%></td>
												</tr>
												<tr>
													<td class="title">����</td>
													<td>${member.memFollowed}�H</td>
												</tr>
												<tr>
													<td class="title">�I��</td>
													<td>${member.memPoint}�I</td>
												</tr>
												<tr>
													<td class="title">Email</td>
													<td>${member.memEmail}</td>
												</tr>
												<td class="title">�a�}</td>
												<td>${member.memAddress}</td>
												<tr>
													<td class="title">�����</td>
													<td>${member.memSelfintro}</td>
												</tr>


											</tbody>
										</table>

										<a href="memberInfoUpdate.jsp" class="btn btn-primary">�s��ӤH��T</a>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>


				<%@ include file="memButtom.file"%>


			</div>
		</div>
		<script src="https://code.jquery.com/jquery.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<script>
			$(document).ready(function(e){
			    $('.search-panel .dropdown-menu').find('a').click(function(e) {
					e.preventDefault();
					var param = $(this).attr("href").replace("#","");
					var concept = $(this).text();
					$('.search-panel span#search_concept').text(concept);
					$('.input-group #search_param').val(param);
				});
			});
			</script>
</body>

</html>