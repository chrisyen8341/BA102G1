<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.member.model.Member"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.*"%>
<%@ page import="com.pet.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	MemberService memSvc = new MemberService();


	String search = (String) (request.getAttribute("search"));
	if (search == null) {
		String searchb = request.getParameter("search");
		search = request.getParameter("search");
	}

	String type = (String) (request.getAttribute("type"));
	if (type == null) {
		String typeb = request.getParameter("type");
		type = request.getParameter("type");
	}

	pageContext.setAttribute("search", search);
	pageContext.setAttribute("type", type);

	List<Member> mlist = null;
	if (type.equals("會員")) {
		mlist = memSvc.getMembersByIdName(search);
		System.out.println(mlist);
		pageContext.setAttribute("mlist", mlist);
	}

	// 	List<Pet> plist = null;
	// 	if (type.equals("寵物")) {
	// 		PetService petSvc = new PetService();
	// 		plist = petSvc.getPetsByName(search);
	// 		pageContext.setAttribute("plist", plist);
	// 	}
%>
<html lang="">

<head>
<title>寵物 You & Me</title>
<%@ include file="memHead.file"%>
<STYLE>
.title {
	width: 70px; /* 設定 H1 的樣式*/
}
</STYLE>



<style>
@import "http://fonts.googleapis.com/css?family=Roboto:300,400,500,700";

.mb20 {
	margin-bottom: 20px;
}

hgroup {
	padding-left: 15px;
	border-bottom: 1px solid #ccc;
}

hgroup h1 {
	font: 500 normal 1.625em "Roboto", Arial, Verdana, sans-serif;
	color: #2a3644;
	margin-top: 0;
	line-height: 1.15;
}

hgroup h2.lead {
	font: normal normal 1.125em "Roboto", Arial, Verdana, sans-serif;
	color: #2a3644;
	margin: 0;
	padding-bottom: 10px;
}

.search-result .thumbnail {
	border-radius: 0 !important;
}

.search-result:first-child {
	margin-top: 0 !important;
}

.search-result {
	margin-top: 20px;
}

.search-result .col-md-2 {
	border-right: 1px dotted #ccc;
	min-height: 140px;
}

.search-result ul {
	padding-left: 0 !important;
	list-style: none;
}

.search-result ul li {
	font: 400 normal .85em "Roboto", Arial, Verdana, sans-serif;
	line-height: 30px;
}

.search-result ul li i {
	padding-right: 5px;
}

.search-result .col-md-7 {
	position: relative;
}

.search-result h3 {
	font: 500 normal 1.375em "Roboto", Arial, Verdana, sans-serif;
	margin-top: 0 !important;
	margin-bottom: 10px !important;
}

.search-result h3>a, .search-result i {
	color: #248dc1 !important;
}

.search-result p {
	font: normal normal 1.125em "Roboto", Arial, Verdana, sans-serif;
}

.search-result span.plus {
	position: absolute;
	right: 0;
	top: 126px;
}

.search-result span.plus a {
	background-color: #248dc1;
	padding: 5px 5px 3px 5px;
}

.search-result span.plus a:hover {
	background-color: #414141;
}

.search-result span.plus a i {
	color: #fff !important;
}

.search-result span.border {
	display: block;
	width: 97%;
	margin: 0 15px;
	border-bottom: 1px dotted #ccc;
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

					<h5 class="page-header text-right">目前位置:會員搜尋</h5>


					<div class="panel panel-info">

						<div class="panel-heading">

						</div>

						<div class="panel-body">


							<%
								int rowsPerPage = 3; //每頁的筆數    
								int rowNumber = 0; //總筆數
								int pageNumber = 0; //總頁數      
								int whichPage = 1; //第幾頁
								int pageIndexArray[] = null;
								int pageIndex = 0;
								rowNumber = mlist.size();
							%>

							<%@ include file="page1.file"%>



<!-- 							<div class="col-xs-12 col-sm-2 "> -->
<!-- 								<div id="menu"> -->
<!-- 									<div class="panel list-group list-color"> -->

<!-- 										<a href="#" class="list-group-item">排序</a> <a href="#" -->
<!-- 											class="list-group-item" data-toggle="collapse" -->
<!-- 											data-target="#sm1" data-parent="#menu">人氣<span -->
<!-- 											class="glyphicon glyphicon-triangle-bottom pull-right"></span></a> -->
<!-- 										<div id="sm1" class="sublinks collapse"> -->
<!-- 											<a href="#" class="list-group-item small"> 高至低</a> <a -->
<!-- 												href="#" class="list-group-item small"> 低至高</a> -->
<!-- 										</div> -->


<!-- 										<a href="#" class="list-group-item" data-toggle="collapse" -->
<!-- 											data-target="#sm2" data-parent="#menu">性別 <span -->
<!-- 											class="glyphicon glyphicon-triangle-bottom pull-right"></span></a> -->
<!-- 										<div id="sm2" class="sublinks collapse"> -->
<!-- 											<a href="#" class="list-group-item small"> 男</a> <a href="#" -->
<!-- 												class="list-group-item small"> 女</a> -->
<!-- 										</div> -->


<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->





							<div class="col-xs-12 col-sm-12 ">
								<div class="row">

									<c:if test="<%=type.equals(\"會員\")%>">


										<c:forEach var="member" items="${mlist}"
											begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
											<%Member member=(Member)pageContext.getAttribute("member"); %>

											<a
												href="<%=request.getContextPath() %>/front_end/member/member.do?action=viewOtherMem&memNo=${member.memNo}">
												<div>
													<article class="search-result row">
														<div class="col-xs-12 col-sm-12 col-md-3">
															<div class="thumbnail">
																<img
																	src="<%=request.getContextPath() %>/front_end/member/MemImgReader2.do?memNo=${member.memNo}"
																	alt="Lorem ipsum" />
															</div>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-2">
															<ul class="meta-search">
																<li><i class="glyphicon glyphicon-user"></i> <span>${member.memSname}</span></li>
																<li><i class="glyphicon glyphicon-user"></i> <span>${member.memId}</span></li>
																<%
																	String memGender = String.valueOf(member.getMemGender());
																			HashMap mGender = (HashMap) application.getAttribute("mGender");
																%>
																<li><i class="glyphicon glyphicon-time"></i> <span><%=mGender.get(memGender)%></span></li>

																<li><i class="glyphicon glyphicon-tags"></i> <span>${member.memBday}</span></li>
															</ul>
														</div>
														<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
															<h3>${member.memSname}的自我介紹</h3>
															<p>${member.memSelfintro}</p>
															<span class="plus"><i
																class="glyphicon glyphicon-plus"></i></span>
														</div>
														<span class="clearfix borda"></span>
													</article>
													<div>
											</a>

										</c:forEach>




										<!-- page2 -->
										<table border="0">
											<tr>
												<%
													if (rowsPerPage < rowNumber) {
												%>
												<%
													if (pageIndex >= rowsPerPage) {
												%>
												<td>
													<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
														<input type="hidden" name="whichPage" value="1"> <input
															type="hidden" name="type" value="<%=type%>"> <input
															type="hidden" name="search" value="<%=search%>">
														<input type="submit" class="btn-link" value="至第一頁">
													</FORM> <%-- 								<A href="<%=request.getRequestURI()%>?whichPage=1&type=<%=type%>&search=<%=search%>">至第一頁</A>&nbsp; --%>
												</td>


												<td>
													<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
														<input type="hidden" name="whichPage"
															value="<%=whichPage - 1%>"> <input type="hidden"
															name="type" value="<%=type%>"> <input
															type="hidden" name="search" value="<%=search%>">
														<input type="submit" class="btn-link" value="上一頁">
													</FORM>
												</td>

												<%
													}
												%>

												<%
													if (pageIndex < pageIndexArray[pageNumber - 1]) {
												%>
												<td>

													<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
														<input type="hidden" name="whichPage"
															value="<%=whichPage + 1%>"> <input type="hidden"
															name="type" value="<%=type%>"> <input
															type="hidden" name="search" value="<%=search%>">
														<input type="submit" class="btn-link" value="下一頁">
													</FORM>

												</td>
												<td>

													<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
														<input type="hidden" name="whichPage"
															value="<%=pageNumber%>"> <input type="hidden"
															name="type" value="<%=type%>"> <input
															type="hidden" name="search" value="<%=search%>">
														<input type="submit" class="btn-link" value="至最後下一頁">
													</FORM>

												</td>
												<%
													}
												%>
												<%
													}
												%>
											</tr>
										</table>
										<%
											if (pageNumber > 1) {
										%>
										<table border="0">
											<tr>
												<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												</td>
												<FORM METHOD="post" ACTION="<%=request.getRequestURI()%>">
													<input type="hidden" name="method" value="post"> <input
														type="hidden" name="type" value=<%=type%>> <input
														type="hidden" name="search" value=<%=search%>>
													<td><select size="1" name="whichPage">
															<%
																for (int i = 1; i <= pageNumber; i++) {
															%>
															<option value="<%=i%>">跳至第<%=i%>頁
																<%
																}
															%>
															
													</select> <input type="submit" value="確定"></td>
												</FORM>
											</tr>
										</table>
										<%
											}
										%>


									</c:if>


								</div>


							</div>




						</div>

					</div>
				</div>

			</div>




		</div>
		<%@ include file="/front_end/frontEndButtomFixed.file"%>


</body>

</html>