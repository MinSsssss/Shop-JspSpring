<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<jsp:include page="/WEB-INF/views/admin/includes/adminHeader.jsp"></jsp:include>
<style>
#tekbeCompnayList, #invoiceNumberText {
	width: 500px;
	height: 30px;
	padding-left: 10px;
	font-size: 18px;
	color: #0000ff;
	border: 1px solid #006fff;
	border-radius: 3px;
}

#tekbeCompnayName, #invoiceNumber {
	color: black;
	font-weight: bold;
	margin-right: 20px;
	font-size: 18px;
}

#myButton1 {
	background: #6893b0;
	background-image: -webkit-linear-gradient(top, #6893b0, #2980b9);
	background-image: -moz-linear-gradient(top, #6893b0, #2980b9);
	background-image: -ms-linear-gradient(top, #6893b0, #2980b9);
	background-image: -o-linear-gradient(top, #6893b0, #2980b9);
	background-image: linear-gradient(to bottom, #6893b0, #2980b9);
	-webkit-border-radius: 0;
	-moz-border-radius: 0;
	border-radius: 0px;
	font-family: Arial;
	color: #ffffff;
	font-size: 20px;
	padding: 10px 10px 10px 10px;
	text-decoration: none;
}

#myButton1:hover {
	background: #3cb0fd;
	background-image: -webkit-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -moz-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -ms-linear-gradient(top, #3cb0fd, #3498db);
	background-image: -o-linear-gradient(top, #3cb0fd, #3498db);
	background-image: linear-gradient(to bottom, #3cb0fd, #3498db);
	text-decoration: none;
}

table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #dddddd;
}
</style>



<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">주문조회</h1>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">

		<div class="card-body">
			<div class="table-responsive">
				<div class="col-lg-8">
					<div class="tab-content">
						<div class="orderProductInfo">

							<div class="orderForDisplay">
								<div>
									
									<h3 class="orderDate">
										<fmt:formatDate pattern="yyyy. MM. dd 주문"
											value="${orderList.order_date}" />
									</h3>

									<h5><c:out value='${orderList.order_status}'/></h5>
									<div>택배회사 : <c:out value='${courier.courier_name}'/></div>
									<div>운송장 번호 : <c:out value='${courier.invoice_no}'/></div>
								</div>
								<div class="displayBot">
									
									<c:choose>
										<c:when test="${orderList.order_status eq '배송완료'}">
									   		
									    </c:when>
									
									    <c:when test="${not empty courier}">
									   		<button id="invoiceModify">운송장수정</button>
									   		<button id="deliveryComplete">배송완료</button>
									   		<input type="hidden" id="order_no" value="<c:out value='${orderList.order_no}'/>">
									   		<input type="hidden" id="order_status" value="배송완료">
									    </c:when>
									    <c:when test="${empty courier}">
									   		<button id="invoiceRegister">운송장등록</button>
									    </c:when>
									    
									</c:choose>
								</div>
							</div>

							<c:forEach items="${orderList.orderDetailList}"
								var="orderDetailList">
								<div class="orderProductFor">
									<div class="orderInfo">
										<div class="orderDisplay">
											<a href="<c:url value='/product/productRead?product_no=${orderDetailList.product_no}'/>">
												<img class="product_img" src="<c:url value='/display?fileName=${orderDetailList.product_thumb_img}'/>">
											</a>
											<div class="productInfo">
												<p>
												<a href="<c:url value='/product/productRead?product_no=${orderDetailList.product_no}'/>">
													<c:out value="${orderDetailList.product_name }"/>
												</a>
												</p>
												<span class="productPrice">
													<c:out value='${orderDetailList.product_price }'/>원 x
												</span> 
												<span class="orderQty">
													<c:out value='${orderDetailList.order_qty}'/> = 
												</span> 
												<span>
													<c:out value='${orderDetailList.sub_total}'/>
												</span>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</div>
						<div class="receiverInfo">
							<h5>받는 사람 정보</h5>
							<table>
								<tr>
									<td class="tableInfoFtd">받는사람</td>
									<td><c:out value='${orderList.receiver_name}'/></td>
								</tr>
								<tr>
									<td>연락처</td>
									<td><c:out value='${orderList.receiver_tel}'/></td>
								</tr>
								<tr>
									<td>받는 주소</td>
									<td><c:out value='${orderList.receiver_addr}'/></td>
								</tr>
								<tr>
									<td>배송요청사항</td>
									<td><c:out value='${orderList.order_request_msg}'/></td>
								</tr>
							</table>

						</div>
						<div class="receiverInfo">
							<h5>결제정보</h5>
						</div>


						<span id="tekbeCompnayName">택배회사명: </span> 
						<select id="tekbeCompnayList" name="tekbeCompnayList">

						</select><br><br> 
						
						<span id="invoiceNumber">운송장번호: </span> <input type="text"
							id="invoiceNumberText" name="invoiceNumberText"><br />
						<br />
						<button id="myButton1">택배 조회하기</button>
						<br /> <br />
						<div>
							<table id="myPtag"></table>
						</div>
						<br />
						<div>
							<table id="myPtag2"></table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->

</div>
<!-- End of Main Content -->

<div class="modal fade" id="invoiceRegisterModal" tabindex="-1"
	role="dialog" aria-labelledby="invoiceRegisterCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="invoiceRegisterModalTitle">운송장등록</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="<c:url value='/admin/order/invoiceRegister'/>" method="post" id="invoiceRegisterForm">
					<span id="tekbeCompnayName">택배회사명: </span> 
					<select id="tekbeCompnayList1" name="courier_code">
						<option value=""> </option>
					</select><br />
					<br /> <span id="invoiceNumber">운송장번호: </span> 
					<input type="text" id="invoiceNumberText1" name="invoice_no"><br />
					<br />
					<input type="hidden" id="courierName" name="courier_name">
					<input type="hidden" name="order_no" value="<c:out value='${orderList.order_no}'/>">
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="invoiceRegisterBtn">등록</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>




<!-- End of Main Content -->
<jsp:include page="/WEB-INF/views/admin/includes/adminFooter.jsp"></jsp:include>
<script>
$(document).ready(function(){
	$("#deliveryComplete").on("click",function(){
		let order_no = $("#order_no").val();
		let order_status = $("#order_status").val();
		let param = {
				"order_no" : order_no,
				"order_status" : order_status
		}
		
		$.ajax({
			
	         type:"POST",
	         dataType : "json",
	         url:"/admin/order/deliveryComplete",
	         data: JSON.stringify(param),
	         contentType: "application/json; charset=UTF-8",
	         success:function(data){
	                if(data){
	                	alert("배송 정보가 변경되었습니다.")
	                	location.reload();
	                }
	                else{
	                	alert("배송 정보 변경이 실패하였습니다.")
	                }
	         }
	     });
	})
	
	let myKey = "2NNTgfuc13wSnhvkyXVKYQ"; // 스윗트래커에서 발급받은 키 넣는다.
	getTekbeCompnayList(myKey,0);
	
	
	$("#invoiceRegister").on("click",function(){
		getTekbeCompnayList(myKey,1);
		$("#invoiceRegisterModal").modal("show");
		

	})
	
	$("#tekbeCompnayList1").on("change",function(){
		
		$("#courierName").val($("#tekbeCompnayList1 option:checked").text())
	})
  	
	$("#invoiceRegisterBtn").on("click",function(){
		let invoice_no = $("#invoiceNumberText1").val();
		let tekbeCompnay = $("#tekbeCompnayList1").val();
		
		if(tekbeCompnay==''){
			alert("택배회사를 선택해주세요");
			return false;
		}
		
		if(invoice_no==''){
			alert("운송장번호를 입력해주세요");
			return false;
		}
		
		$("#invoiceRegisterForm").submit();
	})
    
        // 택배사 목록 조회 company-api
       
        // 배송정보와 배송추적 tracking-api
        $("#myButton1").click(function() {
            let t_code = $('#tekbeCompnayList option:selected').attr('value');
            let t_invoice = $('#invoiceNumberText').val();
            
            $.ajax({
                type:"GET",
                dataType : "json",
                url:"http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key="+myKey+"&t_code="+t_code+"&t_invoice="+t_invoice,
                success:function(data){
                    console.log(data);
                    let myInvoiceData = "";
                    if(data.status == false){
                        myInvoiceData += ('<p>'+data.msg+'<p>');
                    }
                    
                    
                    
                    $("#myPtag").html(myInvoiceData)
                    
                    let trackingDetails = data.trackingDetails;
                    
                    
                    let myTracking="";
                    let header ="";
                    header += ('<tr>');                
                    header += ('<th>'+"시간"+'</th>');
                    header += ('<th>'+"장소"+'</th>');
                    header += ('<th>'+"유형"+'</th>');
                    header += ('<th>'+"전화번호"+'</th>');                     
                    header += ('</tr>');     
                    
                    $.each(trackingDetails,function(key,value) {
                        myTracking += ('<tr>');                
                        myTracking += ('<td>'+value.timeString+'</td>');
                        myTracking += ('<td>'+value.where+'</td>');
                        myTracking += ('<td>'+value.kind+'</td>');
                        myTracking += ('<td>'+value.telno+'</td>');                     
                        myTracking += ('</tr>');                                    
                    });
                    
                    $("#myPtag2").html(header+myTracking);
                    
                }
            });
        });
        
});

function getTekbeCompnayList(myKey,type){
	
	 $.ajax({
         type:"GET",
         dataType : "json",
         url:"http://info.sweettracker.co.kr/api/v1/companylist?t_key="+myKey,
         success:function(data){
                 console.log(myKey);
                 // 방법 1. JSON.parse 이용하기
                 let parseData = JSON.parse(JSON.stringify(data));
                  //console.log(parseData.Company); // 그중 Json Array에 접근하기 위해 Array명 Company 입력
                 
                 // 방법 2. Json으로 가져온 데이터에 Array로 바로 접근하기
                 let CompanyArray = data.Company; // Json Array에 접근하기 위해 Array명 Company 입력
                 //console.log(CompanyArray); 
                 
                 let myData="";
                 myData += ('<option></option>');
                 $.each(CompanyArray,function(key,value) {
                         myData += ('<option value='+value.Code+'>' +value.Name + '</option>');
                 });
                 if(type==1){
                	 $("#tekbeCompnayList1").html(myData);	 
                 }
                 else{
                	 $("#tekbeCompnayList").html(myData);
                 }
                 
         }
     });
}
</script>