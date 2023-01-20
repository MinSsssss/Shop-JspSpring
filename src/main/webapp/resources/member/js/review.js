$(document).ready(function() {
	$("#reviewModifyBtn").on("click", function() {

	})

})

starList();
function starList() {
	let forEachLength = $(".reviewWrapTop").length

	$(".myform").each(function(index, element) {

		let review_star = $(element).find("#review_star").val();

		$(element).find("#rate" + review_star + index).prop('checked', true);


	})
}
starModify();
function starModify() {

	let review_star = $("#review_star").val();

	$("#rate" + review_star).prop('checked', true)
}


function reviewWriteFun(order_status, count) {

	if (order_status != '배송완료') {
		alert("배송이 완료된 제품만 리뷰를 작성할 수 있습니다.");
		return false;
	}
	else {

		$("#reviewWriteForm" + count).submit();
	}

}

function reviewModifyViewFun(count) {

	$("#reviewModifyViewForm" + count).submit();

}
function reviewDeleteFun(count) {
	let review_no = $("#review_no" + count).val();
	console.log(review_no);
	let answer = confirm("리뷰를 삭제 하시겠습니까?");
	if (answer) {

		let param = { "review_no": review_no }
		$.ajax({
			url: "/review/reviewDelete",
			type: "POST",
			data: param,
			success: function() {
				alert("리뷰가 삭제되었습니다.");
				location.reload();
			}
		})


	}
}
