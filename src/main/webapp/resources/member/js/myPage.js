$(document).ready(function() {
	$("#orderList").on("click", function() {
		location.href = "/order/orderList"
	})
	$("#wishList").on("click", function() {
		location.href = "/wish/wishListView"
	})
	$("#cart").on("click", function() {
		location.href = "/cart/cartView"
	})
	$("#qnaList").on("click", function() {
		location.href = "/qna/qnaList"
	})
	$("#reviewList").on("click", function() {
		location.href = "/review/reviewList"
	})
	$("#memberModify").on("click", function() {
		location.href = "/member/memberModify"
	})
	$("#memberDrop").on("click", function() {
		location.href = "/member/memberDrop"
	})

	$("#logoutBtn").on("click", function() {
		$("#logoutForm").submit();
	})

	$("#pwChkCancleBtn").on("click", function() {
		location.href = "/order/orderList";
	})
	$("#pwChkSubmitBtn").on("click", function() {
		let mem_id = $("#mem_id").val();
		let mem_pwd = $("#mem_pwd").val();
		console.log(mem_pwd);
		var param = {
			"mem_id" : mem_id,
			"mem_pwd" : mem_pwd
		};
		console.log(param);
		if (mem_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			return false();
		} else {
			$.ajax({
				url : "/member/pwdChk",
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
						return false;
					} else if (data == 0) {
						$("#memberModifyForm").submit();
					}
				}
			})

		}

	})

	$("#memModifySubmitBtn").on("click", function() {
		let this_mem_pwd = $("#this_mem_pwd").val();
		let mem_pwd = $("#mem_pwd").val();
		let mem_pwd_re = $("#mem_pwd_re").val();
		console.log(this_mem_pwd);
		console.log(mem_pwd);
		console.log(mem_pwd_re);

		if (this_mem_pwd == "" && this_mem_pwd == undefined) {
			alert("비밀번호를 입력해주세요.");
			return false();
		} else {
			let param = {
				"mem_pwd" : this_mem_pwd
			}
			console.log(param);
			$.ajax({
				url : "/member/pwdChk",
				async : true,
				type : "post",
				dataType : "json",
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(data) {
					console.log(data);
					if (data == 1) {
						alert("비밀번호가 틀렸습니다.");
						return false;
					} else if (data == 0) {
						if (mem_pwd == mem_pwd_re) {
							alert("회원 정보 수정이 완료되었습니다.");
							$("#memberModifyNextForm").submit();
						} else {
							alert("새 비밀번호가 같지 않습니다.")
							return false;
						}

					}
				}
			})

		}

	})

	$("#memberDropBtn").on("click", function() {
		
		let mem_pwd = $("#mem_pwd").val();
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
				url : "/member/pwdChk",
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

		}
		
	})

})