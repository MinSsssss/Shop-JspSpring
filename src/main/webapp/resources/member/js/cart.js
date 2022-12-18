//$("#subTotal").text()=$("#cart_qty").val()*$("#product_price").val();

$(document).ready(function() {
	let cart_qty = $("#cart_qty").val();
	let product_no = getParameter("product_no");
	$("#addCart").on("click",function(){
		
		
		
		
		let param = {
			"cart_qty" : cart_qty,
			"product_no" : product_no,
			
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
					if (data == 1) {
						alert("장바구니 등록에 실패하였습니다.")
						return false;
					} else if (data == 0) {
						$("#add_to_cart_modal").modal('show');
					}
				}
			})
	})


})

/*let mem_pwd = $("#mem_pwd").val();
		console.log(mem_pwd);
		var param = {
			
			"mem_pwd" : mem_pwd
		};
		console.log(param);
		if (mem_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			return false();
		} else {
			$.ajax({
				url : "/member/auth/pwdChk",
				async : true,
				type : "post",
				dataType : "json",
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						console.log(data);
						alert("비밀번호가 틀렸습니다.");
						$("#memberDropModal").modal('hide');
						return false;
					} else if (data == 0) {
						$("#memberDropForm").submit();
					}
				}
			})

		}*/
function getParameter(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}