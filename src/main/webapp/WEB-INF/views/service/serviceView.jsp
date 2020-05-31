<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>

</head>
<body>
<script>

  var shopNo = '${loginUser.shopNo}';
  var adminNo = '${loginUser.adminNo}';
  var searchParams = {};

  $(function () {
    initData();
    initEvent();
  });


function initData() {
	var param = {};
	param.shopNo = shopNo;
	param.adminNo = adminNo;
	goAjaxGet('/allService', param, function(result){
		var html = "";
		html = "<tr><th>등록 된 서비스명</th>"+
			"<th>가격</th>"+
			"<th>메모</th>"+
			"</tr>";
		$(result).each(function(k,v){
			html += "<tr>"+
				"<td>"+v.serviceName+"</td>"+
				"<td>"+v.servicePrice+"</td>"+
				"<td>"+v.memo+"</td>"+
			"</tr>"			
		});	
		$("#serviceList").html(html);
	});
}

function initEvent() {
	$('#register').on('click', function(){
		var serviceName = $('#serviceName').val();
		var servicePrice = $('#servicePrice').val();
		var memo = $('#memo').val();
		var shopNo = $('#shopNo').val();
		
		var searchParam = {};
		
		if ( shopNo == null || shopNo == '' ) {
			alert("로그인 후 이용해주세요");
			return;
		}
			
			
		if ( serviceName == null || serviceName == '' ) {
			alert("서비스명을 입력해주세요 ");
			return;
		}
		
		if ( servicePrice == null || servicePrice == '' ) {
			alert("가격을 입력해주세요");
		}
			 
		searchParam.serviceName 	= serviceName;
		searchParam.servicePrice 	= servicePrice;
		searchParam.memo			= memo;
		searchParam.shopNo		 	= shopNo;
		
		goAjaxPost('/insertService', searchParam, function(result){
			
			if ( result.status == 'OK' ) {
				alert('서비스가 등록되었습니다');
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
               <h2 class="section-heading text-uppercase">서비스 관리</h2>
           	  <br><br>
           </div>
           <div class="row">
           <form id="serviceForm" style="width:250px; margin-left:200px;">
		 	<label for="serviceName">서비스명</label><input type="text" name="serviceName" id="serviceName"/>
		 	<label for="servicePrice">가격</label><input type="text" name="servicePrice"id="servicePrice"/>
		 	<label for="memo">메모</label><input type="text" id="memo" name="memo">
		 	<input type="hidden" id="shopNo" name="shopNo" value="${loginUser.shopNo}">
		 	<button type="button" class="btn-primary" id="register" style="margin-top:10px;">서비스 등록</button>
           </form>
     		<table id="serviceList" border="1" style="width:500px;">
					
           </table>
           </div>
     </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>