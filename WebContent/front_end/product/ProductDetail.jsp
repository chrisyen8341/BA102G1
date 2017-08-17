<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.product.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>

<html>
<head>
<%@ include file="page4.file" %>
<title>Insert title here</title>
</head>
<body>
<%@ include file="/front_end/frontEndNavBar.file" %>
<%@ include file="page2.file" %>

<%Product shoppingdetail =  (Product)session.getAttribute("shoppingdetail");%>
				
				
				
				<table border="1" width="740" align="center">
					<tr bgcolor="#5599FF"><th width="200">商品名稱</th></tr>
					<tr><td width="200"><div align="center"><b><%=shoppingdetail.getProdName()%></b></div></td></tr>
					<tr bgcolor="#5599FF"><th>商品圖片</th></tr>
					<tr><td width="200"><div align="center"><img src="http://localhost:8081/ChrisAll/ProductImage?prodno=${shoppingdetail.prodNo}"></div>
					</td></tr>
					<tr bgcolor="#5599FF" align="center"><th>商品類型</th></tr>
					<tr><td width="200"><div align="center"><b><%=shoppingdetail.getProdType()%></b></div></td></tr>
					<tr bgcolor="#5599FF" align="center"><th>商品內容</th></tr>
					<tr><td width="200"><div align="center"><b><%=shoppingdetail.getProdDescpt()%></b></div></td></tr>
					<tr bgcolor="#5599FF" align="center"><th>商品價格</th></tr>
					<tr><td width="200"><div align="center"><b><%=shoppingdetail.getProdPrice()%></b></div></td></tr>
				</table>
<div>
                <div class="text-center">
                    
                    <br>
                    <ul class="pager">
                        <li><a href="#"><form action="<%=request.getContextPath()%>/ShoppingCar.do" method="post">
							<input type="submit" value="放入購物車">
							<input type="hidden" name="name" value="${shoppingdetail.prodName}">
    						<input type="hidden" name="price" value="${shoppingdetail.prodPrice}">
   	 						
    						<input type="hidden" name="prodno" value="${shoppingdetail.prodNo}">
    						<input type="hidden" name="action" value="add"></form>
                        	</a></li>
                        <li><a href="#"><form action="<%=request.getContextPath()%>/front_end/product/BrowseProduct.jsp" method="POST">
                        				<input type="submit" value="回商品頁面">
                        				</form></a></li>
                    </ul>
                </div>
               
                
            </div>
        </div>
        </div>
        <%@ include file="/front_end/frontEndButtom.file" %>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>