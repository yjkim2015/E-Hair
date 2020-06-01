<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<body>
<script>
var userId = '${loginUser.userId}';
var searchParams = {};


$(function () {
  initData();
  initEvent();
});

function initData() {
	
	var param = {};
 	param.userId = userId;
	
 	goAjaxGet('/mypage/myReservation', param , function(result) {
 		var html = "";
 		html = '<tr>'+
			'<th style="width:15%;">예약일자</th>'+
			'<th style="width:10%;">서비스명</th>'+
			'<th style="width:10%;">가격</th>'+
			'<th style="width:15%;">디자이너</th>'+
			'<th style="width:10%;">샵이름</th>'+
			'<th style="width:20%;">메모</th>'+
			'<th style="width:10%;">승인여부</th>'+
			'<th style="width:10%;">예약취소</th>'+
		'</tr>';
 		$(result.data).each(function(k,v) {
 			v.reservationDate = v.reservationDate.replace('.0','');
 			html += "<tr>"+
 					"<td>"+v.reservationDate+"</td>"+
 					"<td>"+v.serviceName+"</td>"+
 					"<td>"+v.servicePrice+"</td>"+
 					"<td>"+v.designerName+"</td>"+
 					"<td>"+v.shopName+"</td>"+
 					"<td>"+v.memo+"</td>"+
 					"<td>"+v.isConfirm+"</td>"+
 					"<td><button type='button' class='cancle' value="+v.reservationNo+">예약취소</button></td>"+
 					"</tr>"
 		});
 		$('#reservationList').html(html);
 		$(".cancle").on('click',function(event){
 			
 			var reservationNo = this.value;
 			
 			var param = {};
 			param.reservationNo = reservationNo;
 			
 			goAjaxPost('/mypage/deleteReservation', param , function(result){
 				
 				if ( result.status == 'OK' ) {
 					alert("예약 취소 되었습니다");
 					initData();
 				}
 			});
 		});
 	});
}

function initEvent() {
	
}
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<section class="page-section" id="contact" style="height:733px;">
    <div class="container">
        <div class="text-center">
        	<table id="reservationList" style="width:1200px; margin-top:100px; color:white;">
        		
        	</table>
        </div>
        
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>