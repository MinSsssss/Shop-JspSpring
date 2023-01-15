$(document).ready(function() {
	$("#noticeList").on("click", function() {
		location.href = "/notice/noticeList";
	})
	$("#faqList").on("click", function() {
		location.href = "/faq/faqList?category_no=0";
	})
	$("#inquiry").on("click", function() {
		location.href = "/inquiry/inquiry";
	})

	

})