<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%
	ProductService prodService = new ProductService();
	List<Product> prodList = prodService.getAllByType("其他");
	session.setAttribute("prodList", prodList);

%>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<%@ include file="page4.file"%>
</head>
<body>
<%@ include file="pageCount1.file"%>
	<%@ include file="/front_end/frontEndNavBar.file" %>
    <%@ include file="page2.file"%>
    
    <c:forEach var="product" items="${prodList}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
    <c:if test="${product.prodType == '其他'}">
		<div class="adj">

			<div class="block col-sm-3 col-sm-offset-1 item-margin">
				<div class="product">
					<div style="width:200px;height:150px">
					<img src="http://localhost:8081/ChrisAll/ProductImage?prodno=${product.prodNo}" class="img-responsive" alt="Cinque Terre">
				   </div>
					<div class="buttons">
						<form action="<%=request.getContextPath()%>/ShoppingCar.do" method="POST">
							<a class="buy btn-large" href="#">
							<i class="icon-shopping-cart"></i>
							<input type="submit" class="btn btn-primary" value="放入購物車"></a> 
							<input type="hidden" name="name" value="${product.prodName}"> 
							<input type="hidden" name="price" value="${product.prodPrice}">
							<input type="hidden" name="prodno" value="${product.prodNo}">
							<input type="hidden" name="action" value="add">
						</form>

						<form action="<%=request.getContextPath()%>/ShoppingDetail.do" method="POST">
							<a class="preview btn-large"><i class="icon-eye-open"></i><input type="submit" class="btn btn-primary" value="商品明細"></a> 
							<input type="hidden" name="prodno" value="${product.prodNo}">
						</form>
					</div>
				</div>
				<div class="info">
					<h4>${product.prodName}</h4>
					 
					<span class="price">${product.prodPrice}</span>
					<form action="<%=request.getContextPath()%>/ShoppingDetail.do"
						method="POST">
						<a class="btn pull-right" href="#"><i
							class="icon-shopping-cart"></i><input type="submit"
							class="btn btn-primary" value="馬上購買"></a> <input
							type="hidden" name="prodno" value="${product.prodNo}">
					</form>
				</div>
				
			</div>
		</div>
		</c:if>
    </c:forEach>
    
    
    </div>
    	
        <div class="row">
        <div>
                <div class="text-center">
                    <%@ include file="pageCount2.file"%>
                </div>
               
            </div>
        </div>
        <%@ include file="/front_end/frontEndButtom.file" %>
        <script src="https://code.jquery.com/jquery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>