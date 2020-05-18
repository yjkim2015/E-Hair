<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
.footer {
 	position: absolute;

    left: 0;

    bottom: 0;

    width: 100%;

	padding: 15px 0;

	text-align: center;

}
</style>
</head>
<body>
<script>
var adminNo = ${adminNo};
var getContextPath = '${getContextPath}';
var reservationDate;

$(function(){
	initLayout();
	initData();
	initEvent();
});

function initLayout() {
	$('#datepicker').datepicker();

}

function initData() {
	goAjaxPost('/reservationList',{adminNo:adminNo, reservationDate:reservationDate}, function(result){
		$('#reserTb').html('');
		var html = '<tr>'+
   			'<th style="width:7%">예약번호</th>'+
   			'<th style="width:10%">예약자</th>'+
   			'<th style="width:10%">서비스이름</th>'+
			'<th style="width:8%">가격</th>'+
   			'<th style="width:43%">메모</th>'+
			'<th style="width:15%">예약날짜</th>'+
   			'<th style="width:7%">승인여부</th>'+
   			'</tr>';
		$(result.data).each(function(k,v) {
			html+='<tr>'+
					'<td>'+v.reservationNo+'</td>'+
					'<td>'+v.userName+'</td>'+
					'<td>'+v.serviceName+'</td>'+
					'<td>'+v.servicePrice+'</td>'+
					'<td>'+v.memo+'</td>'+
					'<td>'+v.reservationDate.replace('.0','')+'</td>'+
					'<td><button type="button" class="confirm" style="width:100%;" value="'+v.reservationNo+'">'+v.isConfirm+'</button></td>'+
					'</tr>';
		});
		$('#reserTb').html(html);
		$('.confirm').on('click',function(event){
			var reservationNo = this.value;
			param.reservationNo = reservationNo;
			/* goAjaxPost('/reservationConfirm', param, function(result) {
				
			}); */
		});
	});
}

function initEvent() {
	$('#search').on('click',function() {
		reservationDate = $('#datepicker').val();
		if ( reservationDate != '' ) {
			var dateSplit = reservationDate.split('/');
			reservationDate = dateSplit[2]+'-'+dateSplit[0]+'-'+dateSplit[1];
		}
		initData();
	});
	

}
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section class="page-section bg-light" id="team">
       <div class="container">
           <div class="text-center">
           		<br><br>
			<p>Date: <input type="text" id="datepicker">
			<button type="button" class="btn-primary" id="search">검색</button></p>
           </div>
           <div class="row">
           <table id="reserTb"border="1" style="width:1250px;">
           		
           </table>
           </div>
           </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>