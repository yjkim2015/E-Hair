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

#starRating>li {
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
li.active, li.hover { color: blue; }
#starRating>li.active, #starRating>li.hover { color: orange; }

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
var service = {};
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
			service[value.serviceName] = value.serviceNo;
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
			
			if ( result.data >= 1 ) {
				alert(result.reason);
				$('#datepicker').val('');
			}
			
		});
	});
	
	$('#replyAddBtn').on('click', replyAdd);
	
}

function reservation() {
	
	
	searchparams.userId ='test';
	var memo = $('#memo').val();
	searchparams.memo = memo;
	
	var reservationDate = $('#datepicker').val();

	
	if ( reservationDate == '' ) {alert('날짜를 선택해주세요'); return false;}
	var serviceName = $('#menu1').text();
	if ( serviceName.includes('서비스 종류') ) { alert('서비스 종류를 선택해주세요'); return false;}
	
	reservationDate = reservationDate+ ":00";
	searchparams.reservationDate = reservationDate;
	searchparams.serviceNo = service[serviceName];

	
	goAjaxPost('/insertReservation', searchparams, function(result) {
		if ( result.data == 1) {
			alert('예약되었습니다.');
			$('#datepicker').val('');
		}
		else if ( result.data == 3 ){
			alert('당일 중복 예약은 불가합니다');
		}
		else {
			alert(result.reason);
		}
	});

}
function replyAdd() {
	
}

</script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li class="replyLi" data-rno={{reviewNo}} style="list-style-type:none;">
	<div class="well">
	<div class="media-heading">{{userId}}
	&nbsp;<small><i class="fa fa-clock-o"></i> {{prettifyDate insertDate}}</small>
	</div>
		<a class="pull-right btn btn-primary btn-outlined" name="modify_modal" id="modify_modal"
		data-toggle="modal" data-target="#modifyModal">Modify</a>
	<div class="timeline-body">{{reviewContent}} </div>
	
		
</div>
<hr>
</li>
{{/each}}

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
					<input class='form-control' type='text' placeholder='글쓴이' id='newReplyWriter' value="" >
					<div style="margin-top:15px; margin-bottom:15px;">
						<textarea rows="8"  id="newReplyText" class="form-control" placeholder="내용"></textarea>
					</div>
			</div>
			
		<div class="box-footer">
			<button type="button" class="btn btn-primary btn-outlined" id="replyAddBtn">
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

<div id="modifyModal" class="modal modal-primary fade" role="dialog">
	<div class="modal-dialog">
		
		<div class="modal-content" style="margin-top:300px;">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title"></h4>
			</div>
			<div class="modal-body" data-rno>
				<p><input type="text" id="replytext" class="form-control"></p>
			</div>
			<div class="modal-footer">
			
				<button type="button" class="btn btn-info" id="replyModBtn">
					수정
		    	</button>
				<button type="button" class="btn btn-danger" id="replyDelBtn">
					삭제
		    	</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">
					닫기
		    	</button>
			</div>
		</div>
	</div>
</div>

<script>
getPageList(adminNo);
var replyPage = 1;
function getPageList(page) {
	$.getJSON('/replies/'+adminNo+'/'+page, function(data) {
		console.log(data.list.length);
		
		var str = "";
		
		$("#reply_count").text(data.totalCount);
		printData(data.list,$("#repliesDiv"),$("#template"));
		
		printPaging(data.pageMaker,$(".pagination"));
		//$("#modifyModal").hide();
		$("#replycntSmall").html("[ " +data.pageMaker.totalCount +" ]")
	});
}


var printPaging= function(pageMaker,target){
	
	var str="";
	if(pageMaker.prev){
		str+= "<li style='border:solid 1px; margin-right:3px;'><a href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage,len=pageMaker.endPage;i<=len;i++)
		{
		var strClass= pageMaker.cri.page==i?'class=active':'';
		str+="<li style='border:solid 1px; margin-right:3px;'"+strClass+"><a href='"+i+"'>"+i+"</a></li>";
		}
	if(pageMaker.next){
		str+="<li style='border:solid 1px; margin-right:3px;' ><a href='"+(pageMaker.endPage +1)+"'> >> </a></li>";
	}
	target.html(str);
};

Handlebars.registerHelper("prettifyDate",function(timeValue){
	var dateObj= new Date(timeValue);
	var year= dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date= dateObj.getDate();
	return year+"/"+month+"/"+date;

});

var printData= function(replyArr,target,templateObject){
	var template= Handlebars.compile(templateObject.html());
	var html=template(replyArr);
	$(".replyLi").remove();
	target.after(html);

	/* for(var i=0;i<replyArr.length;i++){

		if(replyArr[i].replyer !="${login_id}" && replyArr[i].replyer != "${login_id2}"){
			$("a[name=modify_modal]").eq(i).hide();
		}
		
	} */
}

$(".pagination").on("click","li a",function(event){
	event.preventDefault();
	replyPage =$(this).attr("href");
	getPageList(replyPage);
});

$(".timeline").on("click",".replyLi",function(event){
	
	var reply=$(this);
	
	$("#replytext").val(reply.find('.timeline-body').text());
	$(".modal-title").html(reply.attr("data-rno"));
});

$("#replyAddBtn").on("click",function(){
	
	var replyerObj = $("#newReplyWriter");
	var replytextObj = $("#newReplyText");
	var replyer = replyerObj.val();
	var replytext= replytextObj.val();
	if(replyer==""){
		alert("로그인 후 이용이 가능합니다.");
		return;
	}
	if(replytext==""){
		alert("댓글을 입력해주세요.");
		return;
	}
	$.ajax({
		type:'post',
		url:'/replies/',
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({adminNo:adminNo,userId:replyer,reviewContent:replytext}),
		success:function(result){
			if(result.includes('OK')){
				alert("등록 되었습니다.");
				replyPage=1;
				getPageList(replyPage);
			
				replytextObj.val("");
			}
		
		}});
});

$("#replyModBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'put',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"PUT"},
		dataType:'text',
		processData:false,
		data: JSON.stringify({reviewContent:replytext}),
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("수정 되었습니다.");
				getPageList(replyPage);
				
			}
		
		}});
});


$("#replyDelBtn").on("click",function(){
	
	var rno = $(".modal-title").html();
	var replytext=$("#replytext").val();
	
	$.ajax({
		type:'delete',
		url:'/replies/'+rno,
		headers:{
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"DELETE"},
		dataType:'text',
		processData:false,
		success:function(result){
			console.log("result: "+result);
			if(result == 'SUCCESS'){
				alert("삭제 되었습니다.");
				getPageList(replyPage);
				
			}
		
		}});
});

</script>
</body>
</html>