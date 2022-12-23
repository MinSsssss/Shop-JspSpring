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

function allChecked(target){

    //전체 체크박스 버튼
    const checkbox = document.getElementById('allCheckBox');

    //전체 체크박스 버튼 체크 여부
    const is_checked = checkbox.checked;

    //전체 체크박스 제외한 모든 체크박스
    if(is_checked){
        //체크박스 전체 체크
        chkAllChecked()
    }

    else{
        //체크박스 전체 해제
        chkAllUnChecked()
    }
}

//자식 체크박스 클릭 이벤트
function chkClicked(){

    //체크박스 전체개수
    const allCount = document.querySelectorAll(".chk").length;

    //체크된 체크박스 전체개수
    const query = 'input[name="chk"]:checked'
    const selectedElements = document.querySelectorAll(query)
    const selectedElementsCnt = selectedElements.length;

    //체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 전체 체크박스 체크
    if(allCount == selectedElementsCnt){
         document.getElementById('allCheckBox').checked = true;
    }

    //같지않으면 전체 체크박스 해제
    else{
        document.getElementById('allCheckBox').checked = false;
    }
}

//체크박스 전체 체크
function chkAllChecked(){
    document.querySelectorAll(".chk").forEach(function(v, i) {
        v.checked = true;
    });
}

//체크박스 전체 체크 해제
function chkAllUnChecked(){
    document.querySelectorAll(".chk").forEach(function(v, i) {
        v.checked = false;
    });
}

//글삭제
function checkDelete(){
    //체크박스 체크된 항목
    const query = 'input[name="chk"]:checked'
    const selectedElements = document.querySelectorAll(query)

    //체크박스 체크된 항목의 개수
    const selectedElementsCnt = selectedElements.length;
    
    if(selectedElementsCnt == 0){
        alert("삭제할 항목을 선택해주세요.");
        return false;
    }

    else{
        if (confirm("정말로 삭제하시겠습니까?")) {
            //배열생성
            const arr = new Array(selectedElementsCnt);

            document.querySelectorAll('input[name="chk"]:checked').forEach(function(v, i) {
                arr[i] = v.value;
            });

            const form = document.createElement('form');
            form.setAttribute('method', 'post');        //Post 메소드 적용
            form.setAttribute('action', '/delete');

            var input1 = document.createElement('input');
            input1.setAttribute("type", "hidden");
            input1.setAttribute("name", "boardIds");
            input1.setAttribute("value", arr);
            form.appendChild(input1);
            console.log(form);
            document.body.appendChild(form);
            form.submit();
        }
    }
}

//체크된 물품 주문
function checkOrder(){
    //체크박스 체크된 항목
    const query = 'input[name="chk"]:checked'
    const selectedElements = document.querySelectorAll(query)

    //체크박스 체크된 항목의 개수
    const selectedElementsCnt = selectedElements.length;

    if(selectedElementsCnt == 0){
        alert("구매할 항목을 선택해주세요.");
        return false;
    }

    else{
        if (confirm("정말로 구매하시겠습니까?")) {
            //배열생성
            const arr = new Array(selectedElementsCnt);

            document.querySelectorAll('input[name="chk"]:checked').forEach(function(v, i) {
                arr[i] = v.value;
            });

            const form = document.createElement('form');
            form.setAttribute('method', 'post');        //Post 메소드 적용
            form.setAttribute('action', '/selectOrder');

            var input1 = document.createElement('input');
            input1.setAttribute("type", "hidden");
            input1.setAttribute("name", "boardIds");
            input1.setAttribute("value", arr);
            form.appendChild(input1);
            console.log(form);
            document.body.appendChild(form);
            form.submit();
        }
    }
}

