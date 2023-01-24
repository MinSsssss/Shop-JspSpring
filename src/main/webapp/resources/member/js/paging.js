
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
		if (pageId == "qnaMemberList") {
			moveForm.attr("action", "/qna/qnaList");

		}
		if (pageId == "qnaList") {
			moveForm.attr("action", "/admin/qna/qnaList");

		}
		if (pageId == "faqList") {
			let category_no = $.urlParam('category_no');
			let categoryInput = '<input type="hidden" name="category_no" value="'+category_no+'">'
			moveForm.append(categoryInput);
			moveForm.attr("action", "/faq/faqList");

		}
		moveForm.submit();



	});

	
});
$.urlParam = function(name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null) {
        return null;
    } else {
        return results[1] || 0;
    }
}

function fnMoveCategory(category_no){
		
		let moveCategoryForm = $("#moveCategoryForm");
		let categoryInput = '<input type="hidden" name="category_no" value="'+category_no+'">'
		moveCategoryForm.append(categoryInput);
		moveCategoryForm.submit();
}

