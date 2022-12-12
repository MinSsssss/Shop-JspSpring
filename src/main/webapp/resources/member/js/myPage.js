$(document).ready(function(){
	$("#orderList").on("click",function(){
		location.href="/member/auth/orderList"
	})
	$("#wishList").on("click",function(){
		location.href="/member/auth/wishList"
	})
	$("#cart").on("click",function(){
		location.href="/member/auth/cart"
	})
	$("#qnaList").on("click",function(){
		location.href="/member/auth/qnaList"
	})
	$("#memberModify").on("click",function(){
		location.href="/member/auth/memberModify"
	})
	$("#memberDrop").on("click",function(){
		location.href="/member/auth/memberDrop"
	})
	
    $("#logoutBtn").on("click",function(){
        $("#logoutForm").submit();
    })
    $("#memberDropBtn").on("click",function(){
        

    // if(mem_pwd == undefined && mem_pwd==""){
    //     alert("비밀번호를 입력해주세요.")
    // }else{
    //     var mem_id = $("#mem_id").val();
    //     var mem_pwd = $("#mem_pwd").val();

    //     var param = {"mem_id":mem_id, "mem_pwd":mem_pwd};

    //     $.ajax({            
    //         async: true,
    //         type: 'POST',
    //         data: JSON.stringify(param),
    //         url: "/member/auth/memberDrop",
    //         dataType: "text",
    //         contentType: "application/json; charset=UTF-8",
    //         success: function(data) {                    
    //             alert("탈퇴가 처리되었습니다.");
    //             location.href="/member";
    //         },
    //         error: function(jqXHR, textStatus, errorThrown) {
    //             alert("ERROR : " + textStatus + " : " + errorThrown);
    //         }            
    //     })   

    // }
 
    // if(inputPass1 != null) {
    //     var trimPass1 = inputPass1.trim();
 
    //     if(trimPass1 != "" && trimPass1 != undefined) {            
    //         var inputPass2 = prompt("비밀번호를 다시 입력해주세요.");
    //         var trimPass2 = inputPass2.trim();
            
    //         if(trimPass1 == trimPass2) {
                
    //             var mem_id = $("#mem_id").val();
    //             var param = {"mem_id":memberId, "mem_pwd":trimPass1}
            
    //             $.ajax({            
    //                 async: true,
    //                 type: 'POST',
    //                 data: JSON.stringify(param),
    //                 url: "/member/auth/memberDrop",
    //                 dataType: "text",
    //                 contentType: "application/json; charset=UTF-8",
    //                 success: function(data) {                    
    //                     alert("탈퇴가 처리되었습니다.");
    //                     location.href="/member";
    //                 },
    //                 error: function(jqXHR, textStatus, errorThrown) {
    //                     alert("ERROR : " + textStatus + " : " + errorThrown);
    //                 }            
    //             })    
    //         } else alert("비밀번호가 일치하지 않습니다.");    
    //     } else {
    //         alert("비밀번호를 제대로 입력해주세요.");
    //     }
    // } 


        // $.ajax({
        //     url : "/member/auth/memberDrop",
        //     type : "post",
        //     dataType : "json",
        //     data : {"mem_pwd" : $("#mem_pwd").val()},
        //     success : function(data){
        //         if(data == 1){
        //             alert("비밀번호가 틀렸습니다.");
        //         }else if(data == 0){
        //             $("#memberDropForm").submit();
        //         }
        //     }
        // })

        $("#memberDropForm").submit();
    })

})