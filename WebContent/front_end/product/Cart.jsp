<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.product.model.*"%>
<%@ page import="com.member.model.*"%>
<%request.setCharacterEncoding("UTF-8");%>  
<%response.setCharacterEncoding("BIG5");%> 
<html >
<head>
<%@ include file="page4.file" %>
<style type="text/css">
.center{
width: 150px;
  margin: 40px auto;
  
}
</style>
</head>

<body>
<%@ include file="/front_end/frontEndNavBar.file" %>
<%@ include file="page2.file" %>

<% Vector<Product> buylist = (Vector<Product>) session.getAttribute("shoppingcart");%>
<%HashMap<String,Integer> qtyMap = (HashMap<String,Integer>) session.getAttribute("qtyMap");%>   
<%Member mem = (Member)session.getAttribute("member");%>

<%	
	int totalall=0;
	for (int i = 0; i < buylist.size(); i++) {
	Product order = buylist.get(i);
	int price = order.getProdPrice();
	String prodName = order.getProdName();
	int quality = qtyMap.get(prodName);
	totalall += (price * quality);
}

String amount = String.valueOf(totalall);
session.setAttribute("amount", amount);
			

	%>


	
	<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                <%
					
	 				for (int index = 0; index < buylist.size(); index++) {
					Product prod = buylist.get(index);
					int total=prod.getProdPrice()*qtyMap.get(prod.getProdName()); 
					
				%>
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="http://localhost:8081/ChrisAll/ProductImage?prodno=<%=prod.getProdNo()%>" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="<%=request.getContextPath() %>/ShoppingDetail.do?prodno=<%=prod.getProdNo()%>"><%=prod.getProdName()%></a></h4>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                          <form action="<%=request.getContextPath()%>/CheckOut.do" method="POST">
                       		 <input type="number" class="form-control" id="exampleInputEmail1" value="<%=qtyMap.get(prod.getProdName())%>">
                                
                           </form> 
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong><%=prod.getProdPrice()%></strong></td>
                        <% %>
                        <td class="col-sm-1 col-md-1 text-center"><strong><%=total %></strong></td>
                        <td class="col-sm-1 col-md-1">
						
                            <form  name="deleteForm" action="<%=request.getContextPath() %>/ShoppingCar.do" method="POST">
              					<input type="hidden" name="action" value="delete">
              					<input type="hidden" name="del" value="<%=index%>">
              					<input type="hidden" name="delname" value=<%=prod.getProdName()%>> 
              					<input type="hidden" name="price" value=<%=prod.getProdPrice()%>>
             				    <input type="hidden" name="prodno" value=<%=prod.getProdNo()%>>
              					<input type="submit" class="btn btn-danger" value="刪除"></div>
       					 
       					 </form>
                        </td>
                    </tr>
                  <%}%> 
                     <tr>
                        <td>   </td>
                        <td>   </td>
                        <td>   </td>
                        <td><h3>Total</h3></td>
                        	
                        <td class="text-right"><h3><strong><%=amount %></strong></h3></td>
                    </tr>
                   		
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span><a href="<%=request.getContextPath()%>/front_end/product/BrowseProduct.jsp">繼續購物</a>
                        </button></td>
                        <td>
                        <button type="button" class="btn btn-success"><a href="<%=request.getContextPath()%>/front_end/product/CheckOutConfirm.jsp">結帳</a> <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
		

<%@ include file="/front_end/frontEndButtom.file" %>
<script type="text/javascript">
$(document).ready(function(){

	var quantitiy=0;
	   $('.quantity-right-plus').click(function(e){
	        
	        // Stop acting like a button
	        e.preventDefault();
	        // Get the field name
	        var quantity = parseInt($('#quantity').val());
	        
	        // If is not undefined
	            
	            $('#quantity').val(quantity + 1);

	          
	            // Increment
	        
	    });

	     $('.quantity-left-minus').click(function(e){
	        // Stop acting like a button
	        e.preventDefault();
	        // Get the field name
	        var quantity = parseInt($('#quantity').val());
	        
	        // If is not undefined
	      
	            // Increment
	            if(quantity>0){
	            $('#quantity').val(quantity - 1);
	            }
	    });
	    
	});
</script>
<script src="https://code.jquery.com/jquery.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>

</html>