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
var adminNo = '${loginUser.adminNo}';
var searchParams = {};

$(function() {
	initComponent();
	initData();
	initEvent();
});
function initComponent() {
	 $('#datetimepicker').datetimepicker({
	        inline: true,
	        sideBySide: true
	 }); 
}
function initData() {
	
	var date = new Date();
	var month =  date.getMonth()+1;
	if ( month < 10 ) {
		month = "0"+month;
	}
	var reservationDate = date.getFullYear() + "-" + month;
	var param = {};
	param.reservationDate = reservationDate;
	param.adminNo = adminNo;
	goAjaxGet('/checkDayOff', param, function(result){
		var html = "";
		html += "<tr><th>이번달 휴무일</th></tr>";
		$(result).each(function(k,v){
			html += "<tr><td>"+v.dayOff+"</td></tr>";
		});
		$('#dayOffList').html(html);

		console.log(result);
	});
}
function initEvent() {
	$('#datetimepicker').unbind('change').change(function (event) {
		
		var reservationDate = event.target.value;
		reservationDate = reservationDate.substring(0,10)
		$('#day').val(reservationDate);
		searchParams.reservationDate = reservationDate;
		searchParams.adminNo = adminNo;
		
	
	});
	
	$('#dayOff').on('click',function(){
		if ( adminNo == null | adminNo == '' ) {
			alert("로그인 후 이용해주세요");
			return;
		}
		if ( searchParams.reservationDate == '' ) {
			alert('휴무 일을 지정해주세요');
			 return;
		}
		goAjaxPost('/insertDayOff',searchParams, function(result){
			if ( result.status == 'OK' ) {
				alert("휴무가 등록되었습니다");
				initData();
			}
		});
	});
}
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>

<section class="page-section bg-light" id="team" style="height:1053px;">
       <div class="container" style="margin-top:100px;">
           <div class="text-center">
           		<br><br>
               <h2 class="section-heading text-uppercase">휴무 설정</h2>
           	  <br><br>
           </div>
           <div class="row">
		 <p style="width:500px; margin-left:100px;">
            	<input type="text" id="datetimepicker">
	 			<input type="text" id="day"/>
	 			<button type="button" id="dayOff" class="btn-warning">휴무지정</button>
		 </p>
            <table id="dayOffList" border="1" style="width:500px;">
				
           </table>
           </div>
     		
     </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>