
$(document).ready(function() {

let moveForm = $("#moveForm");
	let pageId = $("#pageId").val();
	
	let category_no = $("#category_no").val();
	
	$(".pageInfo a").on("click", function(e) {
		e.preventDefault();

		moveForm.find("input[name='pageNum']").val($(this).attr("href"));

		if (pageId == "notice") {
			moveForm.attr("action", "/notice/noticeList");

		}
		if (pageId == "qnaBoard") {
			
			moveForm.attr("action", "/qna/qnaBoard/"+category_no);

		}
		if (pageId == "qnaMemberList") {
			moveForm.attr("action", "/qna/qnaList");

		}
		if (pageId == "qnaList") {
			
			moveForm.attr("action", "/admin/qna/qnaList/"+category_no);

		}
		if (pageId == "faqList") {
			
			moveForm.attr('action',"/faq/faqList/"+category_no);
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
		let categoryAction = moveCategoryForm.attr('action');
		
		moveCategoryForm.attr('action',categoryAction+"/"+category_no);
		
		
		moveCategoryForm.submit();

}

