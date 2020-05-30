<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 프로필 </title>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<script>

var userId = '${loginUser.userId}';
var adminNo = '${loginUser.adminNo}';
$(function() {
	initComponent();
	initData();
	initEvent();
});
</script>
<script>
var imgData;
var searchParams = {};


function initComponent() {
	$( "#profileTextUpload" ).prop( "disabled", true );
}


function initData() {
	
	$.ajax({
		url:'/profileView',
		data: {
			userId: userId
		},
		type:'get',
		success:function(data) {
			$('#profileImg').attr('src','displayFile?fileName='+data.data.imgUrl);
			$('#profileTextUpload').val(data.data.profile);
		}
	});
}
function initEvent() {
	$('#changeProfile').on('click', changeProfile);
	$('#ProfileUpload').on('click', ProfileUpload);
		
	$('#fileUpload').change(function(event){
		
	  	var file = $('#fileUpload')[0].files[0];
	  	var formData = new FormData();
	  	
	  	formData.append('file',file);
		
	  	$.ajax({
	  		url:'/uploadProfileImg',
	  		data:formData,
	  		dataType:'text',
	  		processData:false,
	  		contentType:false,
	  		type:'POST',
	  		success:function (data) {
	  			
	  			if ( checkImageType(data) ) {
	  				$('#profileImg').attr('src','displayFile?fileName='+data);
	  				imgData = data;
	  			}
	  		}
	  	});
		
	});
	
}

function ProfileUpload() {
	var profile = $('#profileTextUpload').val();
	var	imgUrl = imgData;
	
	if ( !imgUrl ) {
		imgUrl = $('#profileImg').attr('src');
		imgUrl = imgUrl.replace('displayFile?fileName=','');
	}
	$.ajax({
		url:'/profileUpdate',
		data:{
			profile:profile,
			imgUrl:imgUrl,
			userId:userId
		},
		type:'post',
		success:function(data) {
			alert('변경 되었습니다.');
		}
	});

}

function changeProfile() {
	$('#fileUpload').css('display','block');
	$( "#profileTextUpload" ).prop( "disabled", false );

	$('#changeProfile').css('display','none');
	$('#ProfileUpload').css('display','block');
	$('#profileText').css('display','none');
}

function checkImageType(fileName) {
	var pattern = /jpg$|gif$|png$|jpeg$/i;
	
	return fileName.match(pattern);
}

</script>
<%@ include file="/WEB-INF/views/common/navbar.jsp" %>
<section class="page-section bg-light" id="team" style="height:1053px;">
       <div class="container" style="margin-top:100px;">
           <div class="text-center">
           		<br><br>
               <h2 class="section-heading text-uppercase">현재 프로필</h2>
           	  <br><br>
           </div>
           <div class="row">
           <div style="width:250px; margin:auto;">
               <div class="col-lg-4">
                   <div class="team-member">
                       <img id='profileImg' class="mx-auto rounded-circle" src="" alt="" />
                       <input id='fileUpload' type='file' style="display:none;"/>
   	               	   <textArea id='profileTextUpload' style='width:250px; height:205px; disabled'></textArea>
                       <!-- <p id='profileT ext' class="text-muted"></p> -->
                	   <br>
                	   <div style="width:240px;">
	                       <button type="button" class="btn btn-primary" id="ProfileUpload" style="width:150px; display:none;">업로드</button>
	                	   <button type="button" class="btn btn-primary" id="changeProfile" style="width:150px; margin:auto;">변경하기</button>
                	   </div>
                   </div>
               </div>
           </div>
           </div>
     </div>
</section>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>