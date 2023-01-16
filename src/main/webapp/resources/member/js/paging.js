
$(document).ready(function() {

let moveForm = $("#moveForm");
	let pageId = $("#pageId").val();

	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();

		moveForm.find("input[name='pageNum']").val($(this).attr("href"));

		if (pageId == "notice") {
			moveForm.attr("action", "/notice/noticeList");

		}
		if (pageId == "qnaBoard") {
			moveForm.attr("action", "/qna/qnaBoard");

		}
		
		moveForm.submit();



	});

	
});
