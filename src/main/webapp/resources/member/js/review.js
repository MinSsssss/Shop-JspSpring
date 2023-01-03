$(document).ready(function() {
	
	
})

starInfo();
function starInfo(){
	let forEachLength = $(".reviewWrapTop").length

	$(".myform").each(function(index, element) {
		console.log("index : "+index)
		let review_star = $(element).find("#review_star").val();
		console.log("review_star : " + review_star);
		
		
		$(element).find("#rate"+review_star+index).prop('checked',true);
		
		
	})
}
function reviewModifyViewFun(index){
	
	console.log("index : " + index);
	$("#reviewModifyViewForm"+index).submit();
	
}