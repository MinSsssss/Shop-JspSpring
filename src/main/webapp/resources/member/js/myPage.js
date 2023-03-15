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

	$("#reviewList").on("click", function() {
		location.href = "/review/reviewList"
	})
	$("#memberModify").on("click", function() {
		location.href = "/member/memberModify"
	})
	$("#memberDrop").on("click", function() {
		location.href = "/member/memberDrop"
	})



	$("#pwChkCancleBtn").on("click", function() {
		location.href = "/order/orderList";
	})

	$("#qnaList").on("click", function() {
		location.href = "/qna/qnaList?pageNum=0&amount=5";
	})
	$("#qnaList2").on("click", function() {
		location.href = "/qna/qnaList?pageNum=0&amount=5";
	})

	$("#qnaModify").on("click", function() {
		let qna_no = $("#qna_no").val();

		location.href = "/qna/qnaModify/" + qna_no;
	})
	$("#qnaDelete").on("click", function() {
		let qna_no = $("#qna_no").val();
		let answer = confirm("문의를 삭제 하시겠습니까?");
		if (answer) {

			let param = { "qna_no": qna_no }
			$.ajax({
				url: "/qna/qnaDelete",
				type: "POST",
				data: param,
				success: function() {
					alert("문의가 삭제되었습니다");
					location.href = "/qna/qnaList?pageNum=0&amount=5";
				}
			})


		}
	})

	$("#pwChkSubmitBtn").on("click", function() {
		let mem_id = $("#mem_id").val();
		let mem_pwd = $("#mem_pwd").val();

		var param = {
			"mem_id": mem_id,
			"mem_pwd": mem_pwd
		};
		console.log(param);
		if (mem_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			return false();
		} else {
			$.ajax({
				url: "/member/pwdChk",
				async: true,
				type: "post",
				dataType: "json",
				data: JSON.stringify(param),
				contentType: "application/json; charset=UTF-8",
				success: function(data) {

					if (data) {
						$("#memberModifyForm").submit();

					} else {

						alert("비밀번호가 틀렸습니다.");
						return false;
					}
				}
			})

		}

	})

	$("#memModifySubmitBtn").on("click", function() {
		let this_mem_pwd = $("#this_mem_pwd").val();
		let mem_pwd = $("#mem_pwd").val();
		let mem_pwd_re = $("#mem_pwd_re").val();

		if (this_mem_pwd == "" || this_mem_pwd == undefined) {
			alert("비밀번호를 입력해주세요.");
			$("#this_mem_pwd").focus();
			return false;
		}
		if (mem_pwd == "" || mem_pwd == undefined) {
			alert("새 비밀번호를 입력해주세요.");
			$("#mem_pwd").focus();
			return false;
		}
		if (mem_pwd_re == "" || mem_pwd_re == undefined) {
			alert("새 비밀번호를 입력해주세요.");
			$("#mem_pwd_re").focus();
			return false;
		}

		if (mem_pwd != mem_pwd_re) {
			alert("새 비밀번호가 같지 않습니다.");
			$("#re_mem_pwd").focus();
			return false;

		}

		let param = {
			"mem_pwd": this_mem_pwd
		}

		$.ajax({
			url: "/member/pwdChk",
			async: true,
			type: "post",
			dataType: "json",
			data: JSON.stringify(param),
			contentType: "application/json; charset=UTF-8",
			success: function(data) {

				if (!data) {
					alert("비밀번호가 틀렸습니다.");
					$("#this_mem_pwd").focus();
					return false;
				} else {

					alert("회원 정보 수정이 완료되었습니다.");
					$("#memberModifyNextForm").submit();


				}
			}
		})



	})

	$("#memberDropBtn").on("click", function() {

		let mem_pwd = $("#mem_pwd").val();

		var param = {
			"mem_pwd": mem_pwd
		};

		if (mem_pwd == "") {
			alert("비밀번호를 입력해주세요.");
			return false();
		} else {
			$.ajax({
				url: "/member/pwdChk",
				async: true,
				type: "post",
				dataType: "json",
				data: JSON.stringify(param),
				contentType: "application/json; charset=UTF-8",
				success: function(data) {

					if (data == 1) {

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

function wishDelete(product_no) {

	let param = { "product_no": product_no.value };
	$.ajax({
		url: "/wish/wishDelete",
		type: "post",
		dataType: "json",
		data: JSON.stringify(param),
		contentType: "application/json; charset=UTF-8",
		success: function(data) {
			alert("삭제되었습니다.");
			location.reload();
		}
	})
}