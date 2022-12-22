//$("#subTotal").text()=$("#cart_qty").val()*$("#product_price").val();

$(document).ready(function() {
	
	$("#addCart").on("click",function(){
	let cart_qty = $("#cart_qty").val();
	let product_no = getParameter("product_no");

		let param = {
			"cart_qty" : cart_qty,
			"product_no" : product_no
		};
		console.log("카트수량"+cart_qty);
		
		console.log("제품번호"+product_no);
		$.ajax({
				url : "/member/auth/addCart",
				async : true,
				type : "post",
				dataType : "json",
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if(data==1){
						$("#add_to_cart_modal").modal('show');
					}
					else{
						alert("장바구니에 이미 상품이 있습니다.");
						
						$("#add_to_cart_modal").modal('hide');
						return false;
						
					}
						
				}
			})
	})
	$("#cartRemoveBtn").on("click",function(){
		$("#cartRemoveForm").submit();
	})


})


function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}