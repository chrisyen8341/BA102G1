<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<html>
<head>
<%@ include file="page1.file"%>
<style type="text/css">
.mm {
	margin-top: 4cm;
}

</style>

</head>
<body>
<%@ include file="/back_end/backEndNavBar.file"%>
<%@ include file="/back_end/backEndLSide.file"%>

	<div class="row col-xs-10 col-sm-10 ">
	  <form action="<%=request.getContextPath()%>/ProductUpload" method="POST" enctype="multipart/form-data" name="form" >
		<table class="table table-hover mm" style="background-color: #CCEEFF;">
			<thead>
				<tr style="background-color: #E8CCFF;">
					<th>輸入上架商品資訊</th>
				</tr>
			</thead>
			<tbody>
			  
				<tr>
					<td>商品名稱<input type="text" name="proName" id="name"
						placeholder="請輸入上架商品名稱" required></td>
				</tr>
				<tr>
					<td>商品類別<input type="text" name="proType" id="type"
						placeholder="請輸入上架商品類別" required></td>
				</tr>
				<tr>
					<td>商品描述<input type="text" name="proDescpt" id="descpt"
						placeholder="請輸入上架商品描述" required></td>
				</tr>
				<tr>
					<td>商品價格<input type="text" name="proPrice" id="price"
						placeholder="請輸入上架商品價格" required></td>
				</tr>
				<tr>
					<td>商品圖片
						
							<input type='file' name="prodimg" class="upl" required>
							<div>
								<img class="preview"
									style="max-width: 150px; max-height: 150px;">
								<div class="size"></div>
							</div>
						
					</td>
				</tr>
			</tbody>
			
						
			
		</table>
				<input type="submit" value="新增商品" >
				<input type="hidden" name="action" value="addprod">
			</form>		
				<a href="<%=request.getContextPath()%>/back_end/order/OrderManage.jsp"><input type="button" value="訂單管理"></a>
				<a href="<%=request.getContextPath()%>/back_end/product/productManage.jsp"><input type="button" value="商品管理"></a>
	</div>
</body>
<script>
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})



	

</script>
<!-- /.container -->
	<!-- jQuery -->
	<script src="<%=request.getContextPath()%>/front_end/js/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="<%=request.getContextPath()%>/front_end/js/bootstrap.min.js"></script>
	<!-- Script to Activate the Carousel -->
</html>