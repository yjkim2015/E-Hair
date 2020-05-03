<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js" 
        integrity="sha384-nvAa0+6Qg9clwYCGGPpDQLVpLNn0fRaROjHqs13t4Ggj3Ez50XnGQqc/r8MhnRDZ" 
        crossorigin="anonymous"> 
</script>-->

<style>
ul {
  list-style: none;
  padding: 0;
}

li {
  display: inline-block;
  font-size: 40px;
  color: #ccc;
  cursor: pointer;
}
.dropdown-menu > li {
	font-size:20px;
	display:block;
}
.dropdown-menu > li > a{
	color:blue;
}
li.active, li.hover { color: orange; }

ul.hover li.active:not(.hover) { color: #ccc }
</style>
</head>
<body>
<script type="text/javascript">
var adminNo = '${adminNo}';
var getContextPath = '${getContextPath}';
var searchparams = {};
var dayOffList = [];
$(function(){
	initComponent();
	initEvent();
});
</script>
<script>
function initComponent() {
	$('#datepicker').datetimepicker();

	$('#starRating').starRating();
	var param = {};
	param.adminNo = adminNo;
	goAjaxGet('/checkDayOff', param, function(result){
		$(result).each(function(key, value){
			var dayOffSplit = value.dayOff.split('-');
			dayOffList.push(dayOffSplit[0]+"/"+dayOffSplit[1]+"/"+dayOffSplit[2]);
		});
	});
	
	goAjaxGet('/allService',null, function(result){
		$(result).each(function(key, value) { 
			$('.dropdown-menu').append('<li role="presentation"><a role="menuitem" tabindex="-1" href="#">'+value.serviceName+'</a></li>');
		});
		$('.dropdown-menu li > a').bind('click',function (e) {
		    var html = $(this).html();
		    
		    $('#menu1').text(html);
		});
	});
	
	$.ajax({
		url:'/profileView',
		data: {
			adminNo: adminNo
		},
		type:'get',
		success:function(data) {
			$('#mainImg').attr('src','/displayFile?fileName='+data.data.imgUrl);
			$('#profile').text(data.data.name +"\n" + data.data.sex + "\n" + data.data.profile);
		}
	});
}

function initEvent() {
	$('#reservation').on('click', reservation);
	
	$('#datepicker').unbind('change').change(function (event) {
		
		
		var reservationDate = event.target.value;
		reservationDate = reservationDate+ ":00";
		searchparams.reservationDate = reservationDate;
		searchparams.adminNo = adminNo;
		
		$(dayOffList).each(function(key,value){
			if ( reservationDate.includes(value) ) {
				alert('해당 요일은 디자이너의 휴무일입니다.');
				$('#datepicker').val('');
				return false;
			}
		});
		goAjaxPost('/checkReservation', searchparams, function(result) {
			
			if ( result.data == 1 ) {
				alert(result.reason);
			}
		});
	});
	
}

function reservation() {
	
	
	searchparams.userId ='test';
	var memo = $('#memo').val();
	var serviceName = $('#menu1').text();
	searchparams.memo = memo;
	
	if ( serviceName == '서비스 종류' ) { alert('서비스 종류를 선택해주세요'); return false;}
	searchparams.serviceName = serviceName;
	var reservationDate = $('#datepicker').val();
	if ( reservationDate == '' ) {alert('날짜를 선택해주세요'); return false;}
	reservationDate = reservationDate+ ":00";
	searchparams.reservationDate = $('#datepicker').val();
	
	goAjaxPost('/insertReservation', searchparams, function(result) {
		console.log(result);
	});
	

}
</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<div id="content-wrapper" style="margin-top:70px;">
        <section id="blog" class="white">
            <div class="container"> 
            <div>           
                <div class="row">
                   <aside class="col-sm-4 col-sm-push-8"> 
						<div class="widget tags masthead-subheading">
                            <h3 class="widget-title section-subheading text-muted">
                             	고객 만족도
                             	<ul id="starRating"></ul>
                             	
                            </h3>
                        </div>
						 <p>Date: <input type="text" id="datepicker"></p>
						 <div class="dropdown">
						    <button class="btn btn-info dropdown-toggle" id="menu1" type="button" data-toggle="dropdown">서비스 종류
						    <span class="caret"></span></button>
						    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
						   	  
						    </ul>
					  	</div>
					  	<br>
					  	<textArea id="memo" style="width:250px; margin-bottom:15px; display:block;"></textArea>
						 <button id='reservation' type='button' class="btn btn-primary btn-outlined">예약하기</button>			     
						
                    </aside>       
                    <div class="col-sm-8 col-sm-pull-4">
                        <div class="blog">
                            <div class="blog-item">
                                <div class="blog-featured-image">
                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				   		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				    
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item active">
							<a href="#" onclick="dirImg('1636095');" title="사진을 클릭하시면 크게 확인하실 수 있습니다." style="line-height: 301px; float:left; margin-right:150px;">
 							<img id='mainImg' src="" class="img-responsive img-blog"  style="width:250px;">                
							</a>
							<div class="widget categories">
                            <h3 class="widget-title masthead-subheading">
							</h3>
                            <div class="row">
                                
                                <div class="col-sm-6 masthead-subheading">
                                    <ul class="arrow">
                                       <li id='profile'></li>
                                    </ul>
                                </div>
                            </div>                     
                        </div><!--/.categories-->
				    </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				    </div>
                                    
                  <div class="overlay" style="display:none;">
                         <a class="preview btn btn-outlined btn-primary" href="blog-item.html" rel="prettyPhoto"><i class="fa fa-link"></i></a>
                  </div>
                 </div> 
                 <div class="blog-content">
                     
                     <hr>
               

   <hr>
                           
<hr>

<div id="comments">
  <div id="comments-list">
   <ul class="timeline" style="margin-top:10px;">
		<li class="time-label" id="repliesDiv" style="margin-bottom:30px;list-style-type:none; margin-left:-39px; font-size:20px; font-weight:700; height:30px;"><span class="bg-green" style="float:left">
		<i class="fa fa-comments bg-blue"></i>
		댓글
	     </span><p id="reply_count" style="margin-left:10px;"></p></li>
	</ul>
	<div class="text-center">
		<ul id="pagination" class="pagination pagination-sm no-margin">
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
		
		<div class="box box-success">
			<div class="box-header">
				<h3 class="box-title">
				댓글 등록
		    	 </h3>
			</div>
			<div class="box-body">
					<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value="" readonly>
					<div style="margin-top:15px; margin-bottom:15px;">
						<textarea rows="8"  id="newReplyText" class="form-control" placeholder="내용"></textarea>
					</div>
			</div>
			
		<div class="box-footer">
			<button type="submit" class="btn btn-primary btn-outlined" id="replyAddBtn">
				등록
	    	 </button>
		</div>
		</div>
		
		</div>
	</div>                           
       	</div>
    </div>
</div>

        </div>
    </div>
</div>
    </div>
    </div>
        <div>
    	<!-- <h3>근처 유적지</h3> -->

      <ul class="portfolio-items col-3 isotope fade-up" id="li_near">
   <%--  <c:forEach items="${near_historic}" var="Historic_siteVO">
          <li class='portfolio-item apps seoul isotope-item'  style="margin-right:10px;">

	
     <img class="img-responsive img-blog" name="near_image" style="" src="${Historic_siteVO.first_image}">
     <h5 style="overflow:hidden; width:100%;">${Historic_siteVO.site_name}</h5>
     </li>
    </c:forEach> --%>
    </ul>
    </div>
</section><!--/#blog-->
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>